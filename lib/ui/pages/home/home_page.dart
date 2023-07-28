import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_api/ui/pages/home/bloc/home_bloc.dart';
import 'package:marvel_api/ui/pages/home/widgets/carousel_custom.dart';
import 'package:marvel_api/ui/widgets/appbar_custom.dart';
import 'package:marvel_api/ui/widgets/background_custom.dart';
import 'package:marvel_api/ui/widgets/text_border_custom.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override

  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(LoadComicsHome());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundCustom(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: const CustomAppBar(
            title: "MARVEL WORLD",
          ),
          body: BlocConsumer<HomeBloc, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              return state is HomeHasData
                  ? SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.only(left: 15.0, top: 15),
                            child: TextBorderCustom(text: "Latest comic releases",),
                          ),
                          CarouselSliderCustom(items: state.latestComics!.data!.results,),
                          const Padding(
                            padding:  EdgeInsets.only(left: 15.0, top: 15),
                            child: TextBorderCustom(text: "Avengers comics",),
                          ),
                          CarouselSliderCustom(items: state.avengersComics!.data!.results,autoPlay: false,),
                  
                          const Padding(
                            padding:  EdgeInsets.only(left: 15.0, top: 15),
                            child: TextBorderCustom(text: "Spiderman comics",),
                          ),
                          CarouselSliderCustom(items: state.spiderComics!.data!.results,autoPlay: false,),
                        ],
                      ),
                  )
                  : const Center(child:  CircularProgressIndicator());
            },
          ),
        ),
      ],
    );
  }
}
