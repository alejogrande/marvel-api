import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marvel_api/domain/entities/characters_entity.dart';
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
      child: GridView.count(
        crossAxisCount: 2, // Number of columns in the grid
        crossAxisSpacing: 10, // Spacing between the columns
        mainAxisSpacing: 10, // Spacing between the rows
        childAspectRatio: 2 / 3,
    controller: controller,
        children: items!
            .map((e) => Padding(
                  padding: const EdgeInsets.all(20),
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
                                        // height: 100,
                                        // height: double.maxFinite,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                          image:  CachedNetworkImageProvider(
                                            Validators().validateAndConvertToHttps("${e.thumbnail!.path!}.${e.thumbnail!.extension!}"),
                                            
                                          ),

                                          // NetworkImage(
                                          //     "${e.thumbnail!.path!}.${e.thumbnail!.extension!}"),
                                          fit: BoxFit.cover,
                                        )),
                                      )
                                    : Container(),
                              ),
                              SizedBox(
                                height: 50,
                                child: Column(
                                  children: [
                                    Text(
                                      e!.name!,
                                      overflow: TextOverflow.ellipsis,
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
    );
  }
}
