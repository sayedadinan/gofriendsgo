import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gofriendsgo/utils/navigations/navigations.dart';
import 'package:gofriendsgo/view/on_boarding_screen/on_boarding_screen.dart';
import 'package:gofriendsgo/view_model/banner_viewmodel.dart';
import 'package:gofriendsgo/view_model/carosual_viewmodel.dart';
import 'package:gofriendsgo/view_model/service_viewmodel.dart';
import 'package:gofriendsgo/view_model/stories_viewmodel.dart';
import 'package:gofriendsgo/view_model/user_details.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UserViewModel()),
    ChangeNotifierProvider(create: (_) => ServiceViewModel()..fetchServices()),
    ChangeNotifierProvider(
        create: (_) => CarosualViewModel()..fetchCarousals()),
    ChangeNotifierProvider(create: (_) => BannerViewModel()..fetchBanners()),
    ChangeNotifierProvider(create: (_) => StoriesViewModel()..fetchStories()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'GoFriendsGo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const OnBoardingScreen(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

String token =
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNjU4ZjY0ZGRlZjJlOWRkMmU4MDZlNTI4NjcyNmE3MDZkY2ZlZjhmOGU3ZDMzNDQ1NDQ1NjYwMDE3Y2I4OWQ1ZjkyOTQ2NmJkYjE0ZDUzNTkiLCJpYXQiOjE3MjE3MTE3MTcuMzUzNTAyLCJuYmYiOjE3MjE3MTE3MTcuMzUzNTA0LCJleHAiOjE3NTMyNDc3MTcuMzQ1MTI3LCJzdWIiOiIxMyIsInNjb3BlcyI6W119.T0zjjF9qvocaRrpjqyVU1tJgVheJ26i-R-OirDSQf2G2RMkfNqK8QSt1pPHFRzb08je3hNahs7REKwSrWyYD0zbvHt1hRe66jdGofZHzrpxrcSuhYmlBmACbx1No8KtzbSFKw2Qd2zHlpof_VlEc41FgVLYf8iUtSwNLmIqx1Kh2je-_FRhf4ATZkd5imYkBQvUN2cI7uW9CFiRYsaPUgVkJ8meWdc88cMs4eI3mqNR488cxU9v8KDYcWVF1zjGKtpstRu33Q7JTMItWv5brf53IiVWleaRsPipOPe7uYn1Sjlod-2eD7Hqmtsp0zJnRcg1KFXNy8oI_dkk_bjdawKgtA83kUEgLsb1HJtVJ4UAO4Agf1IccjVIxDor7k6xZUN-qHNodE3W9NFrC4VF2B62E0STeCwuWvZy22bSYtajg5wdly92J5yatqYhbxgyVGoy2NsVgRPWQNt6pOFYBQwzy0AdN2G52vmO3bHKE0gUj-9sJ0V0XKooPbOBoQq-flg6IIB7Ne4jiAe8aR_wZozv3mvd1sNVTQbKmAaUaIH1dEXV_inuEE9ISb7E4KcJ08gOEzFdCP6PsU39DlJEjrwwQ1BnJ4IXmCTFglh4yHWx9tr4jq-wtIcKb26OnYMEUtcLqj2Fq-XPFZRPYwDnYKY9MKeFQLqoNq7dFe__yfVU';
