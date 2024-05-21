import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hungry_hund/core/app_color.dart';

class StarRatingBar extends StatelessWidget {
  final double score;
  final double itemSize;

  const StarRatingBar({
    super.key,
    required this.score,
    this.itemSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      itemPadding: EdgeInsets.zero,
      itemSize: itemSize,
      initialRating: score,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      glow: false,
      ignoreGestures: true,
      itemBuilder: (_, __) => Image.asset(
        'assets/images/logo.png',
        width: itemSize,
        height: itemSize,
        color: AppColor.lightOrange,
      ),
      onRatingUpdate: (rating) {},
    );
  }
}
