import 'package:flutter/material.dart';
import 'package:time_tracker_app/components/form_submit_button.dart';

class EmailSignInForm extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submit() {
    print(
        'email : ${_emailController.text}, password : ${_passwordController.text}');
  }

  List<Widget> _buidChildren() {
    return [
      TextField(
        controller: _emailController,
        decoration: InputDecoration(
          labelText: "Email",
          hintText: 'johnappleseed@example.com',
        ),
        // onChanged: (value) => email = value,
      ),
      SizedBox(height: 8.0),
      TextField(
        controller: _passwordController,

        decoration: InputDecoration(
          labelText: "Password",
        ),
        obscureText: true,
        // onChanged: (value) => password = value,
      ),
      SizedBox(height: 8.0),
      FormSubmitButton(
        onPressed: _submit,
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
