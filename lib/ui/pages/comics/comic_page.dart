import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_api/domain/entities/characters_entity.dart';
import 'package:marvel_api/ui/pages/characters/bloc/characters_bloc.dart';
import 'package:marvel_api/ui/pages/comics/widgets/gridview_characters.dart';

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
    context.read<CharactersBloc>().add(LoadCharacters());

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
       context.read<CharactersBloc>().add(LoadCharacters());
      }
    });
  }

  List<ResultCharacters?> items = [];
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: (){
          context.read<CharactersBloc>().add(LoadCharacters());
        }),
        appBar: AppBar(
          title: const Text("Buscador"),
        ),
        body: Stack(
          children: [
            //  / const BackgroundCustom(),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    onChanged: (value) {
                      // context.read<SearchBloc>().add(LoadSearch(value));
                    },
                    // textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'Buscar...',
                      filled: true,
                      fillColor: Colors.black,
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
                     if(state is CharactersHasData){
                      items.addAll(state.data?.data?.results as Iterable<ResultCharacters?>) ;
                     }
                  },
                  builder: (context, state) {
                     return 

                         GridviewCharacters(items: items,controller:_scrollController);
                       
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
            )
          ],
        ));
  }
}
