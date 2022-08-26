import 'package:flutter/material.dart';

const _backgroundImage =
    'https://static.vecteezy.com/system/resources/previews/002/099/721/original/mountain-beautiful-landscape-background-design-illustration-free-vector.jpg';

class MySliverAppBar extends StatelessWidget {
  const MySliverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                StretchMode.blurBackground,
                StretchMode.zoomBackground,
                StretchMode.fadeTitle,
              ],
              background: Image.network(
                _backgroundImage,
                fit: BoxFit.cover,
              ),
              title: const Text('Title'),
            ),
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
