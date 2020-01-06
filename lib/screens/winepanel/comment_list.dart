import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vin/models/comment.dart';
import 'package:vin/models/wine.dart';
import 'package:vin/screens/home/wine_item.dart';
import 'package:vin/screens/home/wine_list.dart';
import 'package:vin/screens/winepanel/comment_item.dart';

class CommentList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final comments = Provider.of<List<Comment>>(context);

    return Container(
      
      margin: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 20.0),
      child: ListView.builder(
        itemCount: comments.length,
        itemBuilder: (context, index) {
          return CommentItem(comment: comments[index]);
        },
      ),
    );
  }
}