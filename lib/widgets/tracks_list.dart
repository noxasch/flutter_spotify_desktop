import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/models.dart';
import '../models/song.dart';
import '../providers/providers.dart';

class TracksList extends StatelessWidget {
  final List<Song> tracks;

  const TracksList({
    Key? key, 
    required this.tracks
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final CurrentTrackModel currentTrack = watch(currentTrackProvider);
        return DataTable(
          headingTextStyle: Theme.of(context).textTheme.overline!.copyWith(
            fontSize: 12.0
          ),
          dataRowHeight: 54.0,
          showCheckboxColumn: false,
          columns: <DataColumn>[
            DataColumn(label: Text('title'.toUpperCase())),
            DataColumn(label: Text('artist'.toUpperCase())),
            DataColumn(label: Text('album'.toUpperCase())),
            const DataColumn(label: Icon(Icons.access_time)),
          ],
          rows: <DataRow>[
            ...tracks.map((track) {
              final bool selected = currentTrack.selectedSong?.id == track.id;
              final TextStyle style =  
                TextStyle(color: selected ? Theme.of(context).accentColor 
                  : Theme.of(context).iconTheme.color);
              return DataRow(      
                cells: <DataCell>[
                  DataCell(
                    Text(track.title, style: style,)
                  ),
                  DataCell(
                    Text(track.artist, style: style,)
                  ),
                  DataCell(
                    Text(track.album, style: style,)
                  ),
                  DataCell(
                    Text(track.duration, style: style,)
                  ),
                ],
                selected: selected,
                onSelectChanged: (_) {
                  context.read(currentTrackProvider.notifier).selectTrack(track);
                }
              );
            }).toList()
          ],
        );
      },
    );
  }
}