import 'package:flutter/material.dart';
import 'package:hotstar/pages/seasonpage/tileseson.dart';

class TabbarViewModel extends StatelessWidget {
  const TabbarViewModel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            indicatorColor: Colors.white,
            unselectedLabelStyle: TextStyle(color: Colors.grey),
            labelStyle: TextStyle(color: Colors.white),
            dividerColor: Colors.black,
            tabs: [
              Tab(
                text: 'Season 1',
              ),
              Tab(
                text: 'Season 2',
              ),
              Tab(
                text: 'Season 3',
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 400,
            child: TabBarView(
              children: [
                Center(
                  child: SeasonTileBar(),
                ),
                Center(
                  child: SeasonTileBar(),
                ),
                Center(
                  child: SeasonTileBar(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
