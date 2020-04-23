import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vin/models/wine.dart';
import 'package:vin/screens/home/wine_item.dart';

class WineList extends StatefulWidget {
  @override
  _WineListState createState() => _WineListState();
}

class _WineListState extends State<WineList> {
  @override
  Widget build(BuildContext context) {

    final wines = Provider.of<List<Wine>>(context);
    
    return ListView.builder(
      itemCount: wines.length,
      itemBuilder: (context, index) {
        return WineItem(wine: wines[index]);
      },
    );
  }
}