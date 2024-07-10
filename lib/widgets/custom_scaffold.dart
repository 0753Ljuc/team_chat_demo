import 'package:flutter/material.dart';
import 'package:team_chat_demo/screens/Finding/finding_screen.dart';
import 'package:team_chat_demo/screens/contacts/contact_screen.dart';
import 'package:team_chat_demo/screens/profile/profile_screen.dart';
import 'package:team_chat_demo/screens/team_chat/team_chat_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ScreenConfig {
  final Widget screen;
  final BottomNavigationBarItem bottomBar;
  Widget? leading;

  ScreenConfig({required this.screen, required this.bottomBar, this.leading});
}

class CustomScaffold extends StatefulWidget {
  final WebViewController _webviewController = WebViewController();

  CustomScaffold({super.key});

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  int _currentIndex = 0;
  bool _showWebview = false;
  String? _textError;

  final TextEditingController _searchTextController =
      TextEditingController.fromValue(
          const TextEditingValue(text: "https://flutter.dev"));

  late List<ScreenConfig> _screens;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void onTextChanged(String text) {
    if (_textError != null && _textError!.isNotEmpty) {
      setState(() {
        _textError = null;
      });
    }
  }

  void onSearch() {
    if (_searchTextController.value.text.isEmpty) {
      return;
    }
    try {
      widget._webviewController
          .loadRequest(Uri.parse(_searchTextController.value.text));
      setState(() {
        _textError = null;
        _showWebview = true;
      });
    } catch (e) {
      setState(() {
        _textError = "Invalid url!";
      });
    }
  }

  Future<void> exitWebview() async {
    var canGoBack = widget._webviewController.canGoBack();
    if (await canGoBack) {
      widget._webviewController.goBack();
    } else {
      setState(() {
        _showWebview = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _screens = [
      ScreenConfig(
        screen: const TeamChatScreen(),
        bottomBar: const BottomNavigationBarItem(
          icon: Icon(Icons.chat_rounded),
          label: 'Team Chat',
        ),
      ),
      ScreenConfig(
          screen: const ContactScreen(),
          bottomBar: const BottomNavigationBarItem(
            icon: Icon(Icons.contact_page_outlined),
            label: '通讯录',
          )),
      ScreenConfig(
        screen: FindingScreen(
          onSearch: onSearch,
          onChanged: onTextChanged,
          errorText: _textError,
          searchTextController: _searchTextController,
        ),
        bottomBar: const BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: '发现',
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: exitWebview,
        ),
      ),
      ScreenConfig(
          screen: const ProfileScreen(),
          bottomBar: const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '我',
          )),
    ];
    var screen = _screens[_currentIndex];
    return Scaffold(
      appBar: AppBar(
          title: screen.bottomBar.label == "我"
              ? null
              : Text(screen.bottomBar.label!),
          leading: _showWebview ? screen.leading : null),
      body: !_showWebview
          ? screen.screen
          : WebViewWidget(controller: widget._webviewController),
      bottomNavigationBar: _showWebview
          ? null
          : BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _currentIndex,
              onTap: _onTabTapped,
              selectedItemColor: Colors.teal,
              items: _screens.map((v) => v.bottomBar).toList()),
    );
  }
}
