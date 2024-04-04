import 'package:flutter/material.dart';
import 'package:newsapp/layout/home/provider/home_provider.dart';
import 'package:newsapp/layout/home/widgets/artical_builder.dart';
import 'package:newsapp/layout/home/widgets/artical_widget.dart';
import 'package:newsapp/layout/home/widgets/source_widget.dart';
import 'package:newsapp/models/categories_Model.dart';
import 'package:newsapp/shared/api/api_manager.dart';
import 'package:provider/provider.dart';

class categorieDetails extends StatefulWidget {
  categoriesModel categoriesmodel;
  categorieDetails({super.key, required this.categoriesmodel});

  @override
  State<categorieDetails> createState() => _categorieDetailsState();
}

class _categorieDetailsState extends State<categorieDetails> {
  int selectedSource = 0;

  @override
  Widget build(BuildContext context) {
    homeProvider providerhome = Provider.of<homeProvider>(context);
    return FutureBuilder(
      future: apiManager.getSources(widget.categoriesmodel.id ?? ""),
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
        var sources = snapshot.data?.sources ?? [];
        return DefaultTabController(
          length: sources.length,
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
                tabs: sources
                    .map((source) => sourceWidget(
                          source: source,
                          isSelected: selectedSource == sources.indexOf(source),
                        ))
                    .toList(),
              ),
              articalBuilder(source: sources[selectedSource],textController:providerhome.texeSearch),
            ],
          ),
        );
      },
    );
  }
}
