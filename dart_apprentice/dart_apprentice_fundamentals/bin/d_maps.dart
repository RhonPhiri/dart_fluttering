import 'dart:convert';

final inventory = {'cakes': 20, 'pies': 14, 'donuts': 37, 'cookies': 141};

//SERIALIZATION//
//JSON format = used to send objects over a network/ store in local storage
//serialization = conversion to a Json format
//Maps as intermedially between the conversion

class User {
  //user class properties
  final int id;
  final String name;
  final List<String> emails;
//user class short-form constructor
  User({
    required this.id,
    required this.name,
    required this.emails,
  });
  // toJson method
  // returns a map, henc the return type should be a map
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'emails': emails,
    };
  }

  //factory constructor to convert a jsonMap to an object
  factory User.fromJson(Map<String, dynamic> json) {
    dynamic id = json['id'];
    if (id is! int) id = 0;
    dynamic name = json['name'];
    if (name is! String) name = '';
    dynamic maybeEmails = json['emails'];
    final emails = <String>[];
    if (maybeEmails is List) {
      for (dynamic email in maybeEmails) {
        if (email is String) emails.add(email);
      }
    }
    return User(id: id, name: name, emails: emails);
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, emails: $emails)';
  }
}

void main() {
  //accessing values from a map
  //use square brackets with the key.
  //NOTE: if key is absent, null will be retained because maps are nullable
  print(inventory['rhon']);
  //the retained value is also inferred as nullable
  final numerOfCakes = inventory['cakes'];
  print(numerOfCakes?.isEven);
  //add new elements to amap by assigning a value to a new key
  inventory['flitters'] = 100;
  print(inventory);
  //updating a map = assign an existing key with a new value
  inventory['cakes'] = 10;
  final newNumerOfCakes = inventory['cakes'];
  print(newNumerOfCakes);
  //removing an element =use the remve method
  inventory.remove('flitters');
  print(inventory);
  //Map properties
  print(inventory.entries);
  print(inventory.keys);
  print(inventory.values);
  print(inventory.containsKey('cakes'));

//looping in Maps
  //maps dn't implement iterables like a list/set
  // but the Map.keys/Map.value implement iterabkes hence can be looped over
  for (String key in inventory.keys) {
    print(key);
  }
  for (int value in inventory.values) {
    print(value);
  }
  for (var entry in inventory.entries) {
    print('${entry.key} => ${entry.value}');
  }

  //CONVERTING AN OBJECT TO A JSON FILE
  // instantiating the User class
  final user1 = User(
    id: 202220140020,
    name: 'Rhon Phiri',
    emails: ['202220140020@kuhes.ac.mw', 'phirirhon42@gamil.com'],
  );
// converting the user object to a Map using the toJson method
  final userMap = user1.toJson();
  print(userMap);
  // converting to a Json object =a string
  final userString = jsonEncode(userMap);
  print(userString);

  //CONVERTING A JSON FILE TO AN OBJECT
  //
  final jsonString =
      '{"id":202220140020,"name":"Rhon Phiri","emails":["phirirhon42@gamil.com"]}';
  //json to map
  final jsonMap = jsonDecode(jsonString);
  print(jsonMap);
  //map to object, use a factory constructor
  print(User.fromJson(jsonMap));
}
