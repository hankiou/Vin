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

    return ListView.builder(
      itemCount: comments.length,
      itemBuilder: (context, index) {
        return CommentItem(comment: comments[index]);
      },
    );
  }
}