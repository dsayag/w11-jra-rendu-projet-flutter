import 'package:dwmgex/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String name = '';
  String city = '';
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
              Text('Register'),
              SizedBox(
                height: 10.h,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Champ Name
                    TextFormField(
                      onSaved: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Empty Name';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Name', hintText: 'Enter your name'),
                    ),
                    // Champ City
                    TextFormField(
                      onSaved: (value) {
                        setState(() {
                          city = value;
                        });
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Empty City';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'City', hintText: 'Enter your city'),
                    ),
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
                                r"^[a-zA-Z0-9.]+@[a-zA-Z0-9-]+\.[a-z]+$")
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
                        UserCredential userCredential =
                            await firebaseAuth.createUserWithEmailAndPassword(
                                email: email, password: password);
                        if (userCredential.user != null) {
                          final docReference = firestore.collection('users');
                          docReference.add(
                              {'name': name, 'email': email, 'city': city});
                        }
                        Navigator.pushReplacementNamed(context, '/home');
                      } on FirebaseAuthException catch (error) {
                        if (error.code == 'weak-password') {
                          setState(() {
                            errorFirebase = 'Password too weak';
                          });
                        } else if (error.code == 'email-already-in-use') {
                          setState(() {
                            errorFirebase = 'Email already use';
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
                    Navigator.pop(context);
                  },
                  child: Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}
