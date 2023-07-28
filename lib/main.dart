import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:internship_assignment/constants/global_variables.dart';
import 'package:internship_assignment/logic/cubits/getFilters_cubit/get_filters_cubit.dart';
import 'package:internship_assignment/logic/cubits/product_cubit/product_cubit.dart';
import 'package:internship_assignment/logic/cubits/searchModel_cubit/search_model_cubit.dart';
import 'package:internship_assignment/presentation/screens/NotificationScreen/notification_screen.dart';
import 'package:internship_assignment/presentation/screens/SearchScreen/search_screen.dart';

import 'presentation/screens/HomeScreen/home_screen.dart';

@pragma('vm;entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  if (kDebugMode) print(message.notification!.title.toString());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  HttpOverrides.global = MyHttpOverrides();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  final observer = CacheClearObserver();
  WidgetsBinding.instance.addObserver(observer);
  runApp(const MyApp());
  FlutterNativeSplash.remove();
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

class CacheClearObserver extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.paused) {
      // The app is being paused (backgrounded) or terminated
      // Clear the cache when the app is terminated or put in the background
      // await CachedNetworkImage.evictFromCache('https://i01.appmifile.com/v1/MI_18455B3E4DA706226CF7535A58E875F0267/pms_1666344481.20013313!500x500.png');
      // imageCache.clear();
      // imageCache.clearLiveImages();

      await DefaultCacheManager().emptyCache();
      imageCache.clear();
      imageCache.clearLiveImages();

      print('Background State');
    }
  }
}
