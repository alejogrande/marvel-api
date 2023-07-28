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
            backgroundColor: Colors.black,
            fixedColor: Colors.red,
            unselectedItemColor: Colors.white,
            currentIndex: state.index,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(Assets.homeIcon,
                    width: 20,
                    height: 20,
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
                activeIcon: SvgPicture.asset(Assets.homeIcon,
                    width: 20,
                    height: 20,
                    colorFilter:
                        const ColorFilter.mode(Colors.red, BlendMode.srcIn)),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(Assets.charactersIcon,
                    width: 20,
                    height: 20,
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
                activeIcon: SvgPicture.asset(Assets.charactersIcon,
                    width: 20,
                    height: 20,
                    colorFilter:
                        const ColorFilter.mode(Colors.red, BlendMode.srcIn)),
                label: 'Characters',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(Assets.comicIcon,
                    width: 20,
                    height: 20,
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn)),
                activeIcon: SvgPicture.asset(Assets.comicIcon,
                    width: 20,
                    height: 20,
                    colorFilter:
                        const ColorFilter.mode(Colors.red, BlendMode.srcIn)),
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
