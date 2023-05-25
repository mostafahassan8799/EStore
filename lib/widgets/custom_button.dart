import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String? text;
  VoidCallback? onTap;
  CustomButton({this.onTap, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue[700],
            borderRadius: BorderRadius.circular(8),
          ),
          width: double.infinity,
          height: 50,
          child: Center(
              child: Text(
            '$text',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
