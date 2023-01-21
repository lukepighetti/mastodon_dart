import 'dart:convert';

import 'exception.dart';
import 'result.dart';

typedef BuildCallback<M> = M Function(Map<String, dynamic> json);

class Response<T> {
  final T _data;

  Response(T result) : _data = result;

  T get result => _data;
  T get results => _data;

  static Response<Result<M>> from<M>(
    String body,
    BuildCallback<M> build,
  ) {
    final json = jsonDecode(body);
    Result<M> result;

    try {
      result = Result.success(build(json));
    } on Exception catch (e) {
      result = Result.failure(
        ResultException(exception: e, unparsed: json),
      );
    }

    return Response(result);
  }

  static Response<List<Result<M>>> fromList<M>(
    String body,
    BuildCallback<M> build,
  ) {
    parse(Map<String, dynamic> item) {
      try {
        return Result<M>.success(build(item));
      } catch (e) {
        return Result<M>.failure(
          ResultException(
            exception: e as Exception,
            unparsed: item,
          ),
        );
      }
    }

    final json = jsonDecode(body);
    return Response(json.map(parse).toList());
  }
}
