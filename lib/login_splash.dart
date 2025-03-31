import 'package:flutter/material.dart';
import 'login.dart';   // Import the login screen
import 'signup.dart';  // Import the signup screen

class LoginSplashScreen extends StatefulWidget {
  const LoginSplashScreen({super.key});

  @override
  _LoginSplashScreenState createState() => _LoginSplashScreenState();
}

class _LoginSplashScreenState extends State<LoginSplashScreen> {
  int _currentPage = 0; // Track the current page index
  bool _isAnimating = false;

  // List of images, titles, subheadings, and sizes to display on each slide
  final List<Map<String, dynamic>> _pages = [
    {
      'image': 'assets/love.png',    // Replace with actual image paths
      'title': 'Welcome to PawGuard',
      'subheading': 'Your Companion in Animal Rescue',
      'width': 330.0,         // Custom width for this image
      'height': 350.0,        // Custom height for this image
    },
    {
      'image': 'assets/adopt.png',
      'title': 'Adopt a Friend',
      'subheading': 'Find your perfect companion today!',
      'width': 330.0,         // Custom width for this image
      'height': 350.0,        // Custom height for this image
    },
    {
      'image': 'assets/rescue.png',
      'title': 'Rescue and Save',
      'subheading': 'Join our mission to help animals in need.',
      'width': 330.0,         // Custom width for this image
      'height': 350.0,        // Custom height for this image
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: _pages.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index; // Update the current page index
                });
              },
              itemBuilder: (context, index) {
                return FadeTransition(
                  opacity: _currentPage == index 
                    ? AlwaysStoppedAnimation(1.0) 
                    : AlwaysStoppedAnimation(0.0), // Simple fade effect
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Picture with resized image and margin
                      Container(
                        width: _pages[index]['width'],   // Adjust the width dynamically
                        height: _pages[index]['height'], // Adjust the height dynamically
                        margin: EdgeInsets.only(top: 70, bottom: 5), // Apply margin for spacing
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10), // Optional: Rounded corners for the image
                          image: DecorationImage(
                            image: AssetImage(_pages[index]['image']!), // Use image from the list
                            fit: BoxFit.contain, // Fit the image inside the container
                          ),
                        ),
                      ),
                      SizedBox(height: 1), // Space between image and title

                      // Title
                      Text(
                        _pages[index]['title']!, // Use title from the list
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFEF6B39), // Color for the title
                        ),
                      ),

                      // Subheading
                      Text(
                        _pages[index]['subheading']!, // Use subheading from the list
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700], // Color for the subheading
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 10), // Space between content and indicator

          // Page indicator (three small circles)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(_pages.length, (index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                width: _currentPage == index ? 12 : 8,
                height: _currentPage == index ? 12 : 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index ? Color(0xFFEF6B39) : Colors.grey,
                ),
              );
            }),
          ),

          SizedBox(height: 70), // Space between indicator and buttons

          // Buttons (Login and Signup remain static)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Login Button
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 1.0, end: _isAnimating ? 1.05 : 1.0),
                duration: Duration(milliseconds: 300),
                builder: (context, scale, child) {
                  return Transform.scale(
                    scale: scale,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _isAnimating = !_isAnimating; // Trigger animation
                        });
                        // Navigate to Login screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(140, 10),
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(color: Color(0xFFEF6B39), width: 2),
                        ),
                        backgroundColor: Color(0xFFEF6B39),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(width: 20), // Space between buttons

              // Signup Button
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 1.0, end: _isAnimating ? 1.05 : 1.0),
                duration: Duration(milliseconds: 300),
                builder: (context, scale, child) {
                  return Transform.scale(
                    scale: scale,
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          _isAnimating = !_isAnimating; // Trigger animation
                        });
                        // Navigate to Signup screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupScreen()),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(140, 10),
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        side: BorderSide(color: Color(0xFFEF6B39), width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        'Signup',
                        style: TextStyle(fontSize: 16, color: Color(0xFFEF6B39)),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),

          SizedBox(height: 40), // Bottom space
        ],
      ),
    );
  }
}
