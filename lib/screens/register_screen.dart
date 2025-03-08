import 'package:flutter/material.dart';
import 'package:saathi/components/logo_component.dart';
import '../components/custom_button.dart';
import '../components/custom_textbox.dart';
import '../components/custom_text.dart';
import '../components/custom_datepicker.dart'; // Import the CustomDatePicker
import '../components/custom_dropdown.dart'; // Import the CustomDropdown

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController dobController =
      TextEditingController(); // Date of Birth Controller
  String? gender;
  String? bloodGroup;

  void _handleRegister() {
    String fullName = fullNameController.text.trim();
    String phoneNumber = phoneNumberController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();
    String dob = dobController.text.trim();

    if (fullName.isEmpty ||
        phoneNumber.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        dob.isEmpty ||
        gender == null ||
        bloodGroup == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Please fill in all fields")));
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Passwords do not match")));
      return;
    }

    // Perform registration logic here (API call, validation, etc.)
    print(
      "Registering with Full Name: $fullName, Phone Number: $phoneNumber, Email: $email, Password: $password, Date of Birth: $dob, Gender: $gender, Blood Group: $bloodGroup",
    );
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
          // Register Form
          Center(
            child: SingleChildScrollView(
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
                      hintText: "Full Name",
                      controller: fullNameController,
                      icon: Icons.person,
                    ),
                    const SizedBox(height: 16),
                    CustomTextBox(
                      hintText: "Phone Number",
                      controller: phoneNumberController,
                      keyboardType: TextInputType.phone,
                      icon: Icons.phone,
                    ),
                    const SizedBox(height: 16),
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
                    const SizedBox(height: 16),
                    CustomTextBox(
                      hintText: "Confirm Password",
                      controller: confirmPasswordController,
                      isPassword: true,
                      icon: Icons.lock,
                    ),
                    const SizedBox(height: 16),
                    CustomDatePicker(
                      controller: dobController,
                      hintText: "Date of Birth",
                    ),
                    const SizedBox(height: 16),
                    CustomDropdown<String>(
                      items: ["Male", "Female", "Other"],
                      selectedItem: gender,
                      onChanged: (newValue) {
                        setState(() {
                          gender = newValue;
                        });
                      },
                      itemLabel: (item) => item,
                      hintText: "Select Gender",
                    ),
                    const SizedBox(height: 16),
                    CustomDropdown<String>(
                      items: ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"],
                      selectedItem: bloodGroup,
                      onChanged: (newValue) {
                        setState(() {
                          bloodGroup = newValue;
                        });
                      },
                      itemLabel: (item) => item,
                      hintText: "Select Blood Group",
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          text: "Register",
                          onPressed: _handleRegister,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(
                              context,
                            ); // Navigate back to login screen
                          },
                          child: CustomText(
                            text: "Back to Login",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "Or register with",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 16.0,
                      children: [
                        IconButton(
                          icon: Image.asset(
                            'assets/icons/facebook.png',
                          ), // Add your Facebook icon here
                          iconSize: 40,
                          onPressed: _handleFacebookLogin,
                        ),
                        IconButton(
                          icon: Image.asset(
                            'assets/icons/google.png',
                          ), // Add your Google icon here
                          iconSize: 40,
                          onPressed: _handleGoogleLogin,
                        ),
                        IconButton(
                          icon: Image.asset(
                            'assets/icons/apple.png',
                          ), // Add your Apple icon here
                          iconSize: 40,
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
