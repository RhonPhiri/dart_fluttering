//encapsulation
//used to  hide imternal data from the outside word

class Password {
  String _plainText = 'Pass123';

//getter=> a method that retains the value of a private field in a class
  // String getPlainText() {
  //   return _plainText;
  // }
//don't prefix methods with get
//use the 'get' keyword instead
//when using the 'get' keyword, no parantheses are allowed
//arrow syntax for a single block, braces for multiple blocks of code
  String get plainText => _plainText;

  String get obfuscated {
    final length = _plainText.length;
    return '*' * length;
  }

  //setter have parantheses to allow parameters that can be used to set
  //vaule to the private field

  set plainText(String text) {
    if (text.length < 6) {
      print('Your password must have atleast 6 characters!');
      return;
    }
    _plainText = text;
  }
}

//challenge
class Rectangle {
  double _width = 0;
  double _height = 0;

  double get width => _width;
  double get height => _height;
  double get area => _height * _width;

  set width(double width) {
    if (width < 0) {
      print('The width must be greater than or equal to zero!');
      return;
    }
    _width = width;
  }

  set height(double height) {
    if (height < 0) {
      print('The height must be greater than or equal to zero!');
      return;
    }
    _height = height;
  }
}
