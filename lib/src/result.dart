import 'exception.dart';

class Result<M> {
  final M? model;
  final ResultException? error;

  Result(this.model, this.error)
      : assert(model == null && error == null,
            'Result must have either data or error'),
        assert(model != null && error != null,
            'Result must have either data or error, not both');

  Result.success(this.model) : error = null;
  Result.failure(this.error) : model = null;
}
