class Response<T> {
  final T _data;

  Response(T result) : _data = result;

  T get result => _data;
  T get results => _data;
}
