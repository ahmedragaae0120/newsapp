import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/news_response/atricle.dart';

class articalWidget extends StatelessWidget {
  final Article article;
  const articalWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
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
          Text(article.source?.name ?? ""),
          Text(article.title ?? ""),
          Align(
            alignment: Alignment.centerRight,
            child: Text(article.publishedAt ?? ""),
          ),
        ],
      ),
    );
  }
}
