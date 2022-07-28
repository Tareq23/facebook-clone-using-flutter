import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebookclone/config/palette.dart';
import 'package:flutter/material.dart';

class ProfileAvater extends StatelessWidget {

  final String imageUrl;
  final bool isActive;

  const ProfileAvater({super.key, required this.imageUrl, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        CircleAvatar(
          radius: 20.0,
          backgroundColor: Colors.grey[200],
          backgroundImage: CachedNetworkImageProvider(imageUrl),
        ),
        if(isActive)Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: Palette.online,
              shape: BoxShape.circle,
              border: Border.all(
                width: 2.0,
                color: Colors.white
              ),
            ),
          ),
        )
      ]
    );
  }
}
