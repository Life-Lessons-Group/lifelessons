// import 'package:firebase_flutter_life/features/audioplayer/data/models/audioplayer_model.dart';

// import 'audiplayer_repository.dart';

// class OnlineAudioPlayerRepository implements AudioPlayerRepository {

//   final List<AudioPlayerModel> audioPlayerModels;

//   OnlineAudioPlayerRepository({this.audioPlayerModels});

//     @override
//   Future<AudioPlayerModel> getById(String audioPlayerId) async {
//     return Future.value(audioPlayerModels.firstWhere((model) => model.id == audioPlayerId));
//   }

//     @override
//   Future<List<AudioPlayerModel>> getAll() async {
//     return Future.value(audioPlayerModels);
//   }


// }