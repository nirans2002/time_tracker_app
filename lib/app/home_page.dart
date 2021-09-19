import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:time_tracker_app/components/platform_alert_dialog.dart';
import 'package:time_tracker_app/services/auth.dart';

class HomePage extends StatelessWidget {
  // log out logic

  HomePage({
    @required this.auth,
  });
  final AuthBase auth;

  Future<void> _signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await PlatformAlertDialog(
      content: 'Are you sure to logout ?',
      title: 'Logout',
      defaultActionText: 'logout',
    ).show(context);
    if (didRequestSignOut == true) {
      _signOut();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: <Widget>[
          TextButton(
            onPressed: () => _confirmSignOut(context),
            child: Text(
              "Log out",
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
