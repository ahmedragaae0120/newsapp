import 'package:flutter/material.dart';
import 'package:newsapp/layout/home/descriptionNews/descriptionNews_screen.dart';
import 'package:newsapp/layout/home/provider/home_provider.dart';
import 'package:newsapp/layout/home/widgets/artical_widget.dart';
import 'package:newsapp/models/news_response/atricle.dart';
import 'package:newsapp/models/sourses_response/sources_response.dart';
import 'package:newsapp/shared/api/api_manager.dart';
import 'package:provider/provider.dart';

class articalBuilder extends StatefulWidget {
  final Source source;
  const articalBuilder({super.key, required this.source});

  @override
  State<articalBuilder> createState() => _articalBuilderState();
}

class _articalBuilderState extends State<articalBuilder> {
  @override
  Widget build(BuildContext context) {
    homeProvider providerhome = Provider.of<homeProvider>(context);
    return FutureBuilder(
      future: apiManager.getNews(widget.source.id ?? ""),
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
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                providerhome.changeSelecetedWidget(
                    newSelecetedWidget:
                        descriptionScreen(article: newsList[index]));
              },
              child: articalWidget(article: newsList[index]),
            ),
            itemCount: newsList.length,
          ),
        );
      },
    );
  }
}
