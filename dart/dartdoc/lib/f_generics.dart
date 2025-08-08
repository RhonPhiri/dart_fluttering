void generics() {}

//Why use generics
//1. Specify the type
//2. Helps reduce code duplication
abstract class ObjectCache {
  Object getByKey(String key);
  void setByKey(String key, Object value);
}

abstract class StringCache {
  String getByKey(String key);
  void setByKey(String key, String value);
}

//You might also want different cache implementations for different types
//Use generics as below to reduce duplication

abstract class Cache<T> {
  T getByKey(String key);
  void setByKey(String key, T value);
}
