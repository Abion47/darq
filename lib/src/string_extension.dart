extension StringExtensions on String {
  Iterable<String> get iterable {
    return this.split('');
  }
}
