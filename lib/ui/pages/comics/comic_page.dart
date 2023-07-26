import 'package:flutter/material.dart';

class ComicPage extends StatefulWidget {
  const ComicPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ComicPageState createState() => _ComicPageState();
}

class _ComicPageState extends State<ComicPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("comics"),
        ),
        body: Container());
  }
}
