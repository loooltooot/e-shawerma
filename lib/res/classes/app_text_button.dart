import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final String title;
  final Function() onPressed;

  const AppTextButton({
    Key? key,
    required this.title,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 20),
      child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.orange)
          ),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w700
            ),
          )
      ),
    );
  }
}
