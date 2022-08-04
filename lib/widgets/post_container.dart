import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebookclone/config/palette.dart';
import 'package:facebookclone/widgets/profile_avater.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
            padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 4),
            child: _PostStats(post : post),
          )
        ],
      ),
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;

  const _PostStats({Key? key,required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Palette.facebookBlue,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.thumb_up,size: 10.0,color: Colors.white,),
            ),
            const SizedBox(width: 2,),
            Expanded(child: Text("${post.likes}",style: TextStyle(color: Colors.grey[700]),)),
            Text("${post.comments} comments",style: TextStyle(color: Colors.grey[700]),),
            const SizedBox(width: 12.0,),
            Text("${post.shares} shares",style: TextStyle(color: Colors.grey[700]),),
          ],
        ),
        const Divider(),
        Row(
          children: [
            _PostButton(
              icon: Icon(Icons.thumb_up_outlined,size: 20.0,color: Colors.grey[600],),
              label: 'Like',
              onTap: ()=> print('Like'),
            ),
            _PostButton(
              icon: Icon(Icons.comment,size: 20.0,color: Colors.grey[600],),
              label: 'comments',
              onTap: ()=> print('comments'),
            ),
            _PostButton(
              icon: Icon(MdiIcons.shareOutline,size: 25.0,color: Colors.grey[600],),
              label: 'shares',
              onTap: ()=> print('shares'),
            ),
          ],
        )
      ],
    );
  }

  //_postButton({required Icon icon, required String label, required void Function() onTap}) {}
}
class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final VoidCallback  onTap;
  const _PostButton({Key? key,required this.icon,required this.onTap, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            height: 25.0,
            child: Row(
              children: [
                icon,
                Text(label),
              ],
            )
          ),
        ),
      ),
    );
  }
}



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
