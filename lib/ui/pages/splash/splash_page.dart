import 'package:flutter/material.dart';
import 'package:marvel_api/ui/widgets/appbar_custom.dart';
import 'package:marvel_api/ui/widgets/background_custom.dart';
import 'package:marvel_api/utils/constans.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override

  // ignore: library_private_types_in_public_api
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, Routes.root);
    });
    return Stack(
      children: [
        const BackgroundCustom(),
        Scaffold(
          backgroundColor: Colors.transparent,
         
          body: Container(),
        ),
      ],
    );
  }
}
