import 'package:flutter/material.dart';
import 'package:newsapp/layout/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class homeDrawerWidget extends StatelessWidget {
  const homeDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    homeProvider providerhome = Provider.of<homeProvider>(context);
    return Drawer(
      elevation: 10,
      child: Column(
        children: [
          Container(
            color: Theme.of(context).colorScheme.primary,
            height: height * 0.2,
            width: double.infinity,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "News App!",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    providerhome.changeSelectedMenuItem(
                        NewSelectedMenuItem: menuItem.categories);
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.view_list_rounded,
                        size: 32,
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      const Text(
                        "Categories",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: height * 0.01),
                InkWell(
                  onTap: () {
                    providerhome.changeSelectedMenuItem(
                        NewSelectedMenuItem: menuItem.settings);
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.settings,
                        size: 32,
                      ),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      const Text(
                        "Settings",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
