import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gofriendsgo/utils/navigations/navigations.dart';
import 'package:gofriendsgo/view/on_boarding_screen/on_boarding_screen.dart';
import 'package:gofriendsgo/view_model/user_details.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UserViewModel()),
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
