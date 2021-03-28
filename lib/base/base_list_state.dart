abstract class BaseListState {
  BaseListState([List propos = const <dynamic>[]]) : super();
}

class Empty extends BaseListState {}

class Result<T> extends BaseListState {
  late final List<T> result;

  Result({required this.result}) : super([result]);
}

class Error extends BaseListState {
  late final String message;

  Error({required this.message}) : super([message]);
}
