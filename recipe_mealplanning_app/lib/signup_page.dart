import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'database_helper.dart';
 
 class SignUpPage extends StatelessWidget {
   final TextEditingController _firstNameController = TextEditingController();
   final TextEditingController _lastNameController = TextEditingController();
   final TextEditingController _emailController = TextEditingController();
   final TextEditingController _userIdController = TextEditingController();
   final TextEditingController _passwordController = TextEditingController();
   final TextEditingController _confirmPasswordController =
       TextEditingController();
 
   final DatabaseHelper dbHelper = DatabaseHelper();
   // Function to validate the email format
   bool _isValidEmail(String email) {
     // Updated regular expression for stricter email validation
     final RegExp emailRegExp = RegExp(
       r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
     );
     return emailRegExp.hasMatch(email);
   }
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text('Recipe and meal planning app'),
         centerTitle: true,
         backgroundColor: Color(0xFFAF7AC5),
       ),
       body: Padding(
         padding: EdgeInsets.all(16.0),
         child: SingleChildScrollView(
           child: Column(
             children: [
               TextField(
                 controller: _firstNameController,
                 decoration: InputDecoration(
                   labelText: 'First Name',
                   border: OutlineInputBorder(),
                 ),
               ),
               SizedBox(height: 16),
               TextField(
                 controller: _lastNameController,
                 decoration: InputDecoration(
                   labelText: 'Last Name',
                   border: OutlineInputBorder(),
                 ),
               ),
               SizedBox(height: 16),
               TextField(
                 controller: _emailController,
                 decoration: InputDecoration(
                   labelText: 'Email',
                   border: OutlineInputBorder(),
                 ),
               ),
               SizedBox(height: 16),
               TextField(
                 controller: _userIdController,
                 decoration: InputDecoration(
                   labelText: 'User ID',
                   border: OutlineInputBorder(),
                 ),
               ),
               SizedBox(height: 16),
               TextField(
                 controller: _passwordController,
                 obscureText: true,
                 decoration: InputDecoration(
                   labelText: 'Password',
                   border: OutlineInputBorder(),
                 ),
               ),
               SizedBox(height: 16),
               TextField(
                 controller: _confirmPasswordController,
                 obscureText: true,
                 decoration: InputDecoration(
                   labelText: 'Confirm Password',
                   border: OutlineInputBorder(),
                 ),
               ),
               SizedBox(height: 16),
               ElevatedButton(
                 onPressed: () async {
                   // Check if passwords match
                   String firstName = _firstNameController.text;
                   String lastName = _lastNameController.text;
                   String email = _emailController.text;
                   String userId = _userIdController.text;
                   String password = _passwordController.text;
                   String confirmPassword = _confirmPasswordController.text;
 
                   // Check if any field is empty
                   if (firstName.isEmpty ||
                       lastName.isEmpty ||
                       email.isEmpty ||
                       userId.isEmpty ||
                       password.isEmpty ||
                       confirmPassword.isEmpty) {
                     ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(content: Text('All fields are required!')),
                     );
                     return;
                   }
 
                   // Check if email is in proper format
                   if (!_isValidEmail(email)) {
                     ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(
                           content: Text('Please enter a valid email address!')),
                     );
                     return;
                   }
 
                   // Check if passwords match
                   if (password != confirmPassword) {
                     ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(content: Text('Passwords do not match!')),
                     );
                     return;
                   }
                   // Platform-specific storage
                   if (Theme.of(context).platform == TargetPlatform.android ||
                       Theme.of(context).platform == TargetPlatform.iOS) {
                     // Mobile: Insert user into database
                     Map<String, dynamic> user = {
                       'first_name': firstName,
                       'last_name': lastName,
                       'email': email,
                       'user_id': userId,
                       'password': password,
                     };
                     await dbHelper.insertUser(user);
                   } else {
                     // Web: Store user credentials in SharedPreferences
                     SharedPreferences prefs =
                         await SharedPreferences.getInstance();
                     await prefs.setString(userId, password);
                     // Optionally, store other user data as needed
                   }
                   
 
                   ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(content: Text('User registered successfully!')),
                   );
                   Navigator.pop(context); // Go back to login page
                 },
                 child: Text('Sign Up'),
               ),
             ],
           ),
         ),
       ),
     );
   }
 }