import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ofa_flutter_biometric/pages/biometric/biometric_view.dart';
import 'package:ofa_flutter_biometric/utils/constants/color_contant.dart';

class CustomNavigationDrawer extends StatelessWidget {
  const CustomNavigationDrawer({Key? key}) : super(key: key);
  final padding = const EdgeInsets.symmetric(horizontal: 18);
  @override
  Widget build(BuildContext context) {
    const name = "Anjali Dadhich";
    const email = "anjalidadhich@gmail.com";
    const urlImage = "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pinterest.com%2Fsnowprincess961%2Fwinters-dpz%2F&psig=AOvVaw25S85sqBL8y7wJBZ0txJ_N&ust=1641299585370000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCNjhl8jLlfUCFQAAAAAdAAAAABAD";
    return Drawer(
      child: Material (
        color: primaryColor,
        child: ListView(
          padding: padding,
          children: [
            buildHeader(
              urlImage: urlImage,
              name: name,
              email: email,
            ),
            const SizedBox(height: 40,),
            buildMenuItem(
                text: "Person",
                icon: Icons.people,
                onClickedDrawerItem: () => selectedItem(context, 0),
            ),
            const SizedBox(height: 12,),
            buildMenuItem(
                text: "Favorite",
                icon: Icons.favorite_border
            ),
            const SizedBox(height: 12,),
            buildMenuItem(
                text: "Workflow",
                icon: Icons.workspaces_outline
            ),
            const SizedBox(height: 12,),
            buildMenuItem(
                text: "Update",
                icon: Icons.update
            ),
            const SizedBox(height: 20,),
            const Divider(color: Colors.white70,),
            const SizedBox(height: 20,),
            buildMenuItem(
                text: "Notification",
                icon: Icons.notifications_outlined
            ),
            const SizedBox(height: 12,),
            buildMenuItem(
                text: "Update",
                icon: Icons.update
            ),
          ],
        ),
      ),
    );
  }

  //build list tile for drawer menu
  Widget buildMenuItem ({
    required String text,
    required IconData icon,
    VoidCallback? onClickedDrawerItem
  }) {
    const color = Colors.white;
    const hoverColor = Colors.white70; // hover color will be used for flutter web in case of hover the item
    return ListTile(
      leading: Icon(icon, color: color,),
      title: Text(text, style: const TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap : onClickedDrawerItem ?? () {},
    );
  }

  //navigation on click of drawer item
  void selectedItem(BuildContext context, int index) {
    Get.back();
      switch (index) {
        case 0:
          Get.to(BiometricPage());
          break;
      }
  }

  //build header for drawer
  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email
  }) {
    return SafeArea(
      child: InkWell(
          child: Container(
            padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(urlImage),
                ),
                const SizedBox(width: 18,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(height: 4,),
                    Text(
                      name,
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    )
                  ],
                )
              ],
            ),
          ),
      ),
    );
  }
}
