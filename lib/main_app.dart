import 'package:flutter/material.dart';
import 'package:test_dkatalis/screens/first_screen.dart';
import 'package:test_dkatalis/screens/fourth_screen.dart';
import 'package:test_dkatalis/screens/second_screen.dart';
import 'package:test_dkatalis/screens/third_screen.dart';
import 'package:test_dkatalis/utils/style.dart';
import 'package:test_dkatalis/models/goal.dart';

// const FirstScreenRoute = '/';
// const SecondScreenRoute = '/second';
// const ThirdScreenRoute = '/third';
// const FourthScreenRoute = '/fourth';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  // @override
  // Widget build(BuildContext context){
  //   return MaterialApp(
  //     onGenerateRoute: _routes(),
  //     theme : _theme(),
  //   );
  //     // onGenerateRoute: _routes(),
  //   // );
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }

}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.horizontal;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: _createStepper());
    // bottomNavigationBar: create
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  next() {
    _currentStep < 3 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  _createButton() {
    return Container();
  }

  _createStepper() {
    return Container(
        color: Colors.blueAccent,
        child: Column(
          children: [
            Expanded(
                child: Stepper(
                    type: stepperType,
                    physics: ScrollPhysics(),
                    currentStep: _currentStep,
                    onStepTapped: (step) => tapped(step),
                    onStepContinue: next,
                    onStepCancel: cancel,
                    steps: <Step>[
                  Step(
                    title: new Text(''),
                    content: _firstScreen(),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text(''),
                    content: _secondScreen(),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 1
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text(''),
                    content: _thirdScreen(),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 2
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text(''),
                    content: _fourthScreen(),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 3
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                ]))
          ],
        ));
  }

  _setImage() {
    return Container(
        constraints: BoxConstraints.expand(
          height: 200.0,
        ),
        decoration: BoxDecoration(color: Colors.grey),
        child: Image.asset("assets/images/logo.png", fit: BoxFit.fill));
  }

  _firstScreen(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Container(
          child: _setImage(),
        ),
        new Container(
          margin: const EdgeInsets.only(top: 10.0),
          child: Text('Welcome to', style: TitleTextStyle),
        ),
        new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('GIN', style: TitleTextStyle),
              Text(' Finans', style: TitleTextStyle1),
            ]),
        new Container(
          margin: EdgeInsets.only(top: 10.0),
          child: Text('Welcome to The Bank of The Future.',
              style: Body1TextStyle),
        ),
        Text('Manage and track your accounts on the go',
            style: Body1TextStyle),
        new Container(
          margin: EdgeInsets.only(top: 10.0),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "Email",
              fillColor: Colors.white,
              contentPadding:
              EdgeInsets.fromLTRB(10.0, 30.0, 0.0, 0.0),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Colors.blue,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 2.0,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }


  _secondScreen(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Container(
          child: Text('Create password',
              style: PasswordScreenTitleStyle),
        ),
        new Container(
          margin: EdgeInsets.only(top: 10.0),
          child: Text(
              'Password will be used to login to account',
              style: PasswordScreenBodyStyle),
        ),
        new Container(
          color: Colors.white,
          margin: EdgeInsets.only(top: 10.0),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "Create Password",
              fillColor: Colors.white,
              contentPadding:
              EdgeInsets.fromLTRB(10.0, 30.0, 0.0, 0.0),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Colors.blue,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 2.0,
                ),
              ),
            ),
          ),
        ),
        new Container(
          margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
          child: Text("Complexity",
              style: PasswordScreenBodyStyle),
        ),
        new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('a', style: PasswordScreenTitleStyle),
              Text('A', style: PasswordScreenTitleStyle),
              Text('123', style: PasswordScreenTitleStyle),
              Text('9+', style: PasswordScreenTitleStyle),
            ]),
        new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Lowercase', style: PasswordScreenBodyStyle),
              Text('Uppercase', style: PasswordScreenBodyStyle),
              Text('Number', style: PasswordScreenBodyStyle),
              Text('Characters', style: PasswordScreenBodyStyle),
            ]),
      ],
    );
  }

   _thirdScreen(){
   return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Container(
          child: Text('Personal Information',
              style: PasswordScreenTitleStyle),
        ),
        new Container(
          margin: EdgeInsets.only(top: 10.0),
          child: Text(
              'Please fill in the information below and your goal for digital saving',
              style: PasswordScreenBodyStyle),
        ),
        TextFormField(
          decoration:
          InputDecoration(labelText: 'Goal For Activation'),
        ),
        TextFormField(
          decoration:
          InputDecoration(labelText: 'Monthly Income'),
        ),
        TextFormField(
          decoration:
          InputDecoration(labelText: 'Monthly Expense'),
        ),
      ],
    );
  }

  _fourthScreen(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Container(
          margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
          child: Text('Schedule Video Call', style: PasswordScreenTitleStyle),
        ),
        new Column(

            children: <Widget>[
              Text('Choose the date and time that you preferred,', style: PasswordScreenBodyStyle),
              Text('We will send a link via email to make a video call on the scheduled date and time', style: PasswordScreenBodyStyle),
            ]),

        TextFormField(
          decoration:
          InputDecoration(labelText: 'Date'),
        ),
        TextFormField(
          decoration:
          InputDecoration(labelText: 'Time'),
        ),
      ],

    );
  }
}
