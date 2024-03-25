import 'package:flutter/material.dart';
import 'package:newsapp/models/news_Model.dart';

class articalWidget extends StatelessWidget {
  newsModel newsmodel;
  articalWidget({super.key, required this.newsmodel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(newsmodel.imagePath),
          ),
          Text(newsmodel.sourceName),
          Text(newsmodel.title),
          Align(
            alignment: Alignment.centerRight,
            child: Text(newsmodel.date),
          ),
        ],
      ),
    );
  }
}
