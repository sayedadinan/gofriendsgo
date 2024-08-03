import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/view/booking_screen/booking_screen.dart';
import 'package:gofriendsgo/view/chat_list.dart/chat_list.dart';
import 'package:gofriendsgo/view/home_screen/home_screen.dart';
import 'package:gofriendsgo/view/profile_screen/profile_editing_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  List<Widget> pages = [
    const HomeScreen(),
    const BookingDetailsScreen(
      fromBottomNav: true,
    ),
    const ChatListScreen(
      fromBottomNav: true,
    ),
    const ProfileEditingScreen()
  ];
  final PageController pageController = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    // func(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.whiteColor,
          currentIndex: currentIndex,
          selectedItemColor: const Color.fromRGBO(156, 10, 182, 1),
          unselectedItemColor: AppColors.blackColor,
          showUnselectedLabels: true,
          unselectedLabelStyle: const TextStyle(color: Colors.black),
          onTap: (value) {
            setState(() {
              currentIndex = value;
              pageController.jumpToPage(value);
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.menu_book_rounded,
                ),
                label: "Bookings"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.forum,
                ),
                label: "Chats"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle_outlined,
                ),
                label: "Profile"),
          ]),
    );
  }
}
