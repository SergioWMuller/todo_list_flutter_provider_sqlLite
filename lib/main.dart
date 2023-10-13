import 'package:todo_list_provider/app/services/app_module.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';

void main() async {
  // pro firebase funcionar
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  runApp(const AppModule());
}
