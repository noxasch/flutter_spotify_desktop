import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/providers.dart';

class CurrentTrack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      width: double.infinity,
      height: 84.0,
      color: Colors.black87,
      child: Row(children: [
        _TrackInfo(),
        const Spacer(),
        _PlayerControls(),
        const Spacer(),
        if (MediaQuery.of(context).size.width > 800)
          _MoreControls(),
      ],),
    );
  }
}

class _TrackInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final selectedSong = watch(currentTrackProvider).selectedSong;
        if (selectedSong == null) return SizedBox.shrink();
        return Row(children: [
          Image.asset('assets/images/lofigirl.jpg', 
            height: 60.0, 
            width: 60.0,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 12.0,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(selectedSong.title, 
                style: Theme.of(context).textTheme.bodyText1,),
              const SizedBox(height: 4.0,),
              Text(selectedSong.artist,
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: Colors.grey[300],
                  fontSize: 12.0
                ),),
          ],),
          const SizedBox(width: 12.0,),
          IconButton(
            icon: const Icon(Icons.favorite_border), 
            onPressed: () {}
          )
        ],);
      },
    );
  }
}

class _PlayerControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final selectedSong = watch(currentTrackProvider).selectedSong;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(children: [
              IconButton(
                padding: const EdgeInsets.only(),
                icon: Icon(Icons.shuffle), 
                iconSize: 20.0,
                onPressed: () {}
              ),
              IconButton(
                padding: const EdgeInsets.only(),
                icon: Icon(Icons.skip_previous_outlined), 
                iconSize: 20.0,
                onPressed: () {}
              ),
              IconButton(
                padding: const EdgeInsets.only(),
                icon: Icon(Icons.play_circle_outline_outlined), 
                iconSize: 34.0,
                onPressed: () {}
              ),
              IconButton(
                padding: const EdgeInsets.only(),
                icon: Icon(Icons.skip_next_outlined), 
                iconSize: 20.0,
                onPressed: () {}
              ),
              IconButton(
                padding: const EdgeInsets.only(),
                icon: Icon(Icons.repeat), 
                iconSize: 20.0,
                onPressed: () {}
              ),
            ],),
            const SizedBox(height: 4.0,),
            Row(children: [
              Text('0:00', style: Theme.of(context).textTheme.caption,),
              const SizedBox(width: 8.0,),
              Container(
                height: 5.0,
                width: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(2.5)
                ),
              ),
              const SizedBox(width: 8.0,),
              Text(selectedSong?.duration ?? '0:00',
                style: Theme.of(context).textTheme.caption
              ),
            ],)
          ],
        );
      },
    );
  }
}

class _MoreControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.devices_outlined), 
          iconSize: 20.0,
          onPressed: () {}
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.volume_up_outlined), 
              onPressed: () {}
            ),
            Container(
              height: 5.0,
              width: 70.0,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5)
              ),
            )
          ],
        ),
        IconButton(
          icon: const Icon(Icons.fullscreen_outlined), 
          iconSize: 20.0,
          onPressed: () {}
        ),
      ],
    );
  }
}