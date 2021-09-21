import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hci/screens/home/home.dart';

class CompleteAndSubmit extends StatefulWidget {
  final String name;
  final String password;
  final String email;
  const CompleteAndSubmit({
    Key? key,
    required this.name,
    required this.password,
    required this.email,
  }) : super(key: key);

  static const String route = "/complete";

  @override
  _CompleteAndSubmitState createState() => _CompleteAndSubmitState();
}

class _CompleteAndSubmitState extends State<CompleteAndSubmit>
    with TickerProviderStateMixin {
  late final AnimationController controller;
  late bool? isSelected = false;
  late bool onTapped = false;

  final schoolController = TextEditingController();
  final experienceController = TextEditingController();

  @override
  void initState() {
    controller = AnimationController(vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    schoolController.dispose();
    experienceController.dispose();
    controller.dispose();
    super.dispose();
  }

  Future<void> onPressed() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => const HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
          child: SizedBox(
            width: width > 1000 ? 1100 : width,
            child: Padding(
              padding: width > 1000
                  ? const EdgeInsets.only(left: 300.0)
                  : const EdgeInsets.only(left: 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 90,
                  ),
                  const Text(
                    "Complete\nYour registration here",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildTextfields(),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: onPressed,
                    child: Center(
                      child: AnimatedContainer(
                        curve: Curves.bounceInOut,
                        duration: const Duration(seconds: 2),
                        height: onTapped ? 60 : 50,
                        width:
                            onTapped ? 60 : MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: onTapped
                              ? BorderRadius.circular(
                                  30,
                                )
                              : BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: onTapped
                                ? const Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : const Text(
                                    "Submit",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Form _buildTextfields() {
    return Form(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            height: 170,
            width: 180,
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
            child: const Align(
              alignment: Alignment.bottomRight,
              child: Center(
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 33,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Add a photo",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            validator: (value) =>
                value!.length < 20 ? "Experience is too short" : null,
            controller: schoolController,
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.school,
                color: Color(0xffb7c6d9),
              ),
              hintText: "Education",
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
            maxLines: 8,
            validator: (value) =>
                value!.length < 20 ? "Experience is too short" : null,
            controller: experienceController,
            decoration: const InputDecoration(
              hintText: "Experience",
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
        ],
      ),
    );
  }
}
