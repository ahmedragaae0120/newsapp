import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:newsapp/layout/home/widgets/categorie_details.dart';
import 'package:newsapp/layout/home/widgets/categories_builder_widget.dart';
import 'package:newsapp/layout/home/widgets/settings_widget.dart';

class homeProvider extends ChangeNotifier {
  Widget selectedWidget = categoriesBuilderWidget();
  String titleAppbar = "News App";

  changeSelectedMenuItem({required menuItem NewSelectedMenuItem}) {
    switch (NewSelectedMenuItem) {
      case menuItem.categories:
        selectedWidget = const categoriesBuilderWidget();
        titleAppbar = "News App";
        break;
      case menuItem.settings:
        selectedWidget = const settingsWidget();
        titleAppbar = "Settings";
        break;
    }
    notifyListeners();
  }

  oncategorieClick(
      {required int index,
      required String title,
      required categorieItem NewSelectedMenuItem}) {
    if (titleAppbar == title) return;
    titleAppbar = title;
    switch (NewSelectedMenuItem) {
      case categorieItem.Sports:
        selectedWidget = categorieDetails(index: index);
        break;
      case categorieItem.Sports:
        selectedWidget = categorieDetails(index: index);
        break;
      case categorieItem.Bussines:
        selectedWidget = categorieDetails(index: index);
        break;
      case categorieItem.Environment:
        selectedWidget = categorieDetails(index: index, );
        break;
      case categorieItem.Health:
        selectedWidget = categorieDetails(index: index);
        break;
      case categorieItem.Politics:
        selectedWidget = categorieDetails(index: index);
        break;
      case categorieItem.Science:
        selectedWidget = categorieDetails(index: index);
        break;
    }
    notifyListeners();
  }
}

enum menuItem {
  categories,
  settings,
}

enum categorieItem {
  Sports,
  Bussines,
  Environment,
  Health,
  Politics,
  Science,
}
