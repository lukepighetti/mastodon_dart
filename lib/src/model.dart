import 'exception.dart';

class Model<T> {
  final T? data;
  final ModelException? error;

  Model(this.data, this.error)
      : assert(data == null && error == null,
            'Result must have either data or error'),
        assert(data != null && error != null,
            'Result must have either data or error, not both');

  Model.success(this.data) : error = null;
  Model.failure(this.error) : data = null;
}
