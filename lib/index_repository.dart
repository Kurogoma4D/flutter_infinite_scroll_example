class IndexRepository {
  static const MAX_INDEX = 200;
  static const LIMIT = 20;

  Future<List<String>> fetchIndexes(int head) async {
    await Future.delayed(const Duration(seconds: 2));

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
