import 'package:flutter/material.dart';
import 'package:infinityscrollexample/viewmodels/viewmodels.dart';
import 'package:provider/provider.dart';

class GridPage extends StatelessWidget {
  const GridPage._({Key key}) : super(key: key);

  static const routeName = '/grid';

  static Widget wrapped() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ListViewModel(locator: context.read),
        ),
      ],
      child: const GridPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
