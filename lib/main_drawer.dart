import 'package:flutter/material.dart';
import 'package:meals/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tabHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black),
      ),
      onTap: tabHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              color: Theme.of(context).accentColor,
              height: 120,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              child: Text('Cooking Up!',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).primaryColor)),
            ),
            SizedBox(
              height: 20,
            ),
            buildListTile('Meals', Icons.restaurant, () {
              Navigator.pushReplacementNamed(context, '/');
            }),
            buildListTile('Filters', Icons.settings, () {
              Navigator.pushReplacementNamed(context, FiltersScreen.routeName);
            })
          ],
        ),
      ),
    );
  }
}
