import 'package:flutter/material.dart';
import 'package:pet_care/data/services/auth_service.dart';
import 'package:pet_care/features/auth/login_screen.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  bool isChecked = false;

  void signUp() async {
    String email = emailController.text;
    String password = passwordController.text;
    var user = await _authService.signUp(email, password);

    if (user != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Sign up successful!')));
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sign up failed. Please try again.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/background.png', // Make sure you have this image in assets
              fit: BoxFit.cover,
            ),
          ),

          // Semi-transparent Overlay
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.3), // Dark overlay for contrast
            ),
          ),

          // Form Container
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                // margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9), // Slight transparency
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Adjust size dynamically
                  children: [
                    // Profile Icon
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: const Icon(Icons.person_2_outlined, color: Colors.blue, size: 35),
                    ),

                    const SizedBox(height: 15),

                    // Title
                    const Text(
                      "Tạo tài khoản",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 5),

                    // Subtitle
                    const Text(
                      "Đăng ký tài khoản PetBuddy",
                      style: TextStyle(color: Colors.grey),
                    ),

                    const SizedBox(height: 20),

                    // Email Field
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),

                    const SizedBox(height: 15),

                    // Password Field
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        suffixIcon: Icon(Icons.visibility_off),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Terms and Conditions Checkbox
                    Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        const Text("Tôi đồng ý với "),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            "Chính sách của PetBuddy",
                            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    // Sign Up Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: signUp,
                        child: const Text("Tạo tài khoản", style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Login Redirect
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const LoginScreen()),
                        );
                      },
                      child: const Text.rich(
                        TextSpan(
                          text: "Đã có tài khoản? ",
                          children: [
                            TextSpan(
                              text: "Đăng nhập ngay!",
                              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ),
        ],
      ),
    );
  }
}
