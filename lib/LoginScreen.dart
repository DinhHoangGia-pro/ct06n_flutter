import 'package:flutter/material.dart';
import 'package:helloworld/MyCrypto.dart';
import 'RegisterScreen.dart';
import 'models/User.dart';
import 'MainScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernamController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String errorMessage = '';

  void login() {
    String username = usernamController.text;
    String password = passwordController.text;

    User? user = User.authenticate(username, MyCrypto.hashText(password));
    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    } else {
      setState(() {
        errorMessage = 'Email hoặc mật khẩu không chính xác';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: usernamController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            if (errorMessage.isNotEmpty)
              Text(errorMessage, style: TextStyle(color: Colors.red)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: login,
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
              child: Text('Chưa có tài khoản? Đăng ký ngay!'),
            ),
          ],
        ),
      ),
    );
  }
}
