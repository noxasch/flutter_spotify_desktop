import 'package:flutter/material.dart';
import '../models/playlist.dart';

class PlayListHeader extends StatelessWidget {
  final Playlist playlist;

  const PlayListHeader({
    Key? key, 
    required this.playlist
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Row(
          children: [
            Image.asset(
              playlist.imageURL,
              height: 200.0,
              width: 200.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16.0,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'playlist'.toUpperCase(),
                    style: Theme.of(context).textTheme.overline!.copyWith(
                      fontSize: 12.0
                    ),
                  ),
                  const SizedBox(height: 12.0,),
                  Text(
                    playlist.name,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  const SizedBox(height: 16.0,),
                  Text(
                    playlist.description,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const SizedBox(height: 16.0,),
                  Text(
                    'Created by ${playlist.creator} • ${playlist.songs.length} songs • ${playlist.duration}',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  
                ],
              )
            ),
          ],
        ),
        const SizedBox(height: 20.0,),
        _PlayListButtons(followers: playlist.followers),
      ], 
    );
  }
}

class _PlayListButtons extends StatelessWidget {
  final String followers;

  const _PlayListButtons({
    Key? key, 
    required this.followers
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 20.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
            backgroundColor: Theme.of(context).accentColor,
            primary: Theme.of(context).iconTheme.color, // text color
            textStyle: Theme.of(context).textTheme
              .caption!.copyWith( fontSize: 12.0, letterSpacing: 2.0)
          ),
        child: Text('play'.toUpperCase())),
        const SizedBox(width: 8.0,),
        IconButton(
          icon: Icon(Icons.favorite_border), 
          iconSize: 30.0,
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.more_horiz), 
          iconSize: 30.0,
          onPressed: () {},
        ),
        const Spacer(),
        Text(
          'followers\n$followers'.toUpperCase(),
          style: Theme.of(context).textTheme.overline!.copyWith(
            fontSize: 12.0),
          textAlign: TextAlign.right,
        )
      ],
    );
  }
}
