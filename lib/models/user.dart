enum Role { pembeli, admin }

class User {
  String username;
  String password;
  Role role;

  User({required this.username, required this.password, required this.role});
}