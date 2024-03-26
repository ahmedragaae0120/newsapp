import 'package:flutter/material.dart';
import 'package:newsapp/models/sourses_response/sources_response.dart';

class sourceWidget extends StatelessWidget {
  Source source;
  bool isSelected;
  sourceWidget({super.key, required this.source, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: height * 0.01),
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.07, vertical: height * 0.01),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.horizontal(
            left: Radius.circular(25), right: Radius.circular(25)),
        border: Border.all(color: Theme.of(context).colorScheme.primary),
        color: isSelected
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.onPrimary,
      ),
      child: Text(
        source.name ?? "",
        style: TextStyle(
          color: isSelected
              ? Theme.of(context).colorScheme.onPrimary
              : Theme.of(context).colorScheme.primary,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
