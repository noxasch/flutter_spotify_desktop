import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import '../models/playlist.dart';

class PlaylistScreen extends StatefulWidget {

  final Playlist playlist;

  const PlaylistScreen({
    Key? key, 
    required this.playlist
  }) : super(key: key);

  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
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
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leadingWidth: 140.0, // 0.0 means no leading widget, default is 56.0
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                customBorder: const CircleBorder(),
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: const BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.chevron_left, size: 20.0,),
                ),
              ),
              const SizedBox(width: 16.0,),
              InkWell(
                customBorder: const CircleBorder(),
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: const BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.chevron_right, size: 20.0,),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton.icon(
            onPressed: () {}, 
            style: TextButton.styleFrom(
              primary: Theme.of(context).iconTheme.color
            ),
            icon: Icon(
              Icons.account_circle_outlined, 
              size: 30.0,), 
            label: const Text('Alexander Dischberg'),
          ),
          const SizedBox(width: 8.0),
          IconButton(
            padding: const EdgeInsets.only(), // set all padding to zero. 
            // EdgeInsets.only() default is all zero
            icon: const Icon(Icons.keyboard_arrow_down, size: 30.0,), 
            onPressed: () {}
          ),
          const SizedBox(width: 20.0),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFAF1018),
              Theme.of(context).backgroundColor,
            ],
            stops: [0, 0.3],
          ),
        ),
        child: Scrollbar(
          controller: _scrollController,
          isAlwaysShown: true,
          child: ListView(
            controller: _scrollController,
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0),
            children: [
              PlayListHeader(playlist: widget.playlist),
              TracksList(tracks: widget.playlist.songs),
            ],
          )),
      ),
    );
  }
}
