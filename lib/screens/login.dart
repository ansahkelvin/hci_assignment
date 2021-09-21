import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hci/screens/register.dart';
import 'package:hci/widget/custom_dialog.dart';

import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  static const String route = "/login";
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  late final AnimationController controller;
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  bool isLoading = false;
  bool isObscure = true;

  void _onEditingComplete() {
    //Switching focus node to password only if there are no errors with email
    FocusScope.of(context).requestFocus(passwordFocusNode);
  }

  @override
  void initState() {
    controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void setStates(dynamic value, dynamic state) {
    return setState(() {
      value = state;
    });
  }

  bool validate() {
    final formKey = _formkey.currentState!;

    if (formKey.validate()) {
      formKey.save();
      return true;
    }
    return false;
  }

  Future<void> validateAndSubmit() async {}

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Center(
                child: LottieBuilder.asset(
                  "assets/26436-login-circle.json",
                  width: 200,
                  height: 200,
                  repeat: false,
                  onLoaded: (composition) {
                    controller
                      ..duration = composition.duration
                      ..forward();
                  },
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              _buildTextfields(context),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => validateAndSubmit(),
                child: isLoading
                    ? const CustomProgressIndicator(
                        status: "Signing In",
                      )
                    : Container(
                        height: 50,
                        width: width > 1000 ? 600 : width,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                        ),
                        child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                child: Text(
                  isLoading ? "Signing in" : "Forgot password?",
                  style: const TextStyle(
                    color: Color(0xff00b894),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          fullscreenDialog: true,
                          builder: (context) => const SignUpPage(),
                        ),
                      ),
                      child: const Text(
                        "Don't have an account? Register",
                        style: TextStyle(
                          color: Color(0xff00b894),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Form _buildTextfields(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Form(
      key: _formkey,
      child: SizedBox(
        width: width > 1000 ? 600 : width,
        child: Column(
          children: [
            TextFormField(
              onEditingComplete: _onEditingComplete,
              controller: emailController,
              validator: (value) => value!.length < 4 || !value.contains("@")
                  ? "Please enter valid email"
                  : null,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  CupertinoIcons.mail,
                  color: Color(0xffb7c6d9),
                ),
                hintText: "Email",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffb7c6d9),
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffb7c6d9),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffb7c6d9),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: isObscure,
              onEditingComplete: validateAndSubmit,
              textInputAction: TextInputAction.done,
              validator: (value) =>
                  value!.length < 4 ? "Please enter valid password" : null,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                      isObscure ? Icons.visibility : Icons.visibility_off,
                      color: const Color(0xffb7c6d9)),
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                ),
                prefixIcon: const Icon(
                  CupertinoIcons.lock,
                  color: Color(0xffb7c6d9),
                ),
                hintText: "Password",
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffb7c6d9),
                  ),
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffb7c6d9),
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffb7c6d9),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
