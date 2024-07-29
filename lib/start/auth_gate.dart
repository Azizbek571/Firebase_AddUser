import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SignInScreen(
              providers: [
                EmailAuthProvider(),
              ],
              headerBuilder: (context, constraints, shrinkOffset) {
                return Padding(
                  padding: EdgeInsets.all(20),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset('assets/images/flutter.png'),
                  ),
                );
              },
              subtitleBuilder: (context, action) {
                return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: action == AuthAction.signIn
                        ? Text("Welcome to FlutterFire, please Sign in")
                        : Text("Welcome to FlutterFire, please Sign in"));
              },
              footerBuilder: (context, action) {
                return Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    "By signing in, you agree to our terms and conditions.",
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              },
              sideBuilder: (context, shrink0ffset) {
                return Padding(padding: EdgeInsets.all(20),
                child: AspectRatio(aspectRatio: 1,
                child: Image.asset('assets/images/firebase.png'),
                ),
                );
                
              },
            );
          }
          return const HomeScreen();
        });
  }
}
