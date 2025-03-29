class User {
  int? id;
  String? fullname;
  String? email;
  String? password;
  String? passwordConfirmation;
  String? authToken;
  User({this.id, this.fullname, this.email, this.authToken});
  factory User.fromJSON(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      fullname: json['fullname'],
      email: json['email'],
      authToken: json['auth_token']
    );
  }
  Map<String,dynamic> toJSON() => {
    'id': id,
    'fullname': fullname,
    'email': email,
    'password': password,
    'password_confirmation': passwordConfirmation,
    'auth_token': authToken
  };
}