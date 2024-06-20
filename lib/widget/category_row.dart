import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/setting_bloc.dart';
import '../page/product_list.dart';
import '../vo/category.dart';
import 'theme.dart';

class CategoryRow extends StatelessWidget {
  final Category category;
  const CategoryRow(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    double itemSize = MediaQuery.of(context).size.width / 2 - 16 - 8;
    bool darkModeOn =
        context.watch<SettingBloc>().state.themeOption == ThemeOption.dark;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ProductList(category: category)));
      },
      child: SizedBox(
        width: itemSize,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: itemSize,
              height: itemSize,
              child: Card(
                color:
                    darkModeOn ? darkCardBackgroundColor : cardBackgroundColor,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: category.imageUrl == null || category.imageUrl == ''
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
                            imageUrl: category.imageUrl!,
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
            ),
            Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(category.name,
                    style: newTextStyleEng(
                        fontSize: 15,
                        color: darkModeOn ? darkTextColor : textColor)))
          ],
        ),
      ),
    );
  }
}
