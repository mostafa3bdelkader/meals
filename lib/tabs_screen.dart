import 'package:flutter/material.dart';

import 'package:meals/CategoryScreen.dart';
import 'package:meals/meal.dart';
import 'favorites_screen.dart';
import 'main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  int selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'title': 'Categories', 'Screen': CategoryScreen()},
      {
        'title': 'Your Favorites',
        'Screen': FavoritesScreen(widget.favoriteMeals)
      }
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[selectedPageIndex]['title']),
      ),
      body: _pages[selectedPageIndex]['Screen'],
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: selectedPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text('Categories')),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text('Favorites'))
        ],
      ),
    );
  }
}
