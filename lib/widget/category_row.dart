import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../vo/category.dart';

class CategoryRow extends StatelessWidget {
  final Category category;
  const CategoryRow(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 150.0,
                  height: 150.0,
                  child: category.imageUrl == null || category.imageUrl == ''
                      ? Container()
                      // ClipRRect(
                      //     borderRadius: BorderRadius.circular(3),
                      //     child: const FadeInImage(
                      //       placeholder: AssetImage('assets/placeholder.png'),
                      //       image: AssetImage('assets/placeholder.png'),
                      //       fit: BoxFit.fill,
                      //     ))
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                            imageUrl: category.imageUrl!,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                              ),
                            ),
                            // placeholder: (c, _) =>
                            //     Image.asset("assets/placeholder.png"),
                            // errorWidget: (context, url, error) {
                            //   return Image.asset("assets/placeholder.png");
                            // },
                          ),
                        ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            SizedBox(
              width: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.name,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    // final textTheme = Theme.of(context).textTheme.titleLarge;
    // return Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    //   child: LimitedBox(
    //     maxHeight: 48,
    //     child: Row(
    //       children: [
    //         const AspectRatio(
    //             aspectRatio: 1, child: ColoredBox(color: Colors.blue)),
    //         const SizedBox(width: 24),
    //         Expanded(child: Text(category.name, style: textTheme)),
    //         const SizedBox(width: 24),
    //         // AddButton(item: item),
    //       ],
    //     ),
    //   ),
    // );
  }
}
