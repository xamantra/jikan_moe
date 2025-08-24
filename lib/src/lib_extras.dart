class JikanException implements Exception {
  final String message;

  JikanException(this.message);

  @override
  String toString() => 'JikanException: $message';
}
