import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_app/components/platform_alert_dialog.dart';
import 'package:time_tracker_app/services/auth.dart';

class HomePage extends StatelessWidget {
  // log out logic

  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context);
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
            cancelActionText: 'cancel')
        .show(context);
    if (didRequestSignOut == true) {
      _signOut(context);
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
