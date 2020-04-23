import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vin/models/wine.dart';
import 'package:vin/screens/home/wine_list.dart';
import 'package:vin/services/auth.dart';
import 'package:vin/services/database.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Wine>>.value(
      value: DatabaseService().wines,
      child: Scaffold(
        backgroundColor: Colors.pink[100],
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
           child: Icon(Icons.photo_camera),
           backgroundColor: Colors.pink[600],
           
          ),
        appBar: AppBar(
          title: Text('Vin'),
          backgroundColor: Colors.pink[700],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Log out'),
              onPressed : () async {
                await _auth.signOut();
              }
            )
          ],
        ),
        body: WineList(),
      )
    );
  }
}