import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wnndderpc/colors.dart';
import 'package:wnndderpc/google_sign_in.dart';
import 'package:wnndderpc/pages/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        title: "WNNDERPC",
        debugShowCheckedModeBanner: false,
        home: const Welcome_page(),
        theme: ThemeData(
          primaryColor: AppColours.green
        ),
      ),
    );
  }
}
