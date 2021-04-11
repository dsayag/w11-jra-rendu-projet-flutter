class TestUser {
  String name;
  String email;
  String city;

  TestUser({this.name, this.email, this.city});

  fromJson(data) {
    return TestUser(
      name: data['name'],
      email: data['email'],
      city: data['city'],
    );
  }
}
