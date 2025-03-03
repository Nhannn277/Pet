import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_care/features/auth/login_screen.dart';
import 'package:pet_care/features/auth/signup_screen.dart';
import 'package:pet_care/features/banner/first_banner.dart';
import 'package:pet_care/features/home/home_screen.dart';
import 'package:pet_care/features/settings/account_screen.dart';
import 'package:pet_care/widgets/bottom_nav_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
    print("success");
  } catch (e) {
    print("Firebase Initialization Error: $e");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (snapshot.hasData) {
            return const NavigationRailPage(); // User is logged in
          } else {
            return SignupScreen(); // User is not logged in
          }
        },
      ),
    );
  }
}

class NavigationRailPage extends StatefulWidget {
  const NavigationRailPage({super.key});

  @override
  State<NavigationRailPage> createState() => _NavigationRailPageState();
}

class _NavigationRailPageState extends State<NavigationRailPage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = [
    HomeScreen(),
    AccountScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages.elementAt(_selectedIndex),

        bottomNavigationBar: SafeArea(
          child: BottomNavBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
    );
  }
}