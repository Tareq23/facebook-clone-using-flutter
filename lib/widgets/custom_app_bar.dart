import 'package:facebookclone/widgets/circle_button.dart';
import 'package:facebookclone/widgets/custom_tab_bar.dart';
import 'package:facebookclone/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../config/palette.dart';
import '../models/models.dart';

class CustomAppBar extends StatelessWidget {
  final List<IconData> icons;
  final Function(int) onTab;
  final int selectedIndex;
  final User currentUser;
  const CustomAppBar(
      {Key? key,
      required this.icons,
      required this.onTab,
      required this.selectedIndex,
      required this.currentUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 65.0,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        const BoxShadow(
            color: Colors.black26, offset: Offset(0, 2), blurRadius: 4.0),
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: const Text(
              'facebook',
              style: TextStyle(
                  color: Palette.facebookBlue,
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.5),
            ),
          ),
          Container(
            height: double.infinity,
            width: 600,
            child: CustomTabBar(
              icons: icons,
              selectedIndex: selectedIndex,
              onTab: onTab,
              isBottomIndicator: true,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                UserCard(user: currentUser),
                const SizedBox(
                  width: 12.0,
                ),
                CircleButton(
                  icon: Icons.search,
                  iconSize: 30.0,
                  onPressed: () => print("search"),
                ),
                CircleButton(
                  icon: MdiIcons.facebookMessenger,
                  iconSize: 30.0,
                  onPressed: () => print("Messenger"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
