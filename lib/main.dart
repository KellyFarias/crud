import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

void main() {
  runApp(MyCrud());
}

class MyCrud extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Crud 3', home: LoginPage(title: 'Firebase Auth'));
  }
}

class LoginPage extends StatefulWidget {
  final String title;
  LoginPage({Key key, this.title}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
        ),
        body: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                    labelText: 'Email', icon: Icon(Icons.email)),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextField(
                controller: passwdController,
                decoration: InputDecoration(
                    labelText: 'Password', icon: Icon(Icons.vpn_key)),
              ),
              SizedBox(
                height: 15.0,
              ),
              FlatButton(
                child: Text('Login'),
                color: Colors.orangeAccent,
              )
            ],
          ),
        ));
  }
}
