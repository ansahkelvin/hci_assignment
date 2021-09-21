import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hci/screens/complete_and_submit.dart';
import 'package:hci/screens/login.dart';
import 'package:hci/widget/custom_dialog.dart';

import 'package:lottie/lottie.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with TickerProviderStateMixin {
  late final AnimationController controller;
  final _formKey = GlobalKey<FormState>();
  late bool? isSelected = false;
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  bool showVisibility = true;
  bool isLoading = false;

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
    nameController.dispose();

    super.dispose();
  }

  bool validate() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      return true;
    }
    return false;
  }

  Future<void> submit() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => CompleteAndSubmit(
          email: emailController.text,
          name: nameController.text,
          password: passwordController.text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
          child: SizedBox(
            width:  width > 1000? 1000 : width,
            child: Padding(
              padding: width > 1000
                  ? const EdgeInsets.only(left: 300.0)
                  : const EdgeInsets.only(left: 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: LottieBuilder.asset(
                      "assets/42618-welcome.json",
                      width: 250,
                      height: 250,
                      repeat: false,
                      onLoaded: (composition) {
                        controller
                          ..duration = composition.duration
                          ..forward();
                      },
                    ),
                  ),
                  Center(
                    child: width > 1000
                        ? const Text(
                            "Register Your account to continue",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          )
                        : const Text(
                            "Register\nYour account to continue",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(child: _buildTextfields(context)),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: CheckboxListTile(
                      value: isSelected,
                      onChanged: (value) {
                        setState(() {
                          isSelected = value;
                        });
                      },
                      title: const Text("I agree to the terms and conditions"),
                      activeColor: Colors.green,
                    ),
                  ),
                  isLoading
                      ? const CustomProgressIndicator(status: "Loading")
                      : GestureDetector(
                          onTap: isSelected! ? submit : null,
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: !isSelected!
                                  ? Theme.of(context).disabledColor
                                  : Colors.green,
                            ),
                            child: const Center(
                                child: Text(
                              "Continue",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                          ),
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Already have an account? Login",
                        style: TextStyle(
                          color: Color(0xff00b894),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Form _buildTextfields(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Form(
      key: _formKey,
      child: SizedBox(
        width: width,
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              validator: (value) => value!.length < 4 || value.isEmpty
                  ? "Please enter a valid name"
                  : null,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  CupertinoIcons.person,
                  color: Color(0xffb7c6d9),
                ),
                hintText: "Full name",
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
              validator: (value) => !value!.contains("@") || value.isEmpty
                  ? "Please enter a valid email"
                  : null,
              controller: emailController,
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
              validator: (value) => value!.length < 5 || value.isEmpty
                  ? "Password must be at least 5 characters long"
                  : null,
              controller: passwordController,
              obscureText: showVisibility,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                      showVisibility ? Icons.visibility : Icons.visibility_off,
                      color: const Color(0xffb7c6d9)),
                  onPressed: () {
                    setState(() {
                      showVisibility = !showVisibility;
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
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
