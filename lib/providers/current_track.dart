import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/models.dart';

final currentTrackProvider = StateNotifierProvider<CurrentTrackNotifier, CurrentTrack>((ref) { 
  return CurrentTrackNotifier(CurrentTrack(selectedSong: null)); 
});

class CurrentTrackNotifier extends StateNotifier<CurrentTrack> {
  CurrentTrackNotifier(CurrentTrack state) : super(CurrentTrack(selectedSong: null));

  void selectTrack(Song track) {
    this.state = this.state.copyWith(selectedSong: track);
  }
}
