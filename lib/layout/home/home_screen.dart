import 'package:flutter/material.dart';
import 'package:newsapp/layout/home/provider/home_provider.dart';
import 'package:newsapp/layout/home/widgets/categories_builder_widget.dart';
import 'package:newsapp/layout/home/widgets/home_drawer_widget.dart';
import 'package:provider/provider.dart';

class homeScreen extends StatelessWidget {
  static const String route_name = "homeScreen";
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    homeProvider providerhome = Provider.of<homeProvider>(context);
    return Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage("assets/images/pattern.jpg"))),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            providerhome.selectedWidget == categoriesBuilderWidget()
                ? "News App"
                : providerhome.titleAppbar,
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
        drawer: homeDrawerWidget(),
        body: providerhome.selectedWidget,
      ),
    );
  }
}
