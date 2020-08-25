import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
    return Scaffold(
      appBar: AppBar(title: Text('Grid Scroll')),
      body: Column(
        children: <Widget>[
          const Gap(8),
          Text(
            'Indexes',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Gap(4),
          const Divider(color: Colors.black26),
          Expanded(
            child: const _IndexesView(),
          ),
        ],
      ),
    );
  }
}

class _IndexesView extends StatelessWidget {
  const _IndexesView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoading =
        context.select((ListViewModel viewModel) => viewModel.isLoading);
    final indexes =
        context.select((ListViewModel viewModel) => viewModel.indexes);
    final scrollController =
        context.select((ListViewModel viewModel) => viewModel.scrollController);

    return FractionallySizedBox(
      widthFactor: 0.9,
      child: CustomScrollView(
        controller: scrollController,
        slivers: <Widget>[
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 16,
              childAspectRatio: 0.9,
            ),
            delegate: SliverChildListDelegate(
              [
                for (final indexString in indexes)
                  _IndexCard(index: indexString),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Gap(8),
                if (isLoading) Center(child: CircularProgressIndicator()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _IndexCard extends StatelessWidget {
  const _IndexCard({Key key, this.index}) : super(key: key);

  final String index;

  @override
  Widget build(BuildContext context) {
    final maxIndex =
        context.select((ListViewModel viewModel) => viewModel.maxIndex);
    final percentage = int.tryParse(index) / maxIndex;
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color.lerp(Colors.blueAccent, Colors.greenAccent, percentage),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        index,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
