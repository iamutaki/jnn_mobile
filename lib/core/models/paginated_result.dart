class PaginatedResult<T> {
  const PaginatedResult({required this.items, this.nextCursor});

  final List<T> items;
  final String? nextCursor;
}
