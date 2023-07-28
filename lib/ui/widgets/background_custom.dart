import 'package:flutter/material.dart';

class BackgroundCustom extends StatelessWidget {
  const BackgroundCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(

          
          image:
              AssetImage('lib/utils/resources/images/background.jpg'), // Ruta de la imagen
          fit: BoxFit.cover, // Ajuste de la imagen (cover, contain, etc.)
        ),
      ),
      child: Container(), // Aquí puedes colocar tus widgets
    );
  }
}
