import 'package:flutter/material.dart';
import 'package:vin/models/comment.dart';
import 'package:vin/models/wine.dart';
import 'package:vin/screens/winepanel/winepanel.dart';
import 'package:vin/shared/constants.dart';
import 'package:vin/shared/rating.dart';

class CommentItem extends StatelessWidget {
  final Comment comment;
  CommentItem({this.comment});
  
  @override
  Widget build(BuildContext context) {
    // return Padding(
    //   padding: EdgeInsets.only(top: 8.0),
    //   child: Card(
    //     margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
    //     child: ListTile(
    //       title: Text(comment.user_id),
    //       subtitle: Text(comment.statement),
    //     ),
    //   ),
    // );


    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      padding: EdgeInsets.all(20.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Rating(rating: comment.grade),
          Text('${comment.statement}',
            style: TextStyle(fontSize: 17,)
          ),
        ]
      )
    );
  }
}