import 'package:flutter/material.dart';

import 'placeholder_widget.dart';
import 'theme.dart';

class ProductPlaceholderRow extends StatelessWidget {
  const ProductPlaceholderRow({super.key});

  @override
  Widget build(BuildContext context) {
    double itemSize = MediaQuery.of(context).size.width / 2 - 16 - 8;

    return PlaceholderWiget(
      linearGradient: placeholderGradient,
      child: SizedBox(
        width: itemSize,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: itemSize,
              height: itemSize,
              child: Card(
                  elevation: 0, color: placeHolderColor, child: Container()),
            ),
            Container(
              padding: const EdgeInsets.only(top: 5),
              child: Container(
                  margin: const EdgeInsets.only(left: 5, right: 5),
                  color: placeHolderColor,
                  height: 15),
            ),
            Container(
                padding: const EdgeInsets.only(top: 2),
                child: Container(
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    color: placeHolderColor,
                    width: itemSize - 50,
                    height: 13))
          ],
        ),
      ),
    );
  }
}
