import 'package:cure/core/utils/constant.dart';
import 'package:flutter/material.dart';

class AuthSelectionButton extends StatelessWidget {
  const AuthSelectionButton(
      {super.key, required this.text, required this.asset});

  final String text;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Stack(
        alignment: const Alignment(-1.3, 0),
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(50),
                    bottomStart: Radius.circular(50),
                    topEnd: Radius.circular(20),
                    bottomEnd: Radius.circular(20))),
            child: Text(
              text,
              style: const TextStyle(fontSize: 24, color: mainColor),
            ),
          ),
          Image.asset(
            asset,
            height: 50,
            width: 50,
          ),
        ],
      ),
    );
  }
}
