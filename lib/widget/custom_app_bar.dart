import 'package:flutter/material.dart';
import 'package:ofa_flutter_biometric/utils/constants/color_contant.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  final double height;
  final String? title;
  final VoidCallback? onPressedLeadingAppBarIcon;
  final IconData? leadingAppBarIcon;
  final TabBar? tabBarBottom;

  const CustomAppBar({Key? key,
    this.height = kToolbarHeight,
    this.title,
    this.onPressedLeadingAppBarIcon,
    this.leadingAppBarIcon,
    this.tabBarBottom}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title == null ? const Text("") : Text(title!),
      backgroundColor: primaryColor,
      /*leading: Builder(
        builder: (context) {
          return IconButton (
              icon: Icon(leadingAppBarIcon ?? Icons.chevron_left),
              onPressed: onPressedLeadingAppBarIcon ?? () {}, //onPressedLeadingAppBarIcon == null ? () {} : onPressedLeadingAppBarIcon
          );
        }
      ),*/
      actions: [
        IconButton (
            icon: const Icon(Icons.share),
            onPressed: () { },
        ),
      ],
      bottom: tabBarBottom,
      /*bottom: isShowingTabBar ? TabBar(
        tabs: tabsList ?? [],
        controller: tabController,
        indicatorColor: Colors.white,
        indicatorWeight: 3,
      ) : null,*/
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
