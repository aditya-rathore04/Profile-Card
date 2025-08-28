import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

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

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
  }

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
            _buildSocialIcons()
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIcons() {
    final icons = [
      {
        "icon": "assets/icons/instagram-1-svgrepo-com.svg",
        "url": "https://www.instagram.com/billieeilish/"
      },
      {
        "icon": "assets/icons/tiktok-svgrepo-com.svg",
        "url": "https://www.tiktok.com/@billieeilish"
      },
      {
        "icon": "assets/icons/twitter-x.svg",
        "url": "https://twitter.com/billieeilish"
      },
      {
        "icon": "assets/icons/facebook-1-svgrepo-com.svg",
        "url": "https://www.facebook.com/billieeilish"
      },
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: icons.map((data) {
        return InkWell(
          onTap: () => _launchURL(data["url"]!),
          borderRadius: BorderRadius.circular(12),
          splashColor: Colors.blue.withOpacity(0.2),
          child: SvgPicture.asset(data["icon"]!, height: 30),
        );
      }).toList(),
    );
  }
}

