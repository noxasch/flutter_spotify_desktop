
import 'package:flutter/foundation.dart';

@immutable
class Song {
  final String id;
  final String title;
  final String artist;
  final String album;
  final String duration;

  const Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.duration,
  });

  Song copyWith({id, title, artist, album, duration}) {
    return Song(
      id: id ?? this.id, 
      title: title ?? this.title, 
      artist: artist ?? this.artist, 
      album: album ?? this.album, 
      duration: album ?? this.album, );
  }
}