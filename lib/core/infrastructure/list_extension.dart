extension ListExtension<T> on List<T> {
  Map<int, T> toPagedMap(int page, {required int pageLength}) {
    final mappedList = <int, T>{};
    for (var i = 0; i < length; i++) {
      mappedList[i + (pageLength * page)] = this[i];
    }
    return mappedList;
  }
}
