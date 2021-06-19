import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/models.dart';

final currentTrackProvider = StateNotifierProvider<CurrentTrackNotifier, CurrentTrackModel>((ref) { 
  return CurrentTrackNotifier(CurrentTrackModel(selectedSong: null)); 
});

class CurrentTrackNotifier extends StateNotifier<CurrentTrackModel> {
  CurrentTrackNotifier(CurrentTrackModel state) : super(CurrentTrackModel(selectedSong: null));

  void selectTrack(Song track) {
    this.state = this.state.copyWith(selectedSong: track);
  }
}
