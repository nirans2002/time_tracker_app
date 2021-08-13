import 'package:flutter/material.dart';
import 'package:time_tracker_app/app/home_page.dart';
import 'package:time_tracker_app/app/sign_in/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User? _user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkCurrentUser();
  }

  Future<void> _checkCurrentUser() async {
    User user = await FirebaseAuth.instance.currentUser!;
    _updateUser(user);
  }

  void _updateUser(User user) {
    // print('Userid: ${user.uid}');
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    if (_user == null) {
      return SignInPage(
        onSignIn: _updateUser,
      );
    } else {
      var _user;
      return HomePage(
        onSignOut: () => _updateUser(_user),
      );
    }
  }
}
