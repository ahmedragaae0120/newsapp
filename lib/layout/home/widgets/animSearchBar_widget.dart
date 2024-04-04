import 'dart:developer';

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/layout/home/provider/home_provider.dart';
import 'package:newsapp/layout/home/widgets/artical_builder.dart';
import 'package:newsapp/layout/home/widgets/artical_widget.dart';
import 'package:newsapp/layout/home/widgets/searchNews_builder.dart';
import 'package:newsapp/models/news_response/atricle.dart';
import 'package:newsapp/models/sourses_response/sources_response.dart';
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
    Source source;
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: AnimSearchBar(
        width: width * 0.82,
        textController: searchController,
        onSuffixTap: () {},
        closeSearchOnSuffixTap: true,
        autoFocus: true,
        boxShadow: true,
        onSubmitted: (value) {
          setState(() {
            providerhome.changetexeSearch(value);
            providerhome.titleAppbar = "${providerhome.titleAppbar} ($value)";
            log(providerhome.texeSearch);
          });
        },
      ),
    );
  }
}
