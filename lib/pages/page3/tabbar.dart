import 'package:flutter/material.dart';
import 'package:hotstar/pages/page3/page3.dart';

class ViewTabBar extends StatefulWidget {
  const ViewTabBar({super.key});

  @override
  State<ViewTabBar> createState() => _ViewTabBarState();
}

class _ViewTabBarState extends State<ViewTabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(5.0),
            child: TabBar(
                dividerColor: Colors.black,
                labelColor: Color.fromARGB(255, 255, 255, 255),
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.white,
                labelStyle:
                    TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                unselectedLabelStyle:
                    TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                tabs: [
                  Tab(
                    text: 'Coming Soon',
                  ),
                  Tab(
                    text: 'Free-Newly Added',
                  ),
                ]),
          ),
        ),
        body: const TabBarView(children: [
          ThirdPage(),
          ThirdPage(),
        ]),
      ),
    );
  }
}
