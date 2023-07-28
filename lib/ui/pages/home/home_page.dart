import 'package:flutter/material.dart';
import 'package:marvel_api/ui/widgets/appbar_custom.dart';
import 'package:marvel_api/ui/widgets/background_custom.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override

  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        const BackgroundCustom(),
        Scaffold(
          backgroundColor: Colors.transparent,
            appBar: const CustomAppBar(title: "MARVEL WORLD",),
            body: Container()),
      ],
    );
  }
}
