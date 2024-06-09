import 'package:flutter/material.dart';

import 'package:hotstar/pages/page2/page2.dart';
import 'package:hotstar/pages/page3/tabbar.dart';
import 'package:hotstar/pages/page4/fourthpage.dart';
import 'package:hotstar/pages/page5/loginpage.dart';
import 'package:hotstar/pages/page1/page1.dart';

class BottomNavigationBarPage extends StatefulWidget {
  const BottomNavigationBarPage({super.key});

  @override
  State<BottomNavigationBarPage> createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage> {
  final List<Widget> pages = [
    const Homepage(),
    const SecondPage(),
    const ViewTabBar(),
    const DownloadPage(),
    const LogPage(),
  ];
  int currentpage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentpage],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentpage,
        onTap: (value) {
          setState(() {
            currentpage = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.thunderstorm), label: "New&Hot"),
          BottomNavigationBarItem(
              icon: Icon(Icons.download), label: "Downloads"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "My Space"),
        ],
      ),
    );
  }
}
