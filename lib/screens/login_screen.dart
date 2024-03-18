import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internal_app/bloc/auth/auth_bloc.dart';
import 'package:internal_app/components/cred_ai_header.dart';

import 'package:internal_app/screens/home.dart';

import '../widgets/customTextField.dart';
import '../widgets/glass_frosted_container.dart';
import '../widgets/glass_morphism_custom_container.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late final FocusNode _usernameFocus;
  late final FocusNode _passwordFocus;
  static final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _usernameFocus = FocusNode();
    _passwordFocus = FocusNode();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _usernameFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  void _loginHandler() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
            LoginEvent(_usernameController.text, _passwordController.text),
          );
    }
  }

  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthApifullfilled) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          } else if (state is AuthInvalidCredentials) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Invalid Credentials'),
                  content:
                      Text('Incorrect username or password. Please try again.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('OK'),
                    ),
                  ],
                );
              },
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: GlassMorphismFrostedContainer(
              start: 0.7,
              end: 0.3,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(
                    //   height: 150,
                    // ),
                    Icon(
                      Icons.data_exploration,
                      size: 169,
                    ),
                    CredAiHeader(),
                    SizedBox(
                      height: 40,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            keyboardType: TextInputType.emailAddress,
                            enabled: state is! AuthApiPending,
                            controller: _usernameController,
                            focusNode: _usernameFocus,
                            hintText: "username",
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Username is required';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextField(
                            keyboardType: TextInputType.visiblePassword,
                            enabled: state is! AuthApiPending,
                            controller: _passwordController,
                            focusNode: _passwordFocus,
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            hintText: "Password",
                            obscureText: _obscureText,
                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return 'Password required';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomGlassmorphicContainer(
                            height: 50,
                            // borderRadius: 10,
                            blur: 0,
                            colors: [
                              Color(0xFFFFFFFF).withOpacity(0.8),
                              Color(0xFFffffff).withOpacity(0.4),
                            ],
                            childWidget: Center(
                              child: TextButton(
                                onPressed: state is AuthApiPending
                                    ? null
                                    : _loginHandler,
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Color.fromARGB(255, 35, 35, 35),
                                  ),
                                  padding: MaterialStateProperty.all<
                                      EdgeInsetsGeometry>(
                                    EdgeInsets.all(15),
                                  ),
                                  textStyle:
                                      MaterialStateProperty.all<TextStyle>(
                                    TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                                child: state is AuthApiPending
                                    ? SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          color: const Color.fromARGB(
                                              255, 33, 33, 33),
                                          strokeWidth: 2,
                                        ),
                                      )
                                    : Text(
                                        "Login",
                                        style: TextStyle(fontSize: 18),
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
