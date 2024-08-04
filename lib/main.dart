import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gofriendsgo/services/shared_preferences.dart';
import 'package:gofriendsgo/utils/navigations/navigations.dart';
import 'package:gofriendsgo/view/bottom_navigation_bar/bottom_navigation.dart';
import 'package:gofriendsgo/view/login_screen/login_screen.dart';
import 'package:gofriendsgo/view/on_boarding_screen/on_boarding_screen.dart';
import 'package:gofriendsgo/view_model/banner_viewmodel.dart';
import 'package:gofriendsgo/view_model/cab_viewmodel.dart';
import 'package:gofriendsgo/view_model/carosual_viewmodel.dart';
import 'package:gofriendsgo/view_model/chat_list_viewmodel.dart';
import 'package:gofriendsgo/view_model/departure_viewmodel.dart';
import 'package:gofriendsgo/view_model/fetching_chats.dart';
import 'package:gofriendsgo/view_model/passport_viewmodel.dart';
import 'package:gofriendsgo/view_model/profile_viewmodel.dart';
import 'package:gofriendsgo/view_model/send_message_viewmodel.dart';
import 'package:gofriendsgo/view_model/service_viewmodel.dart';
import 'package:gofriendsgo/view_model/stories_viewmodel.dart';
import 'package:gofriendsgo/view_model/user_details.dart';
import 'package:gofriendsgo/view_model/visa_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = MyHttpOverrides();
  //test
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => FetchChatsViewModel()),
    ChangeNotifierProvider(create: (_) => ChatListViewmodel()),
    ChangeNotifierProvider(create: (_) => UserViewModel()),
    ChangeNotifierProvider(create: (_) => ServiceViewModel()),
    ChangeNotifierProvider(create: (_) => CarosualViewModel()),
    ChangeNotifierProvider(create: (_) => BannerViewModel()),
    ChangeNotifierProvider(create: (_) => StoriesViewModel()),
    ChangeNotifierProvider(create: (_) => VisaViewModel()),
    ChangeNotifierProvider(create: (_) => CabViewModel()),
    ChangeNotifierProvider(create: (_) => PassportViewModel()),
    ChangeNotifierProvider(create: (_) => ProfileViewModel()),
    ChangeNotifierProvider(create: (_) => FixedDeparturesViewModel()),
    ChangeNotifierProvider(create: (_) => SendMessageViewModel()),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final SharedPreferecesServices sharedPreferecesServices =
      SharedPreferecesServices();
  String? authToken;
  @override
  void initState() {
    checkToken(sharedPreferecesServices, (token) {
      setState(() {
        authToken = token;
      });
    });
    super.initState();
  }

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
      home: checkStartingScreen(authToken),
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

Widget checkStartingScreen(String? value) {
  if (value == null) {
    return const OnBoardingScreen();
  } else if (value.isEmpty) {
    return LoginScreen();
  } else {
    return const BottomNavigationScreen();
  }
}

checkToken(SharedPreferecesServices sharedPreferecesServices,
    TokenCallback callback) async {
  final value = await sharedPreferecesServices.getToken();
  callback(value);
}

typedef TokenCallback = void Function(String? token);
