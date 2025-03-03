import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_care/data/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService _authService = AuthService();


  void signIn() async {
    String email = emailController.text;
    String password = passwordController.text;

    var user = await _authService.signIn(email, password);

    if (user != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Sign in successful!')));
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sign in failed. Please try again.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                'assets/petbuddy.png', // Replace with your logo
                height: 200,
              ),
              const SizedBox(height: 10),

              // Email TextField
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Password TextField
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Quên mật khẩu', style: TextStyle(color: Colors.blue)),
                ),
              ),
              const SizedBox(height: 10),

              // Login Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: signIn,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Đăng nhập', style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ),
              const SizedBox(height: 20),

              // Social Media Sign In
              Text(
                'or connect with',
                style: TextStyle(color: Colors.grey[600]),
              ),
              const SizedBox(height: 15),

              // Google Sign-In
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: const FaIcon(FontAwesomeIcons.google, color: Colors.white),
                  label: const Text('Đăng nhập với Google', style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 10),

              // Facebook Sign-In
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: const FaIcon(FontAwesomeIcons.facebook, color: Colors.white),
                  label: const Text('Đăng nhập với Facebook', style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 10),

              // Apple Sign-In
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: const FaIcon(FontAwesomeIcons.apple, color: Colors.white),
                  label: const Text('Đăng nhập với AppleID', style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 20),

              // Sign Up
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Đăng ký tài khoản mới',
                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
