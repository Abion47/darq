class UnexpectedStateError extends StateError {
  UnexpectedStateError()
      : super(
            'Code execution has entered a state that should not have been possible. Please post an issue on the darq github describing what caused this error to be thrown.');
}

class EnumerableError extends StateError {
  EnumerableError(String message) : super(message);

  EnumerableError.isNull() : this('The underlying data is null.');

  EnumerableError.isEmpty() : this('The enumerable is empty.');

  EnumerableError.elementNotFound() : this('The element could not be found');

  EnumerableError.ambiguousMatch()
      : this('More than one element matches the request.');

  EnumerableError.tooMany()
      : this(
            'There are more elements in the enumerable than are allowed by the operation');
}

class KeyExistsError<T> extends StateError {
  KeyExistsError(T key) : super('A duplicate key $key was created.');
}

class ConversionError<TSource, TResult> extends CastError {
  final TSource object;

  ConversionError(this.object);

  @override
  String toString() =>
      'Unable to convert $object from type $TSource to type $TResult.';
}

class IntegerOverflowError extends StateError {
  IntegerOverflowError() : super('An operation caused an integer to overflow.');
}

class IncompatibleTypeError extends TypeError {
  final Type t;
  final List<Type> allowedTypes;

  IncompatibleTypeError(this.t, this.allowedTypes);

  @override
  String toString() =>
      'Type $t is unsupported. The type parameter must be one of these types: $allowedTypes';

  static void checkValidType(Type t, Iterable<Type> validTypes) {
    if (validTypes.contains(t)) return;
    throw IncompatibleTypeError(t, validTypes);
  }

  static void checkValidTypeOrParam(
      Type t, Iterable<Type> validTypes, dynamic param) {
    if (param != null) return;
    if (validTypes.contains(t)) return;
    throw IncompatibleTypeError(t, validTypes);
  }
}
