import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          fixedSize: Size(MediaQuery.of(context).size.width * .5, 70)),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(fontSize: 32, color: Colors.white),
      ),
    );
  }
}
