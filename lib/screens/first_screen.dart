import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_dkatalis/main_app.dart';
import 'package:test_dkatalis/screens/second_screen.dart';

class FirstScreen extends StatelessWidget {
  int _currentStep = 0;
  StepperType stepperType = StepperType.horizontal;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),

      body: Container(
        child: Column(
          children :[
        Expanded(
        child: Stepper(
        type: stepperType,
            physics: ScrollPhysics(),
            currentStep: _currentStep,
            // onStepTapped: (step) => tapped(step),
            // onStepContinue:  continued,
            // onStepCancel: cancel,
            steps: <Step>[
              Step(
                title: new Text(''),
                content: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Email Address'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Password'),
                    ),
                  ],
                ),
                isActive: _currentStep >= 0,
                state: _currentStep >= 0 ?
                StepState.complete : StepState.disabled,
              ),
            ]
        )
      )
    ],
    )));
  }





}