import 'dart:developer';

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/layout/home/provider/home_provider.dart';
import 'package:newsapp/models/sourses_response/sources_response.dart';
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
        searchIconColor: Colors.white,
        color: Colors.transparent,
        width: width * 0.82,
        textController: searchController,
        onSuffixTap: () {
            providerhome.changetexeSearch("");
            providerhome.titleAppbar = "";
        },
        closeSearchOnSuffixTap: true,
        autoFocus: true,
        onSubmitted: (value) {
          providerhome.changetexeSearch(searchController.text);
          providerhome.titleAppbar = value;
          log(providerhome.texeSearch);
        },
      ),
    );
  }
}
