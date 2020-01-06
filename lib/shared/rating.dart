import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Rating extends StatelessWidget {

  final rating;
  Rating({this.rating});
  
  @override
  Widget build(BuildContext context) {
    return SmoothStarRating(
      allowHalfRating: false,
      starCount: 5,
      rating: rating,
      size: 40.0,
      filledIconData: Icons.star,
      halfFilledIconData: Icons.star_half,
      defaultIconData: Icons.star_border,
      color: Colors.pink[700],
      borderColor: Colors.pink[700],
      spacing:0.0
    );
  }
}