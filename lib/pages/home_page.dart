import 'package:flutter/material.dart';
import 'package:infinityscrollexample/pages/pages.dart';
import 'package:infinityscrollexample/viewmodels/viewmodels.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home._({Key key}) : super(key: key);

  static const routeName = '/home';

  static Widget wrapped() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(locator: context.read),
        ),
      ],
      child: const Home._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Infinite Scroll Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('List'),
              onPressed: () =>
                  Navigator.of(context).pushNamed(ListPage.routeName),
            ),
            const SizedBox(height: 16),
            RaisedButton(
              child: Text('Grid'),
              onPressed: () =>
                  Navigator.of(context).pushNamed(GridPage.routeName),
            ),
          ],
        ),
      ),
    );
  }
}
