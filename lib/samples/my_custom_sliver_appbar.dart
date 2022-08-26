import 'package:flutter/material.dart';

const _backgroundImage =
    'https://static.vecteezy.com/system/resources/previews/002/099/721/original/mountain-beautiful-landscape-background-design-illustration-free-vector.jpg';

class MyCustomSliverAppBar extends StatelessWidget {
  const MyCustomSliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar(
          //   expandedHeight: 200,
          //   pinned: true,
          //   stretch: true,
          //   flexibleSpace: FlexibleSpaceBar(
          //     stretchModes: const [
          //       StretchMode.blurBackground,
          //       StretchMode.zoomBackground,
          //       StretchMode.fadeTitle,
          //     ],
          //     background: Image.network(
          //       _backgroundImage,
          //       fit: BoxFit.cover,
          //     ),
          //     title: const Text('Title'),
          //   ),
          // ),

          SliverPersistentHeader(
            pinned: true,
            delegate: _MyPersistentHeader(),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  title: Text('Item: $index'),
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

const _maxExtent = 300.0;

class _MyPersistentHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = 1 - (shrinkOffset / _maxExtent);
    print('percent:$percent , shrinkOffset: $shrinkOffset');
    return SizedBox(
      height: maxExtent,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              _backgroundImage,
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Text(
              'My Custom Sliver',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30 * percent,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => _maxExtent;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant _MyPersistentHeader oldDelegate) => true;
}
