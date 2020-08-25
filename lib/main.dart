import 'package:flutter/material.dart';
import 'package:infinityscrollexample/index_repository.dart';
import 'package:infinityscrollexample/pages/pages.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => IndexRepository(),
      child: MaterialApp(
        title: 'Infinity Scroll Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          Home.routeName: (context) => Home.wrapped(),
          ListPage.routeName: (context) => ListPage.wrapped(),
          GridPage.routeName: (context) => GridPage.wrapped(),
        },
        home: Home.wrapped(),
      ),
    );
  }
}
