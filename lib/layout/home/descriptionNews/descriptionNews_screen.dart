import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/layout/home/provider/home_provider.dart';
import 'package:newsapp/layout/home/widgets/animSearchBar_widget.dart';
import 'package:newsapp/layout/home/widgets/categories_builder_widget.dart';
import 'package:newsapp/layout/home/widgets/home_drawer_widget.dart';
import 'package:newsapp/models/news_response/atricle.dart';
import 'package:provider/provider.dart';

class descriptionScreen extends StatelessWidget {
  final Article article;
  descriptionScreen({super.key, required this.article});
  @override
  Widget build(BuildContext context) {
    homeProvider providerhome = Provider.of<homeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: height * 0.05),
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: CachedNetworkImage(
            imageUrl: article.urlToImage ?? "",
            fit: BoxFit.fill,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress)),
            errorWidget: (context, url, error) => Center(
                child: Image.asset(
              "assets/images/errorImage.PNG",
              fit: BoxFit.cover,
            )),
          ),
        ),
        SizedBox(height: height * 0.02),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(article.source?.name ?? ""),
              Text(article.title ?? ""),
              Align(
                alignment: Alignment.centerRight,
                child: Text(article.publishedAt ?? ""),
              ),
              SizedBox(height: height * 0.04),
              Text(article.description ?? ""),
            ],
          ),
        )
      ],
    );
  }
}
