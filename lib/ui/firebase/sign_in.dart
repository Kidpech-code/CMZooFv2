/*import 'package:CMZoo/pages/dashborad.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      body: Column(
        children: [
          withEmailPassword(),
        ],
      ),
    );
  }

  Widget withEmailPassword() {
    return Form(
      key: _formkey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              child: const Text('กรอก อีเมล และ รหัสบัตรพนักงาน'),
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "Email",
              ),
              validator: (String val) {
                if (val.isEmpty) {
                  return 'กรุณากรอกอีเมล';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: "Password",
              ),
              validator: (String val) {
                if (val.isEmpty) {
                  return 'กรุณากรอกรหัสบัตรพนักงาน';
                }
                return null;
              },
            ),
            Container(
              padding: const EdgeInsets.only(top: 16),
              alignment: Alignment.center,
              child: OutlineButton(
                child: Text('SignIn'),
                onPressed: () async {
                  if (_formkey.currentState.validate()) {
                    _signinWithEmailPassword();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _signinWithEmailPassword() async {
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text))
          .user;
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return DashboradPage();
      }));
    } catch (e) {
      _scaffoldkey.currentState.showSnackBar(SnackBar(
        content: Text('Failed to sign in email and password'),
      ));
      print(e);
    }
  }
}*/
