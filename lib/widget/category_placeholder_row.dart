import 'package:flutter/material.dart';

import 'placeholder_widget.dart';
import 'theme.dart';

class CategoryPlaceholderRow extends StatelessWidget {
  const CategoryPlaceholderRow({super.key});

  @override
  Widget build(BuildContext context) {
    double itemSize = MediaQuery.of(context).size.width / 2 - 16 - 8;

    return PlaceholderWiget(
      linearGradient: placeholderGradient,
      child: SizedBox(
        width: itemSize,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: itemSize,
              height: itemSize,
              child:
                  Card(elevation: 0, color: placeHolderColor, child: Container()),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Container(
                margin: const EdgeInsets.only(left: 5, right: 5),
                color: placeHolderColor,
                height: 15
              ),
            )
          ],
        ),
      ),
    );
  }
}
