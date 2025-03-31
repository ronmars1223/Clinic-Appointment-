import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  String? _emailError;
  String? _usernameError;
  String? _passwordError;
  String? _confirmPasswordError;

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    return null; // Validation successful
  }

  String? _usernameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your username';
    }
    return null; // Validation successful
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null; // Validation successful
  }

  String? _confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null; // Validation successful
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20), // Padding around the entire form
            constraints: BoxConstraints(
              maxWidth: 400, // Optional: Set a max width for better layout on larger screens
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center, // Center vertically
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1), // Top margin

                // Header Text
                Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFEF6B39),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01), // Space between header and subheading

                // Subheading
                Text(
                  'Create an account to get started.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03), // Space between subheading and email field

               
                SizedBox(height: 4), // Small space between username field and error message
                if (_usernameError != null) ...[
                  Row(
                    children: [
                      Icon(Icons.error, color: Colors.red, size: 14),
                      SizedBox(width: 8),
                      Text(
                        _usernameError!,
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ],
                  ),
                ],
                SizedBox(height: MediaQuery.of(context).size.height * 0.02), // Space between username and email field

                // Email Field
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Color(0xFFEF6B39)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Color(0xFFEF6B39)),
                    ),
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    _emailError = _emailValidator(value);
                    return null;
                  },
                ),
                SizedBox(height: 4), // Small space between email field and error message
                if (_emailError != null) ...[
                  Row(
                    children: [
                      Icon(Icons.error, color: Colors.red, size: 14),
                      SizedBox(width: 8),
                      Text(
                        _emailError!,
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ],
                  ),
                ],
                SizedBox(height: MediaQuery.of(context).size.height * 0.02), // Space between email and password field

                // Password Field
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Color(0xFFEF6B39)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Color(0xFFEF6B39)),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        color: Color(0xFFEF6B39),
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    _passwordError = _passwordValidator(value);
                    return null;
                  },
                ),
                SizedBox(height: 4), // Small space between password field and error message
                if (_passwordError != null) ...[
                  Row(
                    children: [
                      Icon(Icons.error, color: Colors.red, size: 14),
                      SizedBox(width: 8),
                      Text(
                        _passwordError!,
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ],
                  ),
                ],
                SizedBox(height: MediaQuery.of(context).size.height * 0.02), // Space before confirm password field

                // Confirm Password Field
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: _obscureConfirmPassword,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    labelStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Color(0xFFEF6B39)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Color(0xFFEF6B39)),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                        color: Color(0xFFEF6B39),
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureConfirmPassword = !_obscureConfirmPassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    _confirmPasswordError = _confirmPasswordValidator(value);
                    return null;
                  },
                ),
                SizedBox(height: 4), // Small space between confirm password field and error message
                if (_confirmPasswordError != null) ...[
                  Row(
                    children: [
                      Icon(Icons.error, color: Colors.red, size: 14),
                      SizedBox(width: 8),
                      Text(
                        _confirmPasswordError!,
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ],
                  ),
                ],
                SizedBox(height: MediaQuery.of(context).size.height * 0.02), // Space before signup button

                // Sign Up Button
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _usernameError = _usernameValidator(_usernameController.text);
                      _emailError = _emailValidator(_emailController.text);
                      _passwordError = _passwordValidator(_passwordController.text);
                      _confirmPasswordError = _confirmPasswordValidator(_confirmPasswordController.text);
                    });

                    if (_usernameError == null && _emailError == null && _passwordError == null && _confirmPasswordError == null) {
                      // Perform signup logic
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Signing up...'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 60), // Full width button
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(color: Colors.transparent),
                    ),
                    backgroundColor: Color(0xFFEF6B39),
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02), // Space before "or signup with" section

                // ---- or signup with ---- section
                Row(
                  children: [
                    Expanded(child: Divider(thickness: 1, color: Colors.grey)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "or sign up with",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Expanded(child: Divider(thickness: 1, color: Colors.grey)),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02), // Space before social media buttons

                // Social Media Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.facebook, color: Colors.blue, size: 30),
                      onPressed: () {
                        // Add Facebook signup logic
                      },
                    ),
                    IconButton(
                      icon: Image.asset(
                        'assets/google.png', // Path to the multi-colored Google logo
                        height: 40, // Adjust size as needed
                        width: 40,
                      ),
                      onPressed: () {
                        // Add Google signup logic here
                      },
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.10), // Space before signup text

                // Don't have an account? Signup Text
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigate to Login page
                          Navigator.pop(context); // Assuming this pops back to the login screen
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Color(0xFFEF6B39),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0), // Space at the bottom
              ],
            ),
          ),
        ),
      ),
    );
  }
}
