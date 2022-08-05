

import 'package:facebookclone/widgets/profile_avater.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>print('user profile'),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvater(imageUrl: user.imageUrl),
          const SizedBox(width: 4.0,),
          Text(user.name,style: TextStyle(fontSize: 16.0),)
        ],
      ),
    );
  }
}
