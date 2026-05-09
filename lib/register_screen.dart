import 'package:flutter/material.dart';
import 'models/user.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Role _selectedRole = Role.pembeli;

  // Dummy users list (shared, but for simplicity, add here)
  final List<User> _dummyUsers = [
    User(username: 'admin', password: 'admin123', role: Role.admin),
    User(username: 'pembeli', password: 'pembeli123', role: Role.pembeli),
  ];

  void _register() {
    String username = _usernameController.text.trim();
    String password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username dan password harus diisi')),
      );
      return;
    }

    bool exists = _dummyUsers.any((u) => u.username == username);
    if (exists) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username sudah ada')),
      );
      return;
    }

    User newUser = User(username: username, password: password, role: _selectedRole);
    _dummyUsers.add(newUser);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Registrasi berhasil, silakan login')),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.greenAccent, Colors.lightGreen, Colors.green],
          ),
        ),
        child: Center(
          child: Card(
            margin: const EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Register Akun',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(labelText: 'Username'),
                  ),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  DropdownButton<Role>(
                    value: _selectedRole,
                    items: Role.values.map((role) {
                      return DropdownMenuItem(
                        value: role,
                        child: Text(role == Role.admin ? 'Admin' : 'Pembeli'),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedRole = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _register,
                    child: const Text('Register'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}