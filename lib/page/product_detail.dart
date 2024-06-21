import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom/widget/local_text.dart';
import 'package:ecom/widget/rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import '../bloc/setting_bloc.dart';
import '../vo/product.dart';
import '../widget/theme.dart';
import '../widget/util.dart';

class ProductDetail extends StatefulWidget {
  final Product product;
  const ProductDetail({super.key, required this.product});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  String currentImageUrl = '';

  @override
  void initState() {
    currentImageUrl = widget.product.images.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool darkModeOn =
        context.watch<SettingBloc>().state.themeOption == ThemeOption.dark;

    final topSection = SizedBox(
      height: 290,
      child: Stack(
        children: [
          Container(
            color: darkModeOn ? darkCardBackgroundColor : cardBackgroundColor,
            child: currentImageUrl == ''
                ? const FadeInImage(
                    placeholder: AssetImage('assets/logo.png'),
                    image: AssetImage('assets/logo.png'),
                    fit: BoxFit.cover,
                  )
                : CachedNetworkImage(
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    imageUrl: currentImageUrl,
                    imageBuilder: (context, imageProvider) => Container(
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
                            height: 290,
                            child: Center(
                              child: SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: CircularProgressIndicator(
                                      color: primaryColor)),
                            ),
                          );
                        }),
                      ],
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
          ),
          IconButton(
              icon: Icon(Icons.arrow_back,
                  color: darkModeOn ? darkTextColor : textColor, size: 25),
              onPressed: () => {Navigator.of(context).pop()}),
        ],
      ),
    );

    final imageSelectionBox = Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        height: 60,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.product.images.length,
            itemBuilder: (context, index) {
              var imageUrl = widget.product.images[index];
              return Container(
                margin: const EdgeInsets.only(right: 10),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      currentImageUrl = imageUrl;
                    });
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: darkModeOn
                            ? darkCardBackgroundColor
                            : cardBackgroundColor,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: currentImageUrl == imageUrl
                              ? primaryColor
                              : primaryColor.withOpacity(0.2),
                          width: 1,
                        )),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: imageUrl,
                          placeholder: (context, url) => Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Builder(builder: (context) {
                                return const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                        strokeWidth: 2, color: primaryColor));
                              }),
                            ],
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            scrollDirection: Axis.horizontal),
      ),
    );

    final reviewBox = Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ListTileTheme(
          minVerticalPadding: 0,
          child: ExpansionTile(
              initiallyExpanded: true,
              tilePadding: EdgeInsets.zero,
              iconColor: lableColor,
              collapsedIconColor: lableColor,
              minTileHeight: 0,
              childrenPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
              title: LocalText(context, "product.review",
                  fontSize: 15,
                  color: darkModeOn ? darkTextColor : textColor,
                  fontWeight: FontWeight.bold),
              children: widget.product.reviews.map((review) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        margin: const EdgeInsets.only(right: 15),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: reviewerPlaceholderColor),
                        child: Text(review.getFirstLetter.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: newTextStyleEng(fontSize: 16)),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 3),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 8,
                                    child: Text(
                                      review.reviewerName,
                                      style: newTextStyleEng(
                                          fontSize: 14,
                                          color: darkModeOn
                                              ? darkTextColor
                                              : textColor,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Flexible(
                                    flex: 4,
                                    child: SmoothStarRating(
                                      allowHalfRating: false,
                                      size: 16,
                                      color: ratingColor,
                                      rating: review.rating,
                                      borderColor: reviewerPlaceholderColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              review.comment,
                              style: newTextStyleEng(
                                  color: darkModeOn ? darkTextColor : textColor,
                                  fontSize: 14,
                                  height: 150 / 100),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList()),
        ),
      ),
    );

    return Scaffold(
      body: SafeArea(
          top: true,
          child: ListView(
            shrinkWrap: true,
            children: [
              topSection,
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    imageSelectionBox,
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.product.title,
                                style: newTextStyleEng(
                                    fontSize: 17,
                                    color: darkModeOn
                                        ? darkTextColor
                                        : textColor)),
                            Container(
                                padding: const EdgeInsets.only(top: 3),
                                child: Text(
                                    "\$${numberFormatter(widget.product.price)}",
                                    style: newTextStyleEng(
                                        fontSize: 15,
                                        color: darkModeOn
                                            ? darkTextColor
                                            : textColor,
                                        fontWeight: FontWeight.bold)))
                          ],
                        )),
                        RatingWidget(value: widget.product.rating)
                      ],
                    ),
                    const SizedBox(height: 7),
                    widget.product.brand == ""
                        ? const SizedBox()
                        : lableRow(context,
                            labelKey: 'product.brand',
                            text: widget.product.brand,
                            darkModeOn: darkModeOn),
                    widget.product.weight == 0
                        ? const SizedBox()
                        : lableRow(context,
                            labelKey: 'product.weight',
                            text: "${widget.product.weight} kg",
                            darkModeOn: darkModeOn),
                    lableRow(context,
                        labelKey: 'product.dimension',
                        darkModeOn: darkModeOn,
                        text:
                            "${widget.product.dimension.length} x ${widget.product.dimension.width} x ${widget.product.dimension.height}"),
                    widget.product.warranty == ""
                        ? const SizedBox()
                        : lableRow(context,
                            labelKey: 'product.warranty',
                            text: widget.product.warranty,
                            darkModeOn: darkModeOn),
                    widget.product.shipping == ""
                        ? const SizedBox()
                        : lableRow(context,
                            labelKey: 'product.shipping',
                            text: widget.product.shipping,
                            darkModeOn: darkModeOn),
                    widget.product.status == ""
                        ? const SizedBox()
                        : lableRow(context,
                            labelKey: 'product.status',
                            text: widget.product.status,
                            darkModeOn: darkModeOn),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 12.0),
                  height: 1.0,
                  width: double.infinity,
                  color: darkModeOn ? placeHolderColor : separatorColor),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LocalText(context, "product.desc",
                        fontSize: 15,
                        color: darkModeOn ? darkTextColor : textColor,
                        fontWeight: FontWeight.bold),
                    const SizedBox(height: 6),
                    Text(
                      widget.product.description,
                      style: newTextStyleEng(
                          color: darkModeOn ? darkTextColor : textColor,
                          fontSize: 14),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 12.0),
                  height: 1.0,
                  width: double.infinity,
                  color: darkModeOn ? placeHolderColor : separatorColor),
              reviewBox,
              const SizedBox(height: 30)
            ],
          )),
    );
  }

  Widget lableRow(BuildContext context,
      {required String labelKey,
      required String text,
      required bool darkModeOn}) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width / 2.5,
              child: LocalText(context, labelKey,
                  color: lableColor, fontSize: 14)),
          Flexible(
            child: Text(
              text,
              style: newTextStyleEng(
                  color: darkModeOn ? darkTextColor : textColor, fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
