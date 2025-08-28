import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfileCard(),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF00B4DB),
              Color(0xFF0083B0),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: _buildProfileCard(),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildProfileCard() {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(40),
    ),
    elevation: 4,
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Image with drop shadow
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 12,
                  spreadRadius: 2,
                  offset: Offset(0, 6),
                )
              ],
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 460,
                  maxHeight: 460,
                ),
                child: AspectRatio(
                  aspectRatio: 1, // Width: Height = 1:1
                  child: Image.asset(
                    "assets/pictures/billie.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 20),

          // Name
          Text(
            "Billie Eilish",
            style: TextStyle(
              fontFamily: "DreamAvenue",
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 8),

          // Subtitle
          Text(
            "American singer-songwriter\nand musician",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 14,
              color: Colors.black87,
            ),
          ),

          SizedBox(height: 20),

          // Social Icons Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset("assets/icons/instagram-1-svgrepo-com.svg", height: 30),
              SvgPicture.asset("assets/icons/tiktok-svgrepo-com.svg", height: 30),
              SvgPicture.asset("assets/icons/twitter-x.svg", height: 30),
              SvgPicture.asset("assets/icons/facebook-1-svgrepo-com.svg", height: 30),
            ],
          )
        ],
      ),
    ),
  );
}