import './models.dart';

class CurrentTrack {
  final Song? selectedSong;

  CurrentTrack({this.selectedSong});

  CurrentTrack copyWith({selectedSong}) {
    return CurrentTrack(selectedSong: selectedSong);
  }
}
