// import 'dart:async';

// import 'package:assets_audio_player/assets_audio_player.dart';
// import 'package:bloc/bloc.dart';
// import 'package:firebase_flutter_life/features/audioplayer/data/repositories/audiplayer_repository.dart';

// class AudioPlayerBloc extends Bloc<AudioPlayerEvent, AudioPlayerState> {

//   final AssetsAudioPlayer assetsAudioPlayer;
//   final AudioPlayerRepository audioPlayerRepository;

//   List<StreamSubscription> playerSubscriptions = new List();

//   AudioPlayerBloc({this.assetsAudioPlayer, this.audioPlayerRepository}) {
//     playerSubscriptions.add(
//         assetsAudioPlayer.playerState.listen((event) {
//           _mapPlayerStateToEvent(event);
//         }));
//   }

//     @override
//   Stream<AudioPlayerState> mapEventToState(AudioPlayerEvent event) async* {

//     if (event is AudioPlayed) {
//       yield* _mapAudioPlayedToState(event);
//     }
//     if (event is AudioPaused) {
//       yield* _mapAudioPausedToState(event);
//     }
//     if (event is AudioStopped) {
//       yield* _mapAudioStoppedToState();
//     }
//     }

//     ...

//     @override
//   Future<Function> close() {
//     playerSubscriptions.forEach((subscription) {
//       subscription.cancel();
//     });
//     return assetsAudioPlayer.dispose();
//   }

//     ...
// }