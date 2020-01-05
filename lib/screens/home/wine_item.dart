import 'package:flutter/material.dart';
import 'package:vin/models/wine.dart';
import 'package:vin/shared/constants.dart';

class WineItem extends StatelessWidget {
  final Wine wine;
  WineItem({this.wine});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: wineColors[wine.color],
          ),
          title: Text(wine.name),
          subtitle: Text('${wine.winery} - ${wine.year}'),
        ),
      ),
    );
  }
}