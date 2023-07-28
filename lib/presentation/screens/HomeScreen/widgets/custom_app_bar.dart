import 'package:flutter/material.dart';
import 'package:internship_assignment/constants/global_variables.dart';
import 'package:internship_assignment/presentation/Commonwidgets/appbar_header.dart';
import 'package:internship_assignment/presentation/screens/SearchScreen/search_screen.dart';
import 'package:page_transition/page_transition.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 87,
      backgroundColor: GlobalVariables.primaryColor,
      flexibleSpace: Padding(
        padding: EdgeInsets.fromLTRB(12, MediaQuery.of(context).padding.top, 12, 5),
        child: Column(
          children: [
            AppBarHeader(scaffoldKey: scaffoldKey),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => Navigator.push(context, PageTransition(child: const SearchScreen(), type: PageTransitionType.theme)),
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
  Size get preferredSize => const Size.fromHeight(87);
}
