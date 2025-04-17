//ABSTRACT CLASSES
//abstract classes can't be used to make objects

void main() {
  abstractClass();
  challengeMethod();
}

abstract class Animal {
  //abstract classes can have concrete fields/ methods
  bool isAlive = true;
  //abstract classes also have abstract methods.
  //They don't show how to specifically implement the method. This will be
  //done in the subclasses. They end with
  void eat();
  void move();

  @override
  String toString() {
    return 'I\'m a $runtimeType';
  }
}

//creating a concrete subclass
class Platypus extends Animal {
//need to implement all abstracts methods in the extended abstract class
  @override
  void eat() {
    print('Munch Munch');
  }

  @override
  void move() {
    print('Glide Glide');
  }

  //subclasses can have their own methods
  void layEgges() {
    print('Flop Flop');
  }
}

void abstractClass() {
  Animal platypus = Platypus();
  print(platypus.isAlive);
  platypus.eat();
  platypus.move();
  // platypus.layEgges();
  print(platypus);
}

//challenge
// 1 Create an abstract class named Storage with print statements in the save
//and retrieve methods.
// 2 Extend Storage with concrete classes named LocalStorage and CloudStorage
abstract class Storage {
  void save();
  void retrieve();
}

class LocalStorage extends Storage {
  @override
  void save() {
    print('content stored on local storage!');
  }

  @override
  void retrieve() {
    print('content retrieved from local storage!');
  }
}

class CloudStorage extends Storage {
  @override
  void save() {
    print('content stored on the Cloud storage!');
  }

  @override
  void retrieve() {
    print('content retrieved from the Cloud storage!');
  }
}

void challengeMethod() {
  final Storage localStorage = LocalStorage();
  localStorage.save();
  localStorage.retrieve();
  final Storage cloudStorage = CloudStorage();
  cloudStorage.save();
  cloudStorage.retrieve();
}
