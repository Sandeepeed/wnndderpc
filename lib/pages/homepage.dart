import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wnndderpc/colors.dart';
import 'package:wnndderpc/pages/logged_in.dart';
import 'package:wnndderpc/widgets/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot)
          {
            if(snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(color: AppColours.green,),);
            }
            else if(snapshot.hasError)
              {
                return Center(child: Text("ERRORRR"),);
              }
            else if(snapshot.hasData){
              return LoggedIn();
            }
            else
              {
                return LoginPage();
              }
          },
          ),
    );
  }
}
