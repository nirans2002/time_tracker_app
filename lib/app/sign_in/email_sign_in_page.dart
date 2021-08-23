import 'package:flutter/material.dart';

class EmailSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign in with email"),
        elevation: 10.0,
      ),
      body: _buildContent(),
      backgroundColor: Colors.grey[50],
    );
  }

  Widget _buildContent() {
    return Container();
  }
}
