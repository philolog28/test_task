import 'package:flutter/material.dart';
import 'package:test_task/development.dart';
import 'package:test_task/feature/presenter/catalog_page/catalog_page.dart';

Future<void> main() async => await Development().init();

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      home: CatalogPage(),
    );
  }
}