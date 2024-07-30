import 'package:flutter/material.dart';
import 'package:gofriendsgo/utils/color_theme/colors.dart';
import 'package:gofriendsgo/utils/constants/app_bar.dart';
import 'package:gofriendsgo/utils/constants/custom_text.dart';
import 'package:gofriendsgo/utils/constants/mediaquery.dart';
import 'package:gofriendsgo/utils/constants/paths.dart';
import 'package:gofriendsgo/utils/constants/sizedbox.dart';
import 'package:gofriendsgo/utils/navigations/navigations.dart';
import 'package:gofriendsgo/view/chat_screen/chat_screen.dart';
import 'package:gofriendsgo/view_model/chat_list_viewmodel.dart';
import 'package:gofriendsgo/widgets/booking_details_widgets/booking_details_searchbar.dart';
import 'package:provider/provider.dart';

class ChatListScreen extends StatefulWidget {
  final bool fromBottomNav;
  const ChatListScreen({super.key, required this.fromBottomNav});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  void initState() {
    context.read<ChatListViewmodel>().fetchChatList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, mediaqueryheight(0.08, context)),
          child: CommonGradientAppBar(
            heading: 'Chats',
            fromBottomNav: widget.fromBottomNav,
          )),
      body: SingleChildScrollView(
        child: Consumer<ChatListViewmodel>(builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            children: [
              const CustomSizedBoxHeight(0.03),
              const BookingDetailsSearch(),
              const CustomSizedBoxHeight(0.03),
              SizedBox(
                height: mediaqueryheight(0.85, context),
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: value.chatsModel!.data.length,
                  itemBuilder: (context, index) {
                    final chatListModels = value.chatsModel!.data[index];
                    return ListTile(
                      onTap: () {
                        PageNavigations().push(ChatScreen(
                          chatData: chatListModels,
                        ));
                      },
                      title: CustomText(
                        weight: FontWeight.w600,
                        text: chatListModels.name,
                        color: AppColors.blackColor,
                        fontFamily: CustomFonts.inter,
                        size: 0.04,
                      ),
                      subtitle: CustomText(
                        weight: FontWeight.w300,
                        text: chatListModels.tag,
                        color: AppColors.blackColor,
                        fontFamily: CustomFonts.inter,
                        size: 0.03,
                      ),
                      leading: Container(
                        width: mediaquerywidth(0.12, context),
                        height: mediaqueryheight(0.06, context),
                        decoration: const BoxDecoration(
                          color: AppColors.whiteColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Image.asset(AppImages.busIcon),
                        ),
                      ),
                      trailing: Column(
                        children: [
                          const CustomSizedBoxHeight(0.02),
                          CustomText(
                            weight: FontWeight.w300,
                            text: chatListModels.updatedAt.toString(),
                            color: AppColors.blackColor,
                            fontFamily: CustomFonts.inter,
                            size: 0.03,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
