import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({Key? key, required this.status})
      : super(key: key);
  final String status;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      backgroundColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Lottie.asset(
                "assets/images/9965-loading-spinner.json",
                height: 100,
                width: 100,
              ),
              Text(status),
            ],
          ),
        ),
      ),
    );
  }
}
