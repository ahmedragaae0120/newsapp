import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/layout/home/provider/home_provider.dart';
import 'package:newsapp/layout/home/widgets/artical_widget.dart';
import 'package:newsapp/models/news_response/atricle.dart';
import 'package:newsapp/shared/api/api_manager.dart';
import 'package:provider/provider.dart';

class animSearchBarWidget extends StatefulWidget {
  const animSearchBarWidget({super.key});

  @override
  State<animSearchBarWidget> createState() => _animSearchBarWidgetState();
}

class _animSearchBarWidgetState extends State<animSearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    homeProvider providerhome = Provider.of<homeProvider>(context);
    double width = MediaQuery.of(context).size.width;
    TextEditingController searchController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: AnimSearchBar(
        width: width * 0.82,
        textController: searchController,
        onSuffixTap: () {},
        onSubmitted: (value) {
          FutureBuilder(
            future: apiManager.searchNews(searchController.text ?? ""),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator.adaptive());
              } else if (snapshot.hasError ||
                  snapshot.data?.status == "error") {
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
                    return articalWidget(article: newsList[index]);
                  },
                  itemCount: newsList.length,
                ),
              );
            },
          );
        },
        closeSearchOnSuffixTap: true,
        autoFocus: true,
        boxShadow: true,
      ),
    );
  }
}
