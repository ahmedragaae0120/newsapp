import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:newsapp/layout/home/provider/home_provider.dart';
import 'package:newsapp/layout/home/widgets/artical_widget.dart';
import 'package:newsapp/models/news_response/atricle.dart';
import 'package:newsapp/shared/api/api_manager.dart';
import 'package:provider/provider.dart';

class searchNewsBuilder extends StatefulWidget {
  String searchController;
  searchNewsBuilder({super.key, required this.searchController});

  @override
  State<searchNewsBuilder> createState() => _searchNewsBuilderState();
}

class _searchNewsBuilderState extends State<searchNewsBuilder> {
  @override
  Widget build(BuildContext context) {
    homeProvider providerhome = Provider.of<homeProvider>(context);
    return FutureBuilder(
      future: apiManager.searchNews(widget.searchController ?? ""),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator.adaptive());
        } else if (snapshot.hasError || snapshot.data?.status == "error") {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(snapshot.data?.message ?? snapshot.error.toString()),
              ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text("try again")),
            ],
          );
        }
        List<Article>? newsList = snapshot.data?.articles ?? [];
        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              providerhome.changeSelecetedWidget(
                  newSelecetedWidget: articalWidget(article: newsList[index]));
            },
            itemCount: newsList.length,
          ),
        );
      },
    );
    ;
  }
}
