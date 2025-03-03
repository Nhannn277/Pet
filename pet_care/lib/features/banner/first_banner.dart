import 'package:flutter/material.dart';
import 'package:pet_care/data/services/auth_service.dart';
import 'package:pet_care/features/auth/login_screen.dart';



class FirstBannerScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/banner_1.png', // Make sure you have this image in assets
              fit: BoxFit.cover,
            ),
          ),

          // Form Container
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              // margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white, // Slight transparency
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
                  Image(
                   image: AssetImage("assets/petbuddy.png"),
                    width: 180,
                    height: 180,
                  ),

                  const SizedBox(height: 5),
                  
                  Text("PetBuddy xin chào!", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),

                  SizedBox(height: 5,),
                  Text("Cùng bạn chăm sóc\nnhững người bạn bốn chân 💖", style: TextStyle(fontSize: 18, color: Colors.grey[400], fontWeight: FontWeight.bold),),


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
                      onPressed: () {},
                      child: const Text("Tiếp theo", style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
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
