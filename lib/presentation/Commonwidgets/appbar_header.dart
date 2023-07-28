import 'package:flutter/material.dart';
import 'package:internship_assignment/presentation/screens/NotificationScreen/notification_screen.dart';
import 'package:page_transition/page_transition.dart';

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
              'assets/Logo/logo1.png',
              height: 32,
              color: Colors.white,
            ),
          ],
        ),
        Row(
          children: [
            const Text(
              'India',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
            const Icon(
              Icons.location_on,
              color: Colors.white,
              size: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, PageTransition(child: const NotificationScreen(), type: PageTransitionType.theme));
                // Navigator.pushNamed(context, NotificationScreen.routeName);
              },
              child: const Icon(
                Icons.notifications_none_sharp,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
