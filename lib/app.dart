import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'bloc/category_bloc.dart';
import 'bloc/product_bloc.dart';
import 'model/product_model.dart';
import 'page/home_page.dart';
import 'localization/translations_delegate.dart';
import 'localization/translation.dart';
import 'model/category_model.dart';
import 'widget/theme.dart';

class App extends StatefulWidget {
  const App({required, super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late TranslationsDelegate _transalationDelegate;

  @override
  void initState() {
    super.initState();
    _transalationDelegate =
        TranslationsDelegate(newLocale: Translation.defaultLocale);
    Translation().onLocaleChanged = (locale) {
      setState(() {
        _transalationDelegate = TranslationsDelegate(newLocale: locale);
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CategoryBloc(
            categoryModel: CategoryModel(),
          )..add(CategoryStarted()),
        ),
        BlocProvider(create: (_) => ProductBloc(productModel: ProductModel())),
      ],
      child: MaterialApp(
          title: 'Ecom',
          theme: ThemeData(
            scaffoldBackgroundColor: backgroundColor,
            appBarTheme: const AppBarTheme(
                surfaceTintColor: backgroundColor,
                backgroundColor: Colors.transparent,
                elevation: 0),
            drawerTheme: DrawerThemeData(
                backgroundColor: backgroundColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0))),
          ),
          localizationsDelegates: [
            _transalationDelegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          home: const HomePage()),
    );
  }
}
