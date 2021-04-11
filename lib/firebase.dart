import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dwmgex/models/movie.dart';
import 'package:dwmgex/models/testuser.dart';
import 'package:firebase_auth/firebase_auth.dart';

final firebaseAuth = FirebaseAuth.instance;

final firestore = FirebaseFirestore.instance;

getMovies() async {
  List result = [];
  final movies = await firestore.collection('movies').get();
  if (movies.docs != null) {
    result = movies.docs.map((doc) => Movie().fromJson(doc.data())).toList();
  }
  return result;
}

getTestUsers() async {
  List result = [];
  final testusers = await firestore.collection('users').get();
  if (testusers.docs != null) {
    result =
        testusers.docs.map((doc) => TestUser().fromJson(doc.data())).toList();
  }
  return result;
}

getUser(email) async {
  var users = await getTestUsers();
  var user = users.firstWhere((user) => user.email == email);
  return user;
}
