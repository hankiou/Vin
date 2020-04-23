import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vin/models/comment.dart';
import 'package:vin/models/wine.dart';
import 'package:vin/screens/winepanel/comment_list.dart';
import 'package:vin/screens/winepanel/post_comment.dart';
import 'package:vin/services/database.dart';
import 'package:vin/shared/constants.dart';

class WinePanel extends StatelessWidget {

  final Wine wine;
  WinePanel({ this.wine });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          backgroundColor: Colors.pink[100],
          appBar: AppBar(
            backgroundColor: Colors.pink[700],
            elevation: 0.0,
            title: Text('Vin'),
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.edit),
                label: Text('Rate', ),
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PostComment(wine: wine))
                  );
                },
              )
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(20.0),
                padding: EdgeInsets.all(20.0),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('${wine.name}',
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)
                    ),
                    Text('${wine.winery}',
                      style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic)
                    ),
                    Text('${wine.year}',
                      style: TextStyle(fontSize: 20,)
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 10.0,
                          backgroundColor: wineColors[wine.color],
                        ),
                        Text('  '+wineColorNames[wine.color],
                          style: TextStyle(fontSize: 18)
                        ),
                      ]
                     

                    ),
                    SizedBox(height: 20.0,),
                    Text('${wine.description}',
                      style: TextStyle(fontSize: 15,)
                    ),
                  ]
                )
              ),
              //PostComment(),
              Expanded(
                child: StreamProvider<List<Comment>>.value(
                  value: DatabaseService().commentListforWine(wine.uid),
                  child: CommentList()
                ),
              )
            ]
          ),
            
        )
    );
  }
}