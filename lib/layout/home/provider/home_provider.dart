import 'package:flutter/material.dart';
import 'package:newsapp/layout/home/widgets/categorie_details.dart';
import 'package:newsapp/layout/home/widgets/categories_builder_widget.dart';
import 'package:newsapp/layout/home/widgets/settings_widget.dart';
import 'package:newsapp/models/categories_Model.dart';

class homeProvider extends ChangeNotifier {
  Widget selectedWidget = categoriesBuilderWidget();
  categoriesModel? categoriesmodel;
  String titleAppbar = "News App";

  changeSelectedMenuItem(
      {required menuItem NewSelectedMenuItem, required BuildContext context}) {
    switch (NewSelectedMenuItem) {
      case menuItem.categories:
        selectedWidget = categoriesBuilderWidget();
        titleAppbar = "News App";
        Navigator.pop(context);
        break;
      case menuItem.settings:
        selectedWidget = const settingsWidget();
        titleAppbar = "Settings";
        Navigator.pop(context);
        break;
    }
    notifyListeners();
  }

  oncategorieClick(
      {required String title, required categoriesModel categoriesmodel}) {
    if (titleAppbar == title) return;
    titleAppbar = title;
    selectedWidget = categorieDetails(categoriesmodel: categoriesmodel);
    notifyListeners();
  }
}

enum menuItem {
  categories,
  settings,
}

// enum categorieItem {
//   Sports,
//   Bussines,
//   Environment,
//   Health,
//   Politics,
//   Science,
// }
