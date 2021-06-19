import 'package:flutter/material.dart';
import '../models/song.dart';

class TracksList extends StatelessWidget {
  final List<Song> tracks;

  const TracksList({
    Key? key, 
    required this.tracks
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: <DataColumn>[
        DataColumn(label: Text('title'.toUpperCase())),
        DataColumn(label: Text('artist'.toUpperCase())),
        DataColumn(label: Text('album'.toUpperCase())),
        const DataColumn(label: Icon(Icons.access_time)),
      ],
      rows: <DataRow>[
        ...tracks.map((track) => DataRow(
          cells: <DataCell>[
            DataCell(
              Text(track.title, style: TextStyle(
                color: Theme.of(context).iconTheme.color),)
            ),
            DataCell(
              Text(track.artist, style: TextStyle(
                color: Theme.of(context).iconTheme.color),)
            ),
            DataCell(
              Text(track.album, style: TextStyle(
                color: Theme.of(context).iconTheme.color),)
            ),
            DataCell(
              Text(track.duration, style: TextStyle(
                color: Theme.of(context).iconTheme.color),)
            ),
            
          ]
        )).toList()
      ],
    );
  }
}