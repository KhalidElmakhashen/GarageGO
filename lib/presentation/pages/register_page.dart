import 'package:flutter/material.dart';
import 'package:legarage/presentation/widgets/custom_text.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: SafeArea(child: Container())),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Center(
                child: Column(
                  children: [
                    CustomText(
                      "I ${String.fromCharCode(0x1F440)} Spot",
                      color: Color(0xff0738A6),
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomText(
                      "Your Gateway to Stress-Free Parking",
                      color: Color.fromARGB(255, 32, 34, 42),
                      fontSize: 14,
                    ),
                    const CustomText(
                      " Reserve. Arrive. Relax.",
                      color: Color.fromARGB(255, 31, 34, 40),
                      fontSize: 14,
                    ),
                   const  SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
              const CustomText(
                "Create New Account, Now.",
                fontSize: 18,
              ),
              const SizedBox(
                height: 8,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Material(
                      elevation: 5,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'First Name',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(8)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Material(
                      elevation: 5,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Last Name',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(8)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your last name';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Material(
                      elevation: 5,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Email',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(8)),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Material(
                      elevation: 5,
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(8),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscured
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isObscured = !_isObscured;
                              });
                            },
                          ),
                        ),
                        obscureText: _isObscured,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0), // Rounded corners
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.blue,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, "/");
                    }
                  },
                  child: Text('Register'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
