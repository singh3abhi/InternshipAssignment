import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internship_assignment/constants/global_variables.dart';
import 'package:internship_assignment/logic/cubits/getFilters_cubit/get_filters_cubit.dart';
import 'package:internship_assignment/logic/cubits/product_cubit/product_cubit.dart';
import 'package:internship_assignment/logic/cubits/searchModel_cubit/search_model_cubit.dart';
import 'package:internship_assignment/presentation/screens/NotificationScreen/notification_screen.dart';
import 'package:internship_assignment/presentation/screens/SearchScreen/search_screen.dart';

import 'presentation/screens/HomeScreen/home_screen.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductCubit()),
        BlocProvider(create: (context) => SearchModelCubit()),
        BlocProvider(create: (context) => GetFiltersCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        scrollBehavior: CustomScrollBehavior(),
        home: const HomeScreen(),
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          SearchScreen.routeName: (context) => const SearchScreen(),
          NotificationScreen.routeName: (context) => const NotificationScreen(),
        },
      ),
    );
  }
}

class CustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    // When modifying this function, consider modifying the implementation in
    // the base class ScrollBehavior as well.
    late final AndroidOverscrollIndicator indicator;
    indicator = AndroidOverscrollIndicator.glow;
    // if (Theme.of(context).useMaterial3) {
    //   indicator = AndroidOverscrollIndicator.stretch;
    // } else {
    //   indicator = AndroidOverscrollIndicator.glow;
    // }
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        return child;
      case TargetPlatform.android:
        switch (indicator) {
          case AndroidOverscrollIndicator.stretch:
            return StretchingOverscrollIndicator(
              axisDirection: details.direction,
              clipBehavior: details.clipBehavior ?? Clip.hardEdge,
              child: child,
            );
          case AndroidOverscrollIndicator.glow:
            break;
        }
      case TargetPlatform.fuchsia:
        break;
    }
    return GlowingOverscrollIndicator(
      axisDirection: details.direction,
      color: GlobalVariables.primaryColor,
      child: child,
    );
  }
}
