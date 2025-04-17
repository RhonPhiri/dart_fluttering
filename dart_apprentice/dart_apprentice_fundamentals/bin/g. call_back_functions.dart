void main() {
  // voidCallBack();
  // valueSetterCallBack();
  // valueGetterCallBack();
  tearOffs();
}

///Callback Functions
///anonymous functions used to handle tasks in a program
///1. VOID CALLBACKS=> Don't take up a parameter or retain a value
class Button {
  final String title;
  final void Function() onPressed; //specify 'void Function()'
  ///in this case, void specifies that the function shouldn't return a value
  ///the empty parenthesis specify that the function doesn't take any parameters

  Button({
    required this.title,
    required this.onPressed,
  });
}

void voidCallBack() {
  final myButton = Button(
      title: 'Click me1',
      onPressed: () {
        print('Button clicked!');
      });
  myButton.onPressed(); //onPressed minus the perenthesis=> the function itself
  //onPressed plus parenthesis => calling the function
  //one can also use the .call() method
  myButton.onPressed.call();
}

///2. VALUE SETTER CALLBACK
///takes up a parameter & sets a value to it upon being called
class MyWidget {
  final void Function(double xPosition) onTouch;
  MyWidget({required this.onTouch});
}

void valueSetterCallBack() {
  final myWidget = MyWidget(
    onTouch: (x) => print(x),
  );
  myWidget.onTouch(2.54);

  ///Example; used in setting the value selected by the user along the audio
  ///seek bar
}

///3.VALUE GETTER CALLBACK
///used when one need a value dynamically
class AnotherWidget {
  final String Function()? timeStamp;
  AnotherWidget({required this.timeStamp});
}

void valueGetterCallBack() {
  final anotherWidget = AnotherWidget(
    timeStamp: () => DateTime.now().toIso8601String(),
    //.toIso8601String used to store timestamp string values
  );
  final timeStamp = anotherWidget.timeStamp?.call();
  print(timeStamp);
}

///tearOffs
class StateManger {
  int _counter = 2;

  void handleButtonClick() {
    _counter++;
    print(_counter);
  }
}

void tearOffs() {
  ///tearOffs are used to simplify codein some sense
  ///Example
  final manager = StateManger();

  final myButton = Button(
    title: 'Add Count!',

    ///Usually, one would write onPressed : (){
    ///manager.handleButtonClick();};
    ///In this case, the parenthesis at the end of the manager method, execute the
    ///function immediately, whilst without parenthesis, it only provides
    ///reference to the method as a function object.
    ///the (){ } for the onpressed, cause the code not to be immediately executed
    ///hence the code cancels each other.
    ///To prevent this, tear- off the method
    onPressed: manager.handleButtonClick,
  );
  myButton.onPressed();

  ///anoter example, the print method
  final cities = <String>['Mzuzu', 'Lilongwe', 'Zomba', 'Blantyre'];

  ///usually one would do the ff;
  /// cities.forEach((city) => print(city));
  ///do this instead
  cities.forEach(print);
}
