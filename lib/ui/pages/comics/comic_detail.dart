import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marvel_api/domain/entities/comics_entity.dart';
import 'package:marvel_api/ui/widgets/appbar_custom.dart';
import 'package:marvel_api/ui/widgets/background_custom.dart';
import 'package:marvel_api/ui/widgets/text_border_custom.dart';
import 'package:marvel_api/utils/validators/validate_http.dart';

class ComicDetailPage extends StatefulWidget {
  const ComicDetailPage({Key? key}) : super(key: key);

  @override

  // ignore: library_private_types_in_public_api
  _ComicDetailPageState createState() => _ComicDetailPageState();
}

class _ComicDetailPageState extends State<ComicDetailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ResultComics comic =
        ModalRoute.of(context)!.settings.arguments as ResultComics;
    return Stack(
      children: [
        const BackgroundCustom(),
        Scaffold(
          appBar: const CustomAppBar(title: "about comic"),
          backgroundColor: Colors.transparent,
          body: GestureDetector(
            onTap: ()=>Navigator.pop(context),
            child: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Hero(
                    tag: "${comic.id}",
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      width: double.infinity,
                      height: 500,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 1.0,
                        ),
                        color: Colors.white,
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            Validators().validateAndConvertToHttps(
                                "${comic.thumbnail!.path!}.${comic.thumbnail!.extension!}"),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  TextBorderCustom(text: comic.title!),
                  const SizedBox(height: 15,),
                  TextBorderCustom(text: comic.description??"", fontSize: 15,),
                  
                ],
              ),
            )),
          ),
        ),
      ],
    );
  }
}
