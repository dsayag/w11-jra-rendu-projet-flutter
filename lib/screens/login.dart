import 'package:dwmgex/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String errorFirebase = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              // ScreenUtil().setHeight(15) = 15.h
              vertical: 15.h,
              // ScreenUtil().setWidth(10) = 10.w
              horizontal: 10.w),
          child: Column(
            children: [
              Text('Login'),
              SizedBox(
                height: 10.h,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Champ Email
                    TextFormField(
                      onSaved: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Empty Email';
                        } else if (!RegExp(
                                r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-z]+$")
                            .hasMatch(value)) {
                          return 'Invalid Email';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Email', hintText: 'Enter your email'),
                    ),
                    // Champ Password
                    TextFormField(
                      obscureText: true,
                      onSaved: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Empty Password';
                        } else if (value.length < 8) {
                          return 'Password too short';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your paswword'),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      try {
                        await firebaseAuth.signInWithEmailAndPassword(
                            email: email, password: password);
                        Navigator.pushReplacementNamed(context, '/home');
                      } on FirebaseAuthException catch (error) {
                        if (error.code == 'user-not-found') {
                          setState(() {
                            errorFirebase = 'User not found';
                          });
                        } else if (error.code == 'wrong-password') {
                          setState(() {
                            errorFirebase = 'Email or Password invalid';
                          });
                        }
                      }
                    }
                  },
                  child: Text('Submit')),
              SizedBox(
                height: 20.h,
              ),
              Text(errorFirebase),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/register");
                  },
                  child: Text('Register'))
            ],
          ),
        ),
      ),
    );
  }
}
