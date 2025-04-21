abstract class Entity<T> {
  const Entity();
}

abstract class Mapper<D, E> {
  E fromData(D data);
  D toData(E entity);
}
