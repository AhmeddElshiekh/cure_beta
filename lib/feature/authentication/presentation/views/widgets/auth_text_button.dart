import 'package:flutter/material.dart';

class AuthTextButton extends StatelessWidget {
  const AuthTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.color,
  });

  final String text;
  final void Function()? onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          fixedSize: Size(MediaQuery.of(context).size.width * .85, 60)),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(fontSize: 22, color: Colors.white),
      ),
    );
  }
}
