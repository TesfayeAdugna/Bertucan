import 'package:bertucanfrontend/shared/themes/app_theme.dart';
import 'package:bertucanfrontend/ui/pages/gbv/gbv_screen.dart';
import 'package:bertucanfrontend/ui/pages/home/home_screen.dart';
import 'package:bertucanfrontend/ui/pages/home/profile_screen.dart';
import 'package:bertucanfrontend/ui/pages/srh/srh_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [
          HomeScreen(),
          SrhScreen(),
          GbvPage(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        selectedItemColor: AppTheme.primaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.article_outlined), label: 'hospital'),
          BottomNavigationBarItem(
              icon: Icon(Icons.error_outline), label: 'articles'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined), label: 'profile'),
        ],
        currentIndex: _currentIndex,
        onTap: _changePage,
      ),
    );
  }

  void _changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
    _controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
    );
  }
}
