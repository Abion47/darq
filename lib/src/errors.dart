class UnexpectedStateError extends Error {
  UnexpectedStateError();

  @override
  String toString() => 'Code execution has entered a state that should not have been possible.';
}

class NullEnumerableError extends Error {
  NullEnumerableError();

  @override
  String toString() => 'Cannot perform operation on an enumeration with a backing data of null.';
}

class EmptyEnumerableError extends Error {
  EmptyEnumerableError();

  @override
  String toString() => 'Cannot perform operation on an empty enumeration.';
}

class KeyExistsError extends Error {
  final dynamic key;

  KeyExistsError(this.key);

  @override
  String toString() => 'Generating the map produced a duplicate key: $key';
}

class ConversionError<TSource, TResult> extends Error {
  final TSource object;

  ConversionError(this.object);

  @override
  String toString() => 'Unable to convert $object from type $TSource to type $TResult.';
}

class ElementNotFoundError extends Error {
  ElementNotFoundError();

  @override
  String toString() => 'An element was requested, but the enumeration ended before it oculd be found.';
}

class OperationError extends Error {
  final String message;

  OperationError(this.message);

  String toString() => 'Operational error: $message';
}

class IntegerOverflowError extends Error {
  IntegerOverflowError();

  @override
  String toString() => 'An operation caused an integer to overflow.';
}

class IncompatibleTypeError extends Error {
  final List<Type> allowedTypes;

  IncompatibleTypeError(this.allowedTypes);

  String toString() => 'Type parameter must be one of these types: $allowedTypes';
}