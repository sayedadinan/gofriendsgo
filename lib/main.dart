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
import 'package:gofriendsgo/view_model/departure_viewmodel.dart';
import 'package:gofriendsgo/view_model/passport_viewmodel.dart';
import 'package:gofriendsgo/view_model/profile_viewmodel.dart';
import 'package:gofriendsgo/view_model/service_viewmodel.dart';
import 'package:gofriendsgo/view_model/stories_viewmodel.dart';
import 'package:gofriendsgo/view_model/user_details.dart';
import 'package:gofriendsgo/view_model/visa_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = MyHttpOverrides();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UserViewModel()),
    ChangeNotifierProvider(create: (_) => ServiceViewModel()),
    ChangeNotifierProvider(create: (_) => CarosualViewModel()),
    ChangeNotifierProvider(create: (_) => BannerViewModel()),
    ChangeNotifierProvider(create: (_) => StoriesViewModel()),
    ChangeNotifierProvider(create: (_) => VisaViewModel()),
    ChangeNotifierProvider(create: (_) => CabViewModel()),
    ChangeNotifierProvider(create: (_) => PassportViewModel()),
    ChangeNotifierProvider(create: (_) => ProfileViewModel()),
    ChangeNotifierProvider(
        create: (_) => FixedDeparturesViewModel()..fetchFixedDepartures()),
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
String tokenss =
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNmQxZDk2NmQyODgyNTFiZDVmMGIzNGYxYzQ1NDRjNWZlNjgzOWQyNmFhM2NiMDRiZWRmYzhlOGFmOTllOTdkZmRhNjcxNzc5MzJkMzExNjYiLCJpYXQiOjE3MjIwODk0MzAuMTQ0ODc5LCJuYmYiOjE3MjIwODk0MzAuMTQ0ODgxLCJleHAiOjE3NTM2MjU0MzAuMTQyNzE4LCJzdWIiOiIxMyIsInNjb3BlcyI6W119.OguaoHU2dvDw-tKuC0gyVvg0d9LFmpFxyecnPBAlJu90En7Figy3FOpsPt5ygP-HSrgj-_D5N_utQdh5yqblmKdzhxA1hM9uFly5PqC4Grbo01xuQ1t9YFIadDDKU4hi2LW3jwYttdaBZ7nV4YSuDnnQCmytgFnHEFQzxwLOeev7_6etp6K5XvXyBhrw8RxJG90Q5JjoOvQU0-Jdh-cM2UJViYA5qTra12Bx8H8LTctTn4IkIwpxcGptXmjep0csEBWAqC69Iv4gKsRn01eSaB9BqCRd8oyiGSiq0EUhhjOyD_5s5r03nYqR8zGmjO9kWelyMuTqoNk6Y0itHyY8c1vMJknRtsjz-WJvGQwmzidEt64W_uDFfJYPBCEgjs0FiMk3fs6NRm2cL9CeQd5ghYrK_nntudXRV5C3ZyKZLxxtTu4a4XVRivSFS5Q5x3vBE_G6x-VmYVZhsycKRfMfgc_9m5zfWp7RQd6L_p0qI4vWYT86cE4vgq128wn-h154BH_UtkhLWMchYNROkcfNx7oRX3OmXE1f9upTcnZlgyBpALyL-gdDcV4huSCH3CLkoYHVjrsKdLMl_aHvEJA_w-GodsdkvEz_5gvqAtu_svSrODhChtytytaiC5ji6Fwxu5tm7KbyEIypGstylmDXVoh8YgjCO9oRzIqX4HaH1v0';

String imagePath = "https://gofriendsgo.teqsuit.com/public/storage/";
