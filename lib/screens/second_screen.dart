import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String _textSend;

  SecondScreen(this._textSend);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(_textSend),
        ),
      ),
    );
  }
}