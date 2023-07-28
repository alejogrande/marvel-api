import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:marvel_api/domain/entities/comics_entity.dart';
import 'package:marvel_api/utils/validators/validate_http.dart';

class CarouselSliderCustom extends StatelessWidget {
  final List<ResultComics?>? items;
  final bool? autoPlay;
  const CarouselSliderCustom({
    this.items,
    super.key,
    this.autoPlay,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: items
            ?.map((e) => Padding(
                  padding: const EdgeInsets.all(12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(1),
                    child: GestureDetector(
                      onTap: () {
                        // context
                        //     .read<HomeBloc>()
                        //     .add(LoadDetails(e.id!.toString()));
                        // Navigator.pushNamed(context, Routes.detail);
                      },
                      child: e!.thumbnail?.path != null
                          ? Container(
                            width: 500,
                            height: 100,
                              // width: double.infinity,
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
                  ),
                ))
            .toList(),
        options: CarouselOptions(
          height: 200,
          aspectRatio: 8/8,
          autoPlay: autoPlay??true,
          viewportFraction: 0.4,
          enableInfiniteScroll: false,
          enlargeCenterPage: false,
          initialPage: 1
          
        ));
  }
}
