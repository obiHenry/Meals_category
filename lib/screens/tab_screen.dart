import './favorite_screen.dart';
import '../widgets/main_drawer.dart';

import './category_screen.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Map<String, Object>> _pages = [
    {
      'page': CategoryScreen(),
      'title': 'Categories',
    },
    {
      'page': FavoriteScreen(),
      'title': 'Your favorites',
    },
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.favorite),
            title: Text('favorite'),
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
      ),
    );

// this is basically for adding a tapbar at top of the screen so is either u use this or u use the above method
    //  DefaultTabController(
    //   initialIndex: 0,
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text('meals'),
    //       bottom: TabBar(

    //         tabs: [
    //           Tab(
    //             icon: Icon(Icons.category),
    //             text: 'categories',
    //           ),
    //           Tab(
    //             icon: Icon(Icons.favorite),
    //             text: 'Favorite',
    //           ),
    //         ],
    //       ),
    //     ),
    //     drawer: MainDrawer(),
    //     body: TabBarView(
    //       children: [
    //         CategoryScreen(),
    //         FavoriteScreen(),
    //       ],
    //     ),
    //   ),
    // );
  }
}
