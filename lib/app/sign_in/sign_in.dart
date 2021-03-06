import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_app/app/sign_in/email_sign_in_page.dart';
import 'package:time_tracker_app/components/platform_exception_alert_dialog.dart';
import 'package:time_tracker_app/services/auth.dart';
import 'SocialSignInButton.dart';
import 'signinbutton.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isloading = false;

  void _showSignInError(BuildContext context, PlatformException exception) {
    PlatformExceptionAlertDialog(
      title: 'Sign in failed',
      exception: exception,
    ).show(context);
  }

  Future<void> _signInAnonymously(BuildContext context) async {
    try {
      setState(() => _isloading = true);
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInAnonymously();
    } on PlatformException catch (e) {
      _showSignInError(context, e);
      // print(e.toString());
    } finally {
      setState(() => _isloading = false);
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      setState(() => _isloading = true);

      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInWithGoogle();
    } on PlatformException catch (e) {
      if (e.code != 'ERROR_ABORTED_BY_USER') {
        _showSignInError(context, e);
      }
    } finally {
      setState(() => _isloading = false);
    }
  }

  Future<void> _signInWithFacebook(BuildContext context) async {
    try {
      setState(() => _isloading = true);

      final auth = Provider.of<AuthBase>(context, listen: false);

      await auth.signInWithFacebook();
    } on PlatformException catch (e) {
      if (e.code != 'ERROR_ABORTED_BY_USER') {
        _showSignInError(context, e);
      }
    } finally {
      setState(() => _isloading = false);
    }
  }

  void _signInWithEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => EmailSignInPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time Tracker  App"),
        elevation: 10.0,
      ),
      body: _buildContent(context),
      backgroundColor: Colors.grey[50],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                child: _buildHeader(),
                height: 50,
              ),
              SizedBox(height: 16.0),
              SocialSignInButton(
                assetName: "images/google-logo.png",
                color: Colors.white,
                text: "Sign in with Google",
                textColor: Colors.black87,
                onPressed: _isloading ? null : () => _signInWithGoogle(context),
              ),
              SizedBox(
                height: 8.0,
              ),
              SocialSignInButton(
                assetName: "images/facebook-logo.png",
                text: "Sign in with Facebook",
                color: Color(0xFF334092),
                onPressed:
                    _isloading ? null : () => _signInWithFacebook(context),
                textColor: Colors.white,
              ),
              SizedBox(
                height: 8.0,
              ),
              SignInButton(
                text: "Sign in with Email",
                color: Colors.teal,
                borderRadius: 4.0,
                onPressed: _isloading ? null : () => _signInWithEmail(context),
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
                onPressed:
                    _isloading ? null : () => _signInAnonymously(context),
                textColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    if (_isloading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Text(
      "Sign in",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
