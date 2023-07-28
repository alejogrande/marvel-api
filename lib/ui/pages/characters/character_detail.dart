import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marvel_api/domain/entities/characters_entity.dart';
import 'package:marvel_api/ui/widgets/appbar_custom.dart';
import 'package:marvel_api/ui/widgets/background_custom.dart';
import 'package:marvel_api/ui/widgets/text_border_custom.dart';
import 'package:marvel_api/utils/validators/validate_http.dart';


class CharacterDetailPage extends StatefulWidget {
  const CharacterDetailPage({Key? key}) : super(key: key);

  @override

  // ignore: library_private_types_in_public_api
  _CharacterDetailPageState createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     final ResultCharacters character = ModalRoute.of(context)!.settings.arguments as  ResultCharacters;

    return Stack(
      children: [
        const BackgroundCustom(),
        Scaffold(
          appBar: const CustomAppBar(title: "about characters"),
          backgroundColor: Colors.transparent,
          body: GestureDetector(
            onTap: ()=>Navigator.pop(context),
            child: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Hero(
                    tag: "${character.id}",
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
                                "${character.thumbnail!.path!}.${character.thumbnail!.extension!}"),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  TextBorderCustom(text: character.name!),
                  const SizedBox(height: 15,),
                  TextBorderCustom(text: character.description??"", fontSize: 15,),
                  
                ],
              ),
            )),
          ),
        ),
      ],
    );
  }
}
