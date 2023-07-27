
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_api/data/enums/nav_bar_items.dart';


part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState(NavbarItem.home, 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.home:
        emit(const NavigationState(NavbarItem.home, 0));
        break;
      case NavbarItem.character:
        emit(const NavigationState(NavbarItem.character, 1));
        break;
      case NavbarItem.comic:
        emit(const NavigationState(NavbarItem.comic, 2));
        break;
    }
  }
}
