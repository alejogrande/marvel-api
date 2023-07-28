import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marvel_api/domain/entities/comics_entity.dart';
import 'package:marvel_api/utils/validators/validate_http.dart';

class GridviewComics extends StatelessWidget {
  final List<ResultComics?>? items;
  final ScrollController controller;
  const GridviewComics({
    this.items,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(right:4.0),
        child: Scrollbar(
          thumbVisibility: true,
          controller: controller,
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2, // Number of columns in the grid
            crossAxisSpacing: 10, // Spacing between the columns
            // mainAxisSpacing: 10, // Spacing between the rows
            childAspectRatio: 2 / 2.8,
            controller: controller,
            children: items!
                .map((e) => Padding(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () {
                          // context
                          //     .read<DetailBloc>()
                          //     .add(LoadDetails(e.id!.toString()));
                          // Navigator.pushNamed(context, Routes.detail);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Column(
                                children: [
                                  Expanded(
                                    child: e!.thumbnail?.path != null
                                        ? Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                Validators().validateAndConvertToHttps(
                                                    "${e.thumbnail!.path!}.${e.thumbnail!.extension!}"),
                                              ),
                                              fit: BoxFit.cover,
                                            )),
                                          )
                                        : Container(),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: 50,
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        Colors
                                            .black, // Color negro en la parte inferior
                                            Colors
                                            .black,
                                        Colors
                                            .transparent, // Color transparente en la parte superior
                                      ],
                                    ),
                                  ),
                                  // height: 20,
                                  child: Column(
                                     verticalDirection: VerticalDirection.up,
                                    children: [
                                      Text(
                                        e.title!,
                                        style: const TextStyle(color: Colors.white),
                                        maxLines: 2,
                                        // overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
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
