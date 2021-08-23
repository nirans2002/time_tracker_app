import 'package:flutter/material.dart';

class EmailSignInForm extends StatelessWidget {
  List<Widget> _buidChildren() {
    return [
      TextField(
        decoration: InputDecoration(
          labelText: "Email",
          hintText: 'johnappleseed@example.com',
        ),
      ),
      TextField(
        decoration: InputDecoration(
          labelText: "Password",
        ),
        obscureText: true,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: _buidChildren(),
      ),
    );
  }
}
