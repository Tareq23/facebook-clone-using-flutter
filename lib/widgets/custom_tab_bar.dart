import 'package:facebookclone/config/palette.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final Function(int) onTab;
  final int selectedIndex;
  bool isBottomIndicator;

  CustomTabBar(
      {super.key,
      required this.icons,
      required this.onTab,
      required this.selectedIndex,
      this.isBottomIndicator = false});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: const EdgeInsets.all(0),
      indicator: BoxDecoration(
        border: isBottomIndicator ? const Border(
          bottom: BorderSide(
            width: 4.0,
            color: Palette.facebookBlue
          )
        ) : const  Border(
          top: BorderSide(
            color: Palette.facebookBlue,
            width: 3.0,
          ),
        ),
      ),
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
