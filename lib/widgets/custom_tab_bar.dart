import 'package:facebookclone/config/palette.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final Function(int) onTab;
  final int selectedIndex;

  const CustomTabBar(
      {super.key,
      required this.icons,
      required this.onTab,
      required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: const EdgeInsets.all(0),
      indicator: const BoxDecoration(
          border: Border(
              top: BorderSide(
        color: Palette.facebookBlue,
        width: 3.0,
      ))),
      tabs: icons
          .asMap()
          .map((index, e) => MapEntry(
                index,
                Tab(
                  icon: Icon(
                    e,
                    size: 30.0,
                    color: index == selectedIndex
                        ? Palette.facebookBlue
                        : Colors.black54,
                  ),
                ),
              ))
          .values
          .toList(),
      onTap: onTab,
    );
  }
}
