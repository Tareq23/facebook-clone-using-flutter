import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebookclone/widgets/profile_avater.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class PostContainer extends StatelessWidget {
  final Post post;
  const PostContainer({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _PostHeader(post: post),
                const SizedBox(
                  height: 6.0,
                ),
                Text(
                  post.caption,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff1f1f1f)),
                ),
                post.imageUrl == null
                    ? SizedBox.shrink()
                    : SizedBox(
                        height: 6.0,
                      ),
              ],
            ),
          ),
          post.imageUrl != null && post.imageUrl != "null"
              ? CachedNetworkImage(
                  imageUrl: post.imageUrl,
                )
              : const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: _PostStats(post : post),
          )
        ],
      ),
    );
  }
}

// class _PostStats extends StatelessWidget {
//   final Post post;
//
//   const _PostStats({Key? key,required this.post}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 12.0,
//       color: Colors.red,
//     );
//   }
// }


class _PostHeader extends StatelessWidget {
  final Post post;
  const _PostHeader({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvater(imageUrl: post.user.imageUrl),
        const SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: TextStyle(color: Colors.grey[600]),
              ),
              Row(
                children: [
                  Text(post.timeAgo),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  ),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () => print("more button"),
          icon: Icon(
            Icons.more_horiz,
            color: Colors.grey[600],
            size: 12,
          ),
        )
      ],
    );
  }
}
