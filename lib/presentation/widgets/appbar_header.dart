import 'package:flutter/material.dart';

class AppBarHeader extends StatelessWidget {
  const AppBarHeader({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                scaffoldKey.currentState?.openDrawer();
              },
              child: Image.asset(
                'assets/Icons/menu.png',
                height: 32,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 20),
            Image.asset(
              'assets/Logo/logo.png',
              height: 32,
              color: Colors.white,
            ),
          ],
        ),
        const Row(
          children: [
            Text(
              'India',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            Icon(
              Icons.location_on,
              color: Colors.white,
              size: 30,
            ),
            Icon(
              Icons.notifications_none_sharp,
              color: Colors.white,
              size: 30,
            ),
          ],
        ),
      ],
    );
  }
}
