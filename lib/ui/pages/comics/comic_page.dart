import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_api/domain/entities/comics_entity.dart';
import 'package:marvel_api/ui/pages/comics/bloc/comics_bloc.dart';
import 'package:marvel_api/ui/pages/comics/widgets/gridview_comics.dart';
import 'package:marvel_api/ui/widgets/appbar_custom.dart';
import 'package:marvel_api/ui/widgets/background_custom.dart';

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
    context.read<ComicsBloc>().add(LoadComics());

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (items.length < limit) {
          context.read<ComicsBloc>().add(
              LoadComics(offset: items.length, name: _searchController.text));
        }
      }
    });
  }

  List<ResultComics?> items = [];
  int limit = 0;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController =
      TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundCustom(),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: const CustomAppBar(
              title: "COMICS",
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        limit = 0;
                        items = [];
                      });
                      context
                          .read<ComicsBloc>()
                          .add(LoadSearchComics(name: value));
                    },
                    focusNode: FocusNode(),
                    controller: _searchController,
                    // textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      filled: true,
                      fillColor: Colors.grey[400],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: _searchController.text.isNotEmpty
                          ? IconButton(
                              icon: const Icon(
                                Icons.clear,
                                color: Colors.black87,
                              ),
                              onPressed: () {
                                setState(() {
                                  _searchController.text = '';
                                  limit = 0;
                                  items = [];
                                });

                                context
                                    .read<ComicsBloc>()
                                    .add(LoadSearchComics());
                              },
                            )
                          : null,
                    ),
                  ),
                ),
                BlocConsumer<ComicsBloc, ComicsState>(
                  listener: (context, state) {
                    if (state is ComicsHasData) {
                      items.addAll(
                          state.data?.data?.results as Iterable<ResultComics?>);
                      limit = state.data!.data!.total!;
                    }
                  },
                  builder: (context, state) {
                    return GridviewComics(
                        items: items, controller: _scrollController);
                  },
                )
              ],
            )),
      ],
    );
  }
}
