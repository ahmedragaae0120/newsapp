import 'package:flutter/material.dart';
import 'package:newsapp/layout/home/provider/home_provider.dart';
import 'package:newsapp/layout/home/widgets/categorie_details.dart';
import 'package:newsapp/layout/home/widgets/categorie_widget.dart';
import 'package:newsapp/models/categories_Model.dart';
import 'package:provider/provider.dart';

class categoriesBuilderWidget extends StatelessWidget {
  const categoriesBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    homeProvider providerhome = Provider.of<homeProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: width * 0.04),
          child: Text(
            "Pick your category\nof interest",
            style: TextStyle(
              color: Color(0xff4F5A69),
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: width * 0.07,
                mainAxisSpacing: height * 0.02,
              ),
              itemCount: categoriesModel.categories.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  providerhome.oncategorieClick(
                      index: index,
                      title: categoriesModel.categories[index].title,
                      NewSelectedMenuItem: categorieItem.Bussines);
                },
                child: categorieWidget(
                  index: index,
                  categorymodel: categoriesModel.categories[index],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
