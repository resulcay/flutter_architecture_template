enum ProductServivePath {
  blogs('blogs'),
  notExists('notExists');

  const ProductServivePath(this.value);
  final String value;

  String withQuery(String value) => '${this.value}/$value';
}
