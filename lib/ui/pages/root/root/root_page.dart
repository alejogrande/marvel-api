import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvel_api/data/enums/nav_bar_items.dart';
import 'package:marvel_api/ui/pages/characters/characters_page.dart';
import 'package:marvel_api/ui/pages/comics/comic_page.dart';
import 'package:marvel_api/ui/pages/home/home_page.dart';
import 'package:marvel_api/ui/pages/root/root/navigation_bloc/navigation_cubit.dart';
import 'package:marvel_api/utils/constans.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});



  @override
  RootPageState createState() => RootPageState();
}


class RootPageState extends State<RootPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
            backgroundColor: Colors.blue,
            fixedColor: Colors.black,
            currentIndex: state.index,
            showUnselectedLabels: false,
            showSelectedLabels: true,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Assets.comicIcon,
                  width: 20,
                  height: 20,
                ),
                activeIcon: SvgPicture.asset(
                  Assets.comicIcon,
                  width: 20,
                  height: 20,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  Assets.comicIcon,
                  width: 20,
                  height: 20,
                ),
                activeIcon: SvgPicture.asset(
                  Assets.comicIcon,
                  width: 20,
                  height: 20,
                ),
                label: 'Characters',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  
                  Assets.comicIcon,
                  width: 20,
                  height: 20,
                ),
                activeIcon: SvgPicture.asset(
                  Assets.comicIcon,
                  width: 25,
                  height: 25,
                ),
                label: 'Comics',
              ),
            ],
            onTap: (index) {
              if (index == 0) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.home);
              } else if (index == 1) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.character);
              } else if (index == 2) {
                BlocProvider.of<NavigationCubit>(context)
                    .getNavBarItem(NavbarItem.comic);
              }
            },
          );
        },
      ),
      body: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
        if (state.navbarItem == NavbarItem.home) {
          return const HomePage();
        } else if (state.navbarItem == NavbarItem.character) {
          return const CharacterPage();
        } else if (state.navbarItem == NavbarItem.comic) {
          return const ComicPage();
        }
        return Container();
      }),
    );
  }
}
