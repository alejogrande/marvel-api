
import 'package:flutter/material.dart';


class BackgroundCustom extends StatelessWidget {
  const BackgroundCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.grey,
            Colors.white,
          ],
        ),
      ),
      child: Container(), // Aquí puedes colocar tus widgets
    );
  }
}
