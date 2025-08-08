//Instantiating the same class to different variables is not the same as
//creating another object. Any changes will be reflected in the other variable
//too

//Create a method => 'copyWith()' to create a complete copy of the class and
//instantiate it to a new object

/*default constructor: provided by dart. no parameters included
custom constructors => carry parameters of the variables you'd want to
initialize when creating an oobject
 */

class User {
  //Long-form constructor with parameters
  // User({required int id, required String name}) {
  //   this.name = name;
  //   this.id = id;
  // }

  //Short_form constructor
  const User({required int id, required String name}) : _id = id, _name = name;

  //though we cannot supply a default constructor, we can have a named constructor
  //use the semicolon and 'this' keyword to forward the propertirs of the named
  //constructor to the unnamed constructor.
  //make fields final and constructors const => immutable, cannot be changed
  const User.anonymous() : this(id: 0, name: 'anonymous user');

  final int _id;
  final String _name;

  String toJson() {
    return '{"id":$_id,"name":"$_name"}';
  }

  @override
  String toString() {
    return 'User(id:$_id, name:$_name)';
  }

  //generative constructor used to create new instances
  //factory constructors used to return existing instances of the class or subclass. They can be unnamed
  //uses the genrative constructor to create and return an instance. similar to a named constructor but is prefered as it allows validation, error checking
  factory User.rhon() {
    return User(id: 202220140020, name: 'Rhon');
  }
}
