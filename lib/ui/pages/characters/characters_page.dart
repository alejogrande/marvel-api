import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_api/domain/entities/characters_entity.dart';
import 'package:marvel_api/ui/pages/characters/bloc/characters_bloc.dart';
import 'package:marvel_api/ui/pages/characters/widgets/gridview_characters.dart';
import 'package:marvel_api/ui/widgets/appbar_custom.dart';
import 'package:marvel_api/ui/widgets/background_custom.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CharacterPageState createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  @override
  void initState() {
    super.initState();
    context.read<CharactersBloc>().add(LoadCharacters());

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (items.length < limit) {
          context.read<CharactersBloc>().add(LoadCharacters(
              offset: items.length, name: _searchController.text));
        }
      }
    });
  }

  List<ResultCharacters?> items = [];
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
              title: "CHARACTERS",
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    onChanged: (value) {
                      limit = 0;
                      items = [];
                      context
                          .read<CharactersBloc>()
                          .add(LoadSearchCharacters(name: value));
                    },
                    controller: _searchController,
                    // textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'Buscar...',
                      filled: true,
                      fillColor: Colors.green,
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
                    ),
                  ),
                ),
                BlocConsumer<CharactersBloc, CharactersState>(
                  listener: (context, state) {
                    if (state is CharactersHasData) {
                      items.addAll(state.data?.data?.results
                          as Iterable<ResultCharacters?>);
                      limit = state.data!.data!.total!;
                    }
                  },
                  builder: (context, state) {
                    return GridviewCharacters(
                        items: items, controller: _scrollController);
                  },
                )
                // BlocBuilder<CharactersBloc, CharactersState>(
                //   builder: (context, state) {

                //     return state is CharactersHasData

                //         ? GridviewCharacters(items: state.data?.data?.results)
                //         : Container();
                //   },
                // ),
              ],
            )),
      ],
    );
  }
}
