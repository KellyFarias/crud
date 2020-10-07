import 'dart:async';

import 'package:crud/googlePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';



final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

class SignInPage extends StatefulWidget {
final String title='Registration';
 

  @override
  State<StatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Builder(builder:(BuildContext context){
            return FlatButton(
              child: const Text('Sign out/Desconectar'),
              onPressed: () async {
                final FirebaseUser user =  _auth.currentUser;
                  if(user==null){
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content:const Text('No one has signed in'),
                      ));
                  }
                _signOut();
                final String uid=user.uid;
                Scaffold.of(context).showSnackBar(SnackBar(
                  content:Text(uid + 'has sucessfully signout'),
                ));
              },
              );
          },)
        ],
      ),
      body: Builder(builder: (BuildContext context)
      {
        return ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
           _GoogleSignInSection(), 
          ],
        );
      }),
    );
  }
  void _signOut() async
  {
    await _auth.signOut();
  }

}
class _GoogleSignInSection extends StatefulWidget {
  
  @override
 State<StatefulWidget> createState() => _GoogleSignInSectionState();
}

class _GoogleSignInSectionState extends State<_GoogleSignInSection> {
  bool _success;
  String _userID;
  
  @override
  Widget build(BuildContext context) {
    return Column(
       children: <Widget>[
         Container(
           child: const Text('Test sign in with Google'),
           padding: const EdgeInsets.all(15),
           alignment: Alignment.center,
         ),
         Container(
           padding: const EdgeInsets.symmetric(vertical: 15.0),
           alignment: Alignment.center,
           child: Column(
             children: <Widget>[
               GoogleSignInButton(onPressed: ( )
               {
                 _SignInWithGoogle();
               },darkMode: true,)
             ],
           ),
         )
       ],
    );
  }

  void _SignInWithGoogle() async{
    final GoogleSignInAccount googleuser= await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleuser.authentication;
    // ignore: deprecated_member_use
    final AuthCredential  credential= GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // ignore: deprecated_member_use
    final FirebaseUser user= (await _auth.signInWithCredential(credential)).user;
    assert(user.displayName!= null);
    assert( await user.getIdToken()!= null);
FirebaseUser currentUser= await _auth.currentUser;

assert(user.uid==currentUser.uid);
setState(() {
  
  if(user!= null){
    _success=true;
    _userID=user.uid;
    Navigator.of(context).pushReplacement(CupertinoPageRoute(
      builder: (context)=> MainGoogle(),
      ));
  }
});

  }
}