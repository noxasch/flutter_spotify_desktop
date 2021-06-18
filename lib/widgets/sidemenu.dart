import 'package:flutter/material.dart';

import '../data/data.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.0,
      height: double.infinity,
      color: Theme.of(context).primaryColor,
      child: Column(children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset('assets/images/spotify_logo.png',
                height: 55.0,
                filterQuality: FilterQuality.high, // prevent blurry image on desktop
              ),
            ),
          ],
        ),
        _SideMenuIconTab(
          title: 'Home', 
          icon: Icons.home,
          onTap: () {},
        ),
        _SideMenuIconTab(
          title: 'Search', 
          icon: Icons.search,
          onTap: () {},
        ),
        _SideMenuIconTab(
          title: 'Radio', 
          icon: Icons.audiotrack,
          onTap: () {},
        ),
        const SizedBox(height: 12.0,),
        _LibraryPlaylist(),
      ],),
    );
  }
}

class _LibraryPlaylist extends StatefulWidget {
  @override
  __LibraryPlaylistState createState() => __LibraryPlaylistState();
}

class __LibraryPlaylistState extends State<_LibraryPlaylist> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded( // because listview need a fixed width
      child: Scrollbar(
        controller: _scrollController,
        isAlwaysShown: true,
        child: ListView(
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          physics: const ClampingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    'YOUR LIBRARY', 
                    style: Theme.of(context).textTheme.headline4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ...yourLibrary.map((item) => ListTile(
                  dense: true,
                  title: Text(
                    item, 
                    style: Theme.of(context).textTheme.bodyText2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {},
                )).toList()
              ],
            ),
            const SizedBox(height: 24.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    'PLAYLIST', 
                    style: Theme.of(context).textTheme.headline4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ...playlists.map((item) => ListTile(
                  dense: true,
                  title: Text(
                    item, 
                    style: Theme.of(context).textTheme.bodyText2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () {},
                )).toList()
              ],
            ),
        ],),
      ),
    );
  }
}

class _SideMenuIconTab extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _SideMenuIconTab({
    Key? key, 
    required this.icon, 
    required this.title, 
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).iconTheme.color,
        size: 28.0,
      ),
      title: Text(title,
        style: Theme.of(context).textTheme.bodyText1,
        overflow: TextOverflow.ellipsis
      ),
      onTap: onTap,
    );
  }
}
