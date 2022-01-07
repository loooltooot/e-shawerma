import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppOutlinedButton extends StatelessWidget {
  final String title;
  final Function() onPressed;

  const AppOutlinedButton({Key? key,
    required this.title,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.black45),
          side: MaterialStateProperty.all(const BorderSide(
            color: Colors.black,
            width: 1.5
          ))
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black
          ),
        )
    );
  }
}
