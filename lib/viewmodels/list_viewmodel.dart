import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:infinityscrollexample/index_repository.dart';
import 'package:provider/provider.dart';

class ListViewModel extends ChangeNotifier {
  ListViewModel({this.locator}) {
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      final maxExtent = _scrollController.position.maxScrollExtent;
      final currentPosition = _scrollController.position.pixels;
      final direction = _scrollController.position.userScrollDirection;
      if (maxExtent > 0 &&
          currentPosition / maxExtent >= 0.9 &&
          direction == ScrollDirection.reverse &&
          !isLoading) {
        fetchNextPage();
      }
    });

    initIndexes();
  }

  final Locator locator;

  List<String> indexes = [];
  bool isLoading = true;
  ScrollController _scrollController;
  ScrollController get scrollController => _scrollController;

  int get maxIndex => IndexRepository.MAX_INDEX;

  void initIndexes() async {
    indexes = await locator<IndexRepository>().fetchIndexes(0);

    isLoading = false;
    notifyListeners();
  }

  void fetchNextPage() async {
    isLoading = true;
    notifyListeners();

    final head = (int.tryParse(indexes.last) ?? 0) + 1;
    final additionalList = await locator<IndexRepository>().fetchIndexes(head);

    indexes = [...indexes, ...additionalList];

    isLoading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
