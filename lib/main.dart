import 'package:firebase_auth_lab/start/app.dart';
import 'package:firebase_auth_lab/start/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';



const clientId = 'YOUR_CLIENT_ID';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

