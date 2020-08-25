class IndexRepository {
  static const MAX_INDEX = 200;
  static const LIMIT = 20;

  List<String> fetchIndexes(int head) {
    final left = MAX_INDEX - head;

    if (left < 0) {
      return [];
    }

    if (left < LIMIT) {
      return List.generate(left, (index) => (index + head).toString());
    }

    return List.generate(LIMIT, (index) => (index + head).toString());
  }
}
