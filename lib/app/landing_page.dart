import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_app/app/home_page.dart';
import 'package:time_tracker_app/app/sign_in/sign_in.dart';

import 'package:time_tracker_app/services/auth.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);

    return StreamBuilder(
        stream: auth.onAuthStateChanged,
        // initialData: ,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User user = snapshot.data;

            if (user == null) {
              return SignInPage();
            }
            return HomePage();
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
