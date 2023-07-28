import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marvel_api/domain/entities/characters_entity.dart';
import 'package:marvel_api/utils/constans.dart';
import 'package:marvel_api/utils/validators/validate_http.dart';

class GridviewCharacters extends StatelessWidget {
  final List<ResultCharacters?>? items;
  final ScrollController controller;
  const GridviewCharacters({
    this.items,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(right: 4.0),
        child: Scrollbar(
          thumbVisibility: true,
          controller: controller,
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2, // Number of columns in the grid
            // crossAxisSpacing: 10, // Spacing between the columns
            // mainAxisSpacing: 10, // Spacing between the rows
            childAspectRatio: 2 / 2.8,
            controller: controller,
            children: items!
                .map((e) => Padding(
                      padding: const EdgeInsets.all(20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.characterDetail,
                              arguments: e);
                        },
                        child: Card(
                          color: const Color.fromARGB(255, 19, 19, 19),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Column(
                                children: [
                                  Hero(
                                    tag: "${e!.id}",
                                    child: Container(
                                      margin: const EdgeInsets.all(8),
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 4.0,
                                        ),
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        image: DecorationImage(
                                          image: CachedNetworkImageProvider(
                                            Validators().validateAndConvertToHttps(
                                                "${e.thumbnail!.path!}.${e.thumbnail!.extension!}"),
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(8),
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          e.name!,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            Validators()
                                                .validateDescriptionEmpty(
                                                    e.description!),
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 4,
                                            style: const TextStyle(
                                              fontSize: 10,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
