import 'package:ecom/widget/local_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/product_bloc.dart';
import '../bloc/setting_bloc.dart';
import '../widget/product_placeholder_row.dart';
import '../widget/product_row.dart';
import '../widget/theme.dart';
import '../vo/category.dart';

class ProductList extends StatefulWidget {
  final Category category;
  const ProductList({super.key, required this.category});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  Future<void> _refresh() async {
    _loadProducts();
  }

  @override
  void initState() {
    _loadProducts();
    super.initState();
  }

  _loadProducts() {
    context.read<ProductBloc>().add(ProductDataLoaded(widget.category.id));
  }

  @override
  Widget build(BuildContext context) {
    bool darkModeOn =
        context.watch<SettingBloc>().state.themeOption == ThemeOption.dark;

    return Scaffold(
      body: RefreshIndicator(
        color: primaryColor,
        onRefresh: _refresh,
        edgeOffset: kToolbarHeight,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              floating: true,
              snap: true,
              flexibleSpace: LocalAppBar(
                  backgroundColor:
                      darkModeOn ? darkBackgroundColor : backgroundColor,
                  arrowColor: darkModeOn ? darkTextColor : textColor,
                  titleWidget: Text(widget.category.name,
                      style: newTextStyleEng(
                          fontSize: 20,
                          color: darkModeOn ? darkTextColor : textColor))),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 10)),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                return switch (state) {
                  ProductLoading() => SliverToBoxAdapter(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Wrap(
                          spacing: 16,
                          runSpacing: 12,
                          children: List.generate(
                              6, (index) => const ProductPlaceholderRow()),
                        ),
                      ),
                    ),
                  ProductError() => const SliverFillRemaining(
                      child: Text('Something went wrong!',
                          textAlign: TextAlign.center),
                    ),
                  ProductLoaded() => SliverToBoxAdapter(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Wrap(
                          spacing: 16,
                          runSpacing: 12,
                          children: List.generate(
                            state.products.length,
                            (index) => ProductRow(state.products[index]),
                          ),
                        ),
                      ),
                    )
                };
              },
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 30)),
          ],
        ),
      ),
    );
  }
}
