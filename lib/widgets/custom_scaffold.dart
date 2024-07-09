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
  // ..loadRequest(Uri.parse('https://flutter.dev'));

  CustomScaffold({super.key});

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  int _currentIndex = 0;
  bool _showWebview = false;

  final TextEditingController _searchTextController =
      TextEditingController.fromValue(
          const TextEditingValue(text: "https://flutter.dev"));

  late List<ScreenConfig> _screens;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void onSearch() {
    if (_searchTextController.value.text.isEmpty) {
      return;
    }
    widget._webviewController
        .loadRequest(Uri.parse(_searchTextController.value.text));
    setState(() {
      _showWebview = true;
    });
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
  void initState() {
    super.initState();
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
  }

  @override
  Widget build(BuildContext context) {
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
