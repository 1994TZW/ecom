import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/category_bloc.dart';
import '../localization/translation_data.dart';
import '../widget/category_row.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double mainAxisExtent = MediaQuery.of(context).size.width / 1.7;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(TranslationData.of(context).text("home.category")),
            floating: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
            ],
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              return switch (state) {
                CategoryLoading() => const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  ),
                CatalogError() => const SliverFillRemaining(
                    child: Text('Something went wrong!',
                        textAlign: TextAlign.center),
                  ),
                CategoryLoaded() => SliverToBoxAdapter(
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: mainAxisExtent
                      ),
                      itemBuilder: (context, index) {
                        var category = state.categories[index];
                        return  CategoryRow(category);
                      },
                      itemCount: state.categories.length,
                    ),
                  )
              };
            },
          ),
        ],
      ),
    );
  }
}

