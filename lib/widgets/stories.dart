import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebookclone/config/palette.dart';
import 'package:facebookclone/widgets/profile_avater.dart';
import 'package:facebookclone/widgets/responsive.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  const Stories({super.key, required this.currentUser, required this.stories});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color: Responsive.isDesktop(context) ? Colors.transparent : Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 10.0,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + stories.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: _StoryCard(
                isAddStory: true,
                currentUser: currentUser,
                story: stories[0],
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: _StoryCard(
              isAddStory: false,
              currentUser: currentUser,
              story: stories[index - 1],
            ),
          );
        },
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  bool isAddStory;
  final User currentUser;
  final Story story;

  _StoryCard(
      {super.key,
      this.isAddStory = false,
      required this.currentUser,
      required this.story});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            height: double.infinity,
            width: 110.0,
            fit: BoxFit.cover,
            imageUrl: isAddStory ? currentUser.imageUrl : story!.imageUrl,
          ),
        ),
        Container(
          width: 110.0,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: Palette.storyGradient,
            borderRadius: BorderRadius.circular(12),
            boxShadow: Responsive.isDesktop(context) ? const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0,2),
                blurRadius: 4.0,
              ),
            ] : null,
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: isAddStory
              ? Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => print("add story"),
                    icon: Icon(Icons.add),
                    iconSize: 30,
                    color: Palette.facebookBlue,
                  ),
                )
              : ProfileAvater(
                  imageUrl: story.user.imageUrl,
                  hasBorder: story.isViewed,
                ),
        ),
        Positioned(
          left: 8.0,
          right: 8.0,
          bottom: 8.0,
          child: Text(
            isAddStory ? "Add to Story" : story.user.name,
            style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
        )
      ],
    );
  }
}
