import './models.dart';

class CurrentTrackModel {
  final Song? selectedSong;

  CurrentTrackModel({this.selectedSong});

  CurrentTrackModel copyWith({selectedSong}) {
    return CurrentTrackModel(selectedSong: selectedSong);
  }
}
