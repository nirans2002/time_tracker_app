import 'package:flutter/material.dart';
import 'package:time_tracker_app/components/form_submit_button.dart';

class EmailSignInForm extends StatelessWidget {
  List<Widget> _buidChildren() {
    return [
      TextField(
        decoration: InputDecoration(
          labelText: "Email",
          hintText: 'johnappleseed@example.com',
        ),
      ),
      SizedBox(height: 8.0),
      TextField(
        decoration: InputDecoration(
          labelText: "Password",
        ),
        obscureText: true,
      ),
      SizedBox(height: 8.0),
      FormSubmitButton(
        onPressed: () {},
        text: "Sign in",
      ),
      SizedBox(height: 8.0),
      TextButton(
        onPressed: () {},
        child: Text('Create an account now'),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: _buidChildren(),
      ),
    );
  }
}
