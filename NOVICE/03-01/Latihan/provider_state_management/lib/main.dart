import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/common/theme.dart';
import 'package:provider_state_management/models/cart.dart';
import 'package:provider_state_management/models/catalog.dart';
import 'package:provider_state_management/screens/cart.dart';
import 'package:provider_state_management/screens/catalog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(builder: (context) => CatalogModel()),
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          builder: (context, catalog, previousCart) => CartModel(catalog, previousCart)
        ),
      ],
      child: MaterialApp(
        title: 'Provider Demo',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => MyCatalog(),
          '/cart': (context) => MyCart(),
        },
      ),
    );
  }
}