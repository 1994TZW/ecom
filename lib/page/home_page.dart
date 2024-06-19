import 'package:ecom/widget/local_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/category_bloc.dart';
import '../localization/translation_data.dart';
import '../widget/category_row.dart';
import '../widget/theme.dart';
import 'drawer_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _refresh() async {}

  @override
  Widget build(BuildContext context) {
    double searchBarHeight = 60;
    double titleHeight = 25;
    double appBarHeight = kToolbarHeight + searchBarHeight + titleHeight;

    final searchBox = Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 9),
      child: SizedBox(
        height: 40,
        child: TextField(
          cursorColor: primaryColor,
          style: const TextStyle(color: textColor),
          onSubmitted: (value) async {},
          onChanged: (v) async {},
          decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide:
                      BorderSide(color: textColor.withOpacity(0.3), width: 0)),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              hintText:
                  TranslationData.of(context).text('home.search_placeholder'),
              hintStyle: newTextStyleEng(color: lableColor, fontSize: 15),
              fillColor: primaryColor.withOpacity(0.1),
              prefixIcon: const Icon(Icons.search_rounded, color: lableColor),
              contentPadding: const EdgeInsets.all(3),
              filled: true),
        ),
      ),
    );

    final titleBox = Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 9, top: 15),
      child: SizedBox(
          height: titleHeight,
          child: LocalText(context, "home.category", fontSize: 17)),
    );

    return Scaffold(
      drawer: const DrawerMenu(),
      body: RefreshIndicator(
        color: primaryColor,
        onRefresh: _refresh,
        edgeOffset: kToolbarHeight,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: backgroundColor,
              automaticallyImplyLeading: false,
              floating: true,
              snap: true,
              toolbarHeight: appBarHeight,
              flexibleSpace: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBar(
                    centerTitle: true,
                    title: Hero(
                        tag: "ecom_logo",
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset("assets/logo.png",
                              height: 70, filterQuality: FilterQuality.medium),
                        )),
                    actions: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.shopping_cart_outlined,
                              color: textColor))
                    ],
                  ),
                  searchBox,
                  titleBox
                ],
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 12)),
            BlocBuilder<CategoryBloc, CategoryState>(
              builder: (context, state) {
                return switch (state) {
                  CategoryLoading() => const SliverFillRemaining(
                      child: Center(
                          child: CircularProgressIndicator(
                        color: primaryColor,
                      )),
                    ),
                  CatalogError() => const SliverFillRemaining(
                      child: Text('Something went wrong!',
                          textAlign: TextAlign.center),
                    ),
                  CategoryLoaded() => SliverToBoxAdapter(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Wrap(
                          spacing: 16,
                          runSpacing: 12,
                          children: List.generate(
                            state.categories.length,
                            (index) => CategoryRow(state.categories[index]),
                          ),
                        ),
                      ),
                    )
                };
              },
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 15)),
          ],
        ),
      ),
    );
  }
}
