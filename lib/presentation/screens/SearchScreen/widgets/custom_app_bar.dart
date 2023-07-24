import 'package:flutter/material.dart';
import 'package:internship_assignment/constants/global_variables.dart';
import 'package:internship_assignment/presentation/Commonwidgets/appbar_header.dart';
import 'package:internship_assignment/presentation/screens/SearchScreen/widgets/custom_textfield.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        child: Column(
          children: [
            AppBarHeader(scaffoldKey: scaffoldKey),
            const SizedBox(height: 10),
            const CustomTextField(),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(88);
}
