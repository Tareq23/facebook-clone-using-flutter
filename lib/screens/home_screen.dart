import 'dart:html';

import 'package:facebookclone/config/palette.dart';
import 'package:facebookclone/data/data.dart';
import 'package:facebookclone/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../models/models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TrackingScrollController trackingScrollController = TrackingScrollController();


  @override
  void dispose() {
    trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Focus.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile: _HomeScreenMobile(scrollController : trackingScrollController),
          desktop: _HomeScreenDesktop(scrollController : trackingScrollController),
        ),
      ),
    );
  }
}


class _HomeScreenMobile extends StatelessWidget {
  final TrackingScrollController scrollController;
  const _HomeScreenMobile({Key? key, required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: Colors.white,
          title: Text(
            "facebook",
            style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.5),
          ),
          centerTitle: false,
          floating: true,
          actions: [
            CircleButton(
              icon: Icons.search,
              iconSize: 30.0,
              onPressed: () => print("search"),
            ),
            CircleButton(
              icon: MdiIcons.facebookMessenger,
              iconSize: 30.0,
              onPressed: () => print("Messengar"),
            )
          ],
        ),
        SliverToBoxAdapter(
            child: CreatePostContainer(
              currentUser: currentUser,
            )),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Rooms(
              onlineUsers: onlineUsers,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: Stories(currentUser: currentUser, stories: stories),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: posts.length,
                (BuildContext context, int index) {
              Post post = posts[index];
              // print("image url : -->   ${post.imageUrl}");
              return PostContainer(post: post);
            },
          ),
        )
      ],
    );
  }
}


class _HomeScreenDesktop extends StatelessWidget {
  final TrackingScrollController scrollController;
  const _HomeScreenDesktop({Key? key, required this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Container(
            color: Colors.orange,
          ),
        ),
        const Spacer(),
        Container(
          width: 600.0,
          color: Colors.white,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                sliver: SliverToBoxAdapter(
                  child: Stories(currentUser: currentUser, stories: stories),
                ),
              ),
              // SliverAppBar(
              //   systemOverlayStyle: SystemUiOverlayStyle.light,
              //   backgroundColor: Colors.white,
              //   title: Text(
              //     "facebook",
              //     style: TextStyle(
              //         color: Palette.facebookBlue,
              //         fontSize: 28.0,
              //         fontWeight: FontWeight.bold,
              //         letterSpacing: -1.5),
              //   ),
              //   centerTitle: false,
              //   floating: true,
              //   actions: [
              //     CircleButton(
              //       icon: Icons.search,
              //       iconSize: 30.0,
              //       onPressed: () => print("search"),
              //     ),
              //     CircleButton(
              //       icon: MdiIcons.facebookMessenger,
              //       iconSize: 30.0,
              //       onPressed: () => print("Messengar"),
              //     )
              //   ],
              // ),
              SliverToBoxAdapter(
                  child: CreatePostContainer(
                    currentUser: currentUser,
                  )),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                sliver: SliverToBoxAdapter(
                  child: Rooms(
                    onlineUsers: onlineUsers,
                  ),
                ),
              ),

              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: posts.length,
                      (BuildContext context, int index) {
                    Post post = posts[index];
                    // print("image url : -->   ${post.imageUrl}");
                    return PostContainer(post: post);
                  },
                ),
              )
            ],
          ),
        ),
        const Spacer(),
        Flexible(
          flex: 2,
          child: Container(
            color: Colors.blue,
          ),
        )
      ],
    );
  }
}

