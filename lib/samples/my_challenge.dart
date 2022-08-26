// UI Challenge: https://dribbble.com/shots/16855810--Music-Player-UI
// Avatar: https://i.ytimg.com/vi/XEb1WdhOQ6Q/maxresdefault.jpg

import 'dart:ui';

import 'package:flutter/material.dart';

class MyAppBarChallenge extends StatefulWidget {
  const MyAppBarChallenge({Key? key}) : super(key: key);

  @override
  State<MyAppBarChallenge> createState() => _MyAppBarChallengeState();
}

class _MyAppBarChallengeState extends State<MyAppBarChallenge>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF17151F),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: _MyCustomHeader(_controller),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  title: Text(
                    'Item: $index',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}

const _maxHeaderHeight = 250.0;
const _avatarImage = 'https://i.ytimg.com/vi/XEb1WdhOQ6Q/maxresdefault.jpg';

class _MyCustomHeader extends SliverPersistentHeaderDelegate {
  final Animation<double> animation;

  _MyCustomHeader(this.animation);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    const maxImageSize = _maxHeaderHeight * 0.7;
    const minImageSize = kToolbarHeight;
    final percent = 1 - (shrinkOffset / _maxHeaderHeight);
    final imageSize = lerpDouble(minImageSize, maxImageSize, percent)!;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: percent * 60.0),
      child: DecoratedBox(
        decoration: const BoxDecoration(
            color: Color(0xFFD0BCC9),
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(
                _maxHeaderHeight / 2,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.white54,
                blurRadius: 8,
                spreadRadius: 1,
                offset: Offset(0, 1),
              )
            ]),
        child: Center(
          child: _MyAnimatedAvatar(
            imageSize: imageSize / 2,
            listenable: animation,
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => _maxHeaderHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

class _MyAnimatedAvatar extends AnimatedWidget {
  const _MyAnimatedAvatar({
    required this.imageSize,
    required super.listenable,
  });

  final double imageSize;

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: listenable as Animation<double>,
      child: CircleAvatar(
        radius: imageSize,
        backgroundImage: const NetworkImage(_avatarImage),
      ),
    );
  }
}
