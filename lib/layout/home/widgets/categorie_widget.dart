import 'package:flutter/material.dart';
import 'package:newsapp/models/categories_Model.dart';

class categorieWidget extends StatelessWidget {
  categoriesModel categorymodel;
  int index;
  categorieWidget(
      {super.key, required this.categorymodel, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: categorymodel.color,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
          bottomLeft: Radius.circular(index.isEven ? 0 : 25),
          bottomRight: Radius.circular(index.isEven ? 25 : 0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Image.asset(
              "assets/images/${categorymodel.imagePath}",
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 10),
          Text(
            categorymodel.title,
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
