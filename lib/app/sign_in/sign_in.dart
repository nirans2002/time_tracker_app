import 'package:flutter/material.dart';
import 'package:time_tracker_app/services/auth.dart';
import 'SocialSignInButton.dart';
import 'signinbutton.dart';
import 'package:flutter/foundation.dart';

class SignInPage extends StatelessWidget {
  //callback for landing page
  SignInPage({
    @required this.auth,
  });
  final AuthBase auth;

// signin Anonymously
  Future<void> _signInAnonymously() async {
    //await Firebase.initializeApp();
    try {
      await auth.signInAnonymously();
    } catch (e) {
      print(e.toString());
    }
  }

  // signin google
  Future<void> _signInWithGoogle() async {
    try {
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time Tracker  App"),
        elevation: 10.0,
      ),
      body: _buildContent(),
      backgroundColor: Colors.grey[50],
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "Sign in",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16.0),
          SocialSignInButton(
            assetName: "images/google-logo.png",
            color: Colors.white,
            text: "Sign in with Google",
            textColor: Colors.black87,
            onPressed: _signInWithGoogle,
          ),
          SizedBox(
            height: 8.0,
          ),
          SocialSignInButton(
            assetName: "images/facebook-logo.png",
            text: "Sign in with Facebook",
            color: Color(0xFF334092),
            onPressed: () {},
            textColor: Colors.white,
          ),
          SizedBox(
            height: 8.0,
          ),
          SignInButton(
            text: "Sign in with Email",
            color: Colors.teal,
            borderRadius: 4.0,
            onPressed: () {},
            textColor: Colors.white,
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            'or',
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8.0,
          ),
          SignInButton(
            text: "Sign in as Anonymous",
            color: Colors.greenAccent,
            borderRadius: 4.0,
            onPressed: _signInAnonymously,
            textColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
