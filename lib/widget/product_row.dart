import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom/vo/product.dart';
import 'package:ecom/widget/util.dart';
import 'package:flutter/material.dart';
import 'rating_widget.dart';
import 'theme.dart';

class ProductRow extends StatelessWidget {
  final Product product;
  const ProductRow(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    double itemSize = MediaQuery.of(context).size.width / 2 - 16 - 8;

    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context,
        //     CupertinoPageRoute(
        //         builder: (context) => ProductList(category: product)));
      },
      child: SizedBox(
        width: itemSize,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                SizedBox(
                  width: itemSize,
                  height: itemSize,
                  child: Card(
                    color: cardBackgroundColor,
                    child: product.thumbnail == ''
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(3),
                            child: const FadeInImage(
                              placeholder: AssetImage('assets/logo.png'),
                              image: AssetImage('assets/logo.png'),
                              fit: BoxFit.cover,
                            ))
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(3),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                              imageUrl: product.thumbnail,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                ),
                              ),
                              placeholder: (context, url) => Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Builder(builder: (context) {
                                    return const SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: CircularProgressIndicator(
                                            color: primaryColor));
                                  }),
                                ],
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                  ),
                ),
                Positioned(
                    right: 13,
                    top: 13,
                    child: RatingWidget(value: product.rating))
              ],
            ),
            Container(
                padding: const EdgeInsets.only(top: 5),
                child: Text(product.title,
                    style: newTextStyleEng(fontSize: 15, color: textColor))),
            Container(
                padding: const EdgeInsets.only(top: 2),
                child: Text("\$${numberFormatter(product.price)}",
                    style: newTextStyleEng(
                        fontSize: 14,
                        color: textColor,
                        fontWeight: FontWeight.bold)))
          ],
        ),
      ),
    );
  }
}
