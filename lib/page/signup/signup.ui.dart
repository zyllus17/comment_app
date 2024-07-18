import 'package:comment_app/constants/colors.const.dart';
import 'package:comment_app/helpers/email_regex.helper.dart';
import 'package:comment_app/page/home/home.ui.dart';
import 'package:comment_app/page/login/login.ui.dart';
import 'package:comment_app/services/auth.service.dart';
import 'package:comment_app/services/loading.dart';
import 'package:comment_app/widgets/custom_textformfield.widget.dart';
import 'package:comment_app/widgets/loading.widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLoading = Provider.of<LoadingState>(context).isLoading;

    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Comments',
          style: theme.textTheme.displayLarge,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  CustomTextFormField(
                    label: 'Name',
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    label: 'Email',
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!isValidEmail(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    label: 'Password',
                    obscureText: true,
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 8) {
                        return 'Password should be at least 8 characters';
                      }
                      return null;
                    },
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final String name = _nameController.text.trim();
                          final String email = _emailController.text.trim();
                          final String password =
                              _passwordController.text.trim();
                          if (email.isNotEmpty && password.isNotEmpty) {
                            try {
                              await Provider.of<AuthService>(context,
                                      listen: false)
                                  .signUpWithUserData(name, email, password);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()),
                              );
                              debugPrint('Signed up');
                            } on FirebaseAuthException catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        "${e.toString()} Something went wrong while creating account")),
                              );
                            } catch (e) {
                              debugPrint('Signup error: $e');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(e.toString())),
                              );
                            }
                          }
                        }
                      },
                      child: Text(
                        'Signup',
                        style: theme.textTheme.labelMedium,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account? '),
                      TextButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        ),
                        child: Text('Login', style: theme.textTheme.labelSmall),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          if (isLoading) const LoadingWidget(),
        ],
      ),
    );
  }
}
