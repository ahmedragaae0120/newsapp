import 'package:flutter/material.dart';
import 'package:newsapp/layout/home/widgets/artical_widget.dart';
import 'package:newsapp/layout/home/widgets/source_widget.dart';
import 'package:newsapp/models/news_Model.dart';
import 'package:newsapp/models/source_model.dart';

class categorieDetails extends StatefulWidget {
  int index;
  categorieDetails({super.key, required this.index});

  @override
  State<categorieDetails> createState() => _categorieDetailsState();
}

class _categorieDetailsState extends State<categorieDetails> {
  int selectedSource = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: sourceModel.sources.length,
      child: Column(
        children: [
          TabBar(
            onTap: (index) {
              selectedSource = index;
              setState(() {});
            },
            dividerColor: Colors.transparent,
            indicatorColor: Colors.transparent,
            isScrollable: true,
            tabs: sourceModel.sources
                .map((source) => sourceWidget(
                      source: source,
                      isSelected:
                          selectedSource == sourceModel.sources.indexOf(source),
                    ))
                .toList(),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) =>
                  articalWidget(newsmodel: newsModel.news[index]),
              itemCount: newsModel.news.length,
            ),
          )
        ],
      ),
    );
  }
}
