enum Role { pembeli, admin }

class User {
  String username;
  String password;
  Role role;

  User({required this.username, required this.password, required this.role});
}

// Shared user list for both login and registration
List<User> appUsers = [
  User(username: 'admin', password: 'admin123', role: Role.admin),
  User(username: 'pembeli', password: 'pembeli123', role: Role.pembeli),
];