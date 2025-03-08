import 'package:flutter/material.dart';
import 'package:saathi/components/logo_component.dart';
import 'package:saathi/screens/home_screen.dart';
import 'package:saathi/screens/register_screen.dart';
import '../components/custom_button.dart';
import '../components/custom_textbox.dart';
import '../components/custom_text.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _handleLogin() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Please fill in both fields")));
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
    // Perform login logic here (API call, validation, etc.)
  }

  void _handleFacebookLogin() {
    // Perform Facebook login logic here
    print("Logging in with Facebook");
  }

  void _handleGoogleLogin() {
    // Perform Google login logic here
    print("Logging in with Google");
  }

  void _handleAppleLogin() {
    // Perform Apple login logic here
    print("Logging in with Apple");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/background.jpg',
                ), // Add your background image here
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Login Form
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LogoComponent(height: 100, width: 100),
                    const SizedBox(height: 20),
                    CustomTextBox(
                      hintText: "Email",
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      icon: Icons.email,
                    ),
                    const SizedBox(height: 16),
                    CustomTextBox(
                      hintText: "Password",
                      controller: passwordController,
                      isPassword: true,
                      icon: Icons.lock,
                    ),
                    TextButton(
                      onPressed: () {
                        print("Forgot Password Clicked");
                      },
                      child: CustomText(
                        text: "Forgot Password?",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),

                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(text: "Login", onPressed: _handleLogin),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ),
                            );
                          },
                          child: CustomText(
                            text: "Register",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Or login with",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Image.asset(
                            'assets/icons/facebook.png',
                          ), // Add your Facebook icon here
                          iconSize: 10,
                          onPressed: _handleFacebookLogin,
                        ),
                        IconButton(
                          icon: Image.asset(
                            'assets/icons/google.png',
                          ), // Add your Google icon here
                          iconSize: 10,
                          onPressed: _handleGoogleLogin,
                        ),
                        IconButton(
                          icon: Image.asset(
                            'assets/icons/apple.png',
                          ), // Add your Apple icon here
                          iconSize: 10,
                          onPressed: _handleAppleLogin,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
