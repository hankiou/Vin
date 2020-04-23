import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:vin/models/comment.dart';
import 'package:vin/models/wine.dart';
import 'package:vin/screens/winepanel/winepanel.dart';
import 'package:vin/services/database.dart';
import 'package:vin/shared/constants.dart';
import 'package:vin/shared/rating.dart';

class PostComment extends StatefulWidget {

  final Wine wine;
  PostComment({ this.wine });

  @override
  _PostCommentState createState() => _PostCommentState(wine: wine);
}

class _PostCommentState extends State<PostComment> {
  

  final Wine wine;
  _PostCommentState({this.wine});

  final _formKey = GlobalKey<FormState>();
  String statementField = '';
  var rating = 0.0;
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        backgroundColor: Colors.pink[700],
        elevation: 0.0,
        title: Text('Vin: Rate'),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.all(20.0),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SmoothStarRating(
                    allowHalfRating: false,
                    starCount: 5,
                    rating: rating,
                    size: 40.0,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.star_half,
                    defaultIconData: Icons.star_border,
                    color: Colors.pink[700],
                    borderColor: Colors.pink[700],
                    spacing:0.0,
                    onRatingChanged: (value) {
                      setState(() {
                        rating = value;
                      });
                    }
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      fillColor: Colors.pink[50],
                      filled: true,
                      hintText: 'Give a feedback on this wine',

                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink[600]),
                      )
                    ),

                    validator: (val) => val.isEmpty || val.length > 150 ? 'Please comment between 1 and 150 chars' : null,
                    onChanged: (val) {
                      setState(() => statementField = val);
                    },
                  ),
                  SizedBox(height: 20.0,),
                  RaisedButton(
                    color: Colors.pink[400],
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if(_formKey.currentState.validate()){
                        DatabaseService().postComment(Comment(
                          user_id: '',
                          wine_id: wine.uid,
                          statement: statementField,
                          grade: rating
                        ));

                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              )
            )
          ]
        )
      ),
    );
  }
}