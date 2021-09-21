import 'package:flutter/material.dart';
import 'package:hci/models/splash_model.dart';
import 'package:hci/screens/login.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  List<SplashModel> data = [
    SplashModel(
        name: "Welcome to Holders App",
        content:
            "This is a professional group design specifically for educators and teachers where we shares ideas about educational issue.",
        imagePath: "assets/73170-teacher-all-language.json"),
    SplashModel(
        name: "Teachers Forum",
        content:
            "This forum is a place for discussion, exchange of ideas and a place to express your opinion about problem facing teachers.",
        imagePath: "assets/73243-happy-students-studying.json"),
    SplashModel(
        name: "Important Info",
        content:
            "Members must not post any content that is obscene, defamatory, profane, libelous, threatening, harrasing, abusive, hateful or embarassing to any person or entity.",
        imagePath: "assets/40187-animation-for-teacher.json"),
  ];

  int currentIndex = 0;

  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: width,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width > 1000.0 ? 30 : 18.0,
              vertical: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width,
                  child: PageView.builder(
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    controller: controller,
                    itemCount: data.length,
                    itemBuilder: (context, index) => ListView(
                      children: [
                        SizedBox(
                          height: 300,
                          child: Lottie.asset(
                            data[index].imagePath!,
                            repeat: false,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            data[index].name!,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: width > 1000.0 ? 30 : 22,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Text(
                              data[index].content!,
                              style: TextStyle(
                                color: Colors.black54,
                                // fontWeight: FontWeight.bold,
                                fontSize: width > 1000.0 ? 20 : 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "SKIP",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: List.generate(
                          data.length,
                          (index) => Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: index == currentIndex ? 30 : 10,
                            height: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          minimumSize: const Size(
                            200,
                            50,
                          ),
                        ),
                        onPressed: () {
                          if (currentIndex == data.length - 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                fullscreenDialog: true,
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          }
                          controller.nextPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.bounceInOut,
                          );
                        },
                        child: const Text(
                          "Continue",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
