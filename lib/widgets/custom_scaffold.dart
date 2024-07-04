import 'package:flutter/material.dart';
import 'package:team_chat_demo/contacts/contact_screen.dart';
import 'package:team_chat_demo/wechat/wechat_screen.dart';

class CustomScaffold extends StatefulWidget {
  const CustomScaffold({super.key});

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

List<(Widget, BottomNavigationBarItem)> _screens = [
  (
    WechatScreen(),
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: '微信',
    )
  ),
  (
    const ContactScreen(),
    const BottomNavigationBarItem(
      icon: Icon(Icons.contact_page_outlined),
      label: '通讯录',
    )
  ),
  (
    const SearchScreen(),
    const BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: '发现',
    )
  ),
  (
    const ProfileScreen(),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: '我',
    )
  ),
];

class _CustomScaffoldState extends State<CustomScaffold> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_currentIndex].$2.label!),
      ),
      body: _screens[_currentIndex].$1,
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          selectedItemColor: Colors.teal,
          items: _screens.map((v) => v.$2).toList()),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('SearchScreen'),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('ProfileScreen'),
    );
  }
}
