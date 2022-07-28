import 'package:facebookclone/config/palette.dart';
import 'package:facebookclone/widgets/profile_avater.dart';
import 'package:flutter/material.dart';
import 'package:facebookclone/models/models.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({super.key, required this.onlineUsers});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 10.0),
        scrollDirection: Axis.horizontal,
        itemCount: onlineUsers.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _CreateRoomButton();
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ProfileAvater(
              imageUrl: onlineUsers[index-1].imageUrl,
              isActive: index % 3 == 0 ? true : false,
            ),
          );
        },
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => print("create room"),
      style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          side: BorderSide(
            width: 3.0,
            color: Colors.blueAccent[100]!,
          ),
          textStyle: TextStyle(color: Palette.facebookBlue)),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) =>
                Palette.createRoomGradient.createShader(rect),
            child: const Icon(
              Icons.video_call,
              size: 35.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 4.0,),
          const Text('Create\nRoom')
        ],
      ),
    );
  }
}
