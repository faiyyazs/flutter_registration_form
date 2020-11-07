///
/// Extend this abstract class to any of the entity classes<F> and provide their domain counterpart<T> as well.
/// override transform() and/or restore() and to convert them
///
///
abstract class BaseTransformer<F, T> {
  T transform();

  F restore(T data);
}
