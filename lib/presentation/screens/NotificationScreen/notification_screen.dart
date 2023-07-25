import 'package:flutter/material.dart';
import 'package:internship_assignment/constants/global_variables.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
  static const String routeName = '/notification-screen';

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   const SystemUiOverlayStyle(
    //     statusBarColor: Colors.red,
    //     statusBarIconBrightness: Brightness.light,
    //   ),
    // );
    return SafeArea(
      child: Scaffold(
        backgroundColor: GlobalVariables.backgroundColor,
        appBar: AppBar(
          title: const Text(
            'Notification',
            style: TextStyle(color: Colors.white),
          ),
          automaticallyImplyLeading: false,
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.white,
              )),
          backgroundColor: GlobalVariables.primaryColor,
          centerTitle: true,
        ),
        body: const Center(
          child: Text('There is No Notification found in your account'),
        ),
      ),
    );
  }
}
