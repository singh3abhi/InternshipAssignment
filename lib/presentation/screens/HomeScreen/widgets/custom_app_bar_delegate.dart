import 'package:flutter/material.dart';
import 'package:internship_assignment/constants/global_variables.dart';
import 'package:internship_assignment/presentation/Commonwidgets/appbar_header.dart';
import 'package:internship_assignment/presentation/screens/SearchScreen/search_screen.dart';

class CustomAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double height;
  final GlobalKey<ScaffoldState> scaffoldKey;

  CustomAppBarDelegate(this.scaffoldKey, [this.height = 87]);

  @override
  Widget build(context, double shrinkOffset, bool overlapsContent) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 87,
      backgroundColor: GlobalVariables.primaryColor,
      flexibleSpace: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        child: Column(
          children: [
            AppBarHeader(scaffoldKey: scaffoldKey),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, SearchScreen.routeName),
              child: Container(
                height: 35,
                decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(5))),
                child: const Center(
                  child: Row(
                    children: [
                      SizedBox(width: 8),
                      Icon(Icons.search),
                      SizedBox(width: 8),
                      Text(
                        'Search with make and model..',
                        style: TextStyle(fontSize: 14),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}
