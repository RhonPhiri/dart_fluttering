abstract class Animal {
  bool isAlive = true;

  void eat();

  void move();

  @override
  String toString() => "I'm a $runtimeType";
}
