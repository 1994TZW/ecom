import 'package:ecom/widget/theme.dart';
import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  final double value;

  const RatingWidget({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      padding: const EdgeInsets.only(top: 3, bottom: 3, left: 4, right: 4),
      decoration: BoxDecoration(
          color: primaryColor, borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.star, color: ratingColor, size: 11),
          const SizedBox(width: 3),
          Text('$value',
              style: const TextStyle(color: backgroundColor, fontSize: 12)),
        ],
      ),
    );
  }
}
