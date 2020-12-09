import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_flutter_life/features/authentication/data/models/user.dart';
import 'package:firebase_flutter_life/features/authentication/data/repositories/firebase_user_data_service.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum PlayerState { stopped, playing, paused }

class PostTile extends StatefulWidget {
  final String lessonTitle;
  final String lessonTopic;
  final String postID;
  final String uid;
  final String recordingURL;
  final String username;

  const PostTile(
      {Key key,
      this.lessonTitle,
      this.lessonTopic,
      this.postID,
      this.uid,
      this.recordingURL,
      this.username})
      : super(key: key);

  @override
  _PostTileState createState() => _PostTileState();
}

class _PostTileState extends State<PostTile> {
  AudioPlayer _audioPlayer;
  AudioPlayerState _audioPlayerState;
  Duration _duration;
  Duration _position;
  PlayerMode mode;

  PlayerState _playerState = PlayerState.stopped;
  PlayingRouteState _playingRouteState = PlayingRouteState.SPEAKERS;
  StreamSubscription _durationSubscription;
  StreamSubscription _positionSubscription;
  StreamSubscription _playerCompleteSubscription;
  StreamSubscription _playerErrorSubscription;
  StreamSubscription _playerStateSubscription;
  StreamSubscription<PlayerControlCommand> _playerControlCommandSubscription;

  get _isPlaying => _playerState == PlayerState.playing;
  get _isPaused => _playerState == PlayerState.paused;

  @override
  void initState() {
    super.initState();
    _initAudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _playerCompleteSubscription?.cancel();
    _playerErrorSubscription?.cancel();
    _playerStateSubscription?.cancel();
    _playerControlCommandSubscription?.cancel();
    super.dispose();
  }

  void _initAudioPlayer() {
    _audioPlayer = AudioPlayer(mode: mode);

    _durationSubscription = _audioPlayer.onDurationChanged.listen((duration) {
      setState(() => _duration = duration);

      // TODO implemented for iOS, waiting for android impl
      if (Theme.of(context).platform == TargetPlatform.iOS) {
        // (Optional) listen for notification updates in the background
        _audioPlayer.startHeadlessService();

        // set at least title to see the notification bar on ios.
        _audioPlayer.setNotification(
          title: widget.lessonTopic,
          artist: widget.username,
          albumTitle: widget.lessonTopic,
          imageUrl: "",
          // forwardSkipInterval: const Duration(seconds: 30), // default is 30s
          // backwardSkipInterval: const Duration(seconds: 30), // default is 30s
          duration: duration,
          elapsedTime: Duration(seconds: 0),
          hasNextTrack: true,
          hasPreviousTrack: false,
        );
      }
    });

    _positionSubscription =
        _audioPlayer.onAudioPositionChanged.listen((p) => setState(() {
              _position = p;
            }));

    _playerCompleteSubscription =
        _audioPlayer.onPlayerCompletion.listen((event) {
      _onComplete();
      setState(() {
        _position = _duration;
      });
    });

    _playerErrorSubscription = _audioPlayer.onPlayerError.listen((msg) {
      print('audioPlayer error : $msg');
      setState(() {
        _playerState = PlayerState.stopped;
        _duration = Duration(seconds: 0);
        _position = Duration(seconds: 0);
      });
    });

    _playerControlCommandSubscription =
        _audioPlayer.onPlayerCommand.listen((command) {
      print('command');
    });

    _audioPlayer.onPlayerStateChanged.listen((state) {
      if (!mounted) return;
      setState(() {
        _audioPlayerState = state;
      });
    });

    _audioPlayer.onNotificationPlayerStateChanged.listen((state) {
      if (!mounted) return;
      setState(() => _audioPlayerState = state);
    });

    _playingRouteState = PlayingRouteState.SPEAKERS;
  }

  Future<int> _play() async {
    final playPosition = (_position != null &&
            _duration != null &&
            _position.inMilliseconds > 0 &&
            _position.inMilliseconds < _duration.inMilliseconds)
        ? _position
        : null;
    final result =
        await _audioPlayer.play(widget.recordingURL, position: playPosition);
    if (result == 1) setState(() => _playerState = PlayerState.playing);

    // default playback rate is 1.0
    // this should be called after _audioPlayer.play() or _audioPlayer.resume()
    // this can also be called everytime the user wants to change playback rate in the UI
    _audioPlayer.setPlaybackRate(playbackRate: 1.0);

    return result;
  }

  Future<int> _pause() async {
    final result = await _audioPlayer.pause();
    if (result == 1) setState(() => _playerState = PlayerState.paused);
    return result;
  }

  Future<int> _stop() async {
    final result = await _audioPlayer.stop();
    if (result == 1) {
      setState(() {
        _playerState = PlayerState.stopped;
        _position = Duration();
      });
    }
    return result;
  }

  void _onComplete() {
    setState(() => _playerState = PlayerState.stopped);
  }

  @override
  Widget build(BuildContext context) {
    bool isPlaying = false;

    Widget userPhoto() {
      return FutureBuilder(
          future:
              Provider.of<UserDatabaseService>(context).getUserByID(widget.uid),
          builder: (BuildContext ctx, AsyncSnapshot snap) {
            User user = snap.data;
            if (snap.hasData) {
              return CircleAvatar(
                backgroundImage: user.profileImageURL != null
                    ? NetworkImage(user.profileImageURL)
                    : AssetImage('assets/images/logo.jpeg'),
              );
            } else {
              return CircleAvatar(
                backgroundImage: AssetImage("images/placeholder-user.png"),
              );
            }
          });
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          _isPlaying ? _stop() : _play();
        },
        child: Card(
          margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
          color: Colors.white,
          elevation: isPlaying ? 10 : 1,
          child: ListTile(
            leading: userPhoto(),
            title: AutoSizeText(
              widget.lessonTitle,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
              maxLines: 1,
            ),
            subtitle: AutoSizeText(
              widget.lessonTopic,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
              maxLines: 1,
            ),
            // trailing: GestureDetector(
            //   onTap: () {},
            //   child: Icon(
            //     widget.isFavorite ? Icons.favorite : Icons.favorite_border,
            //     size: 28.0,
            //     color: Colors.lightGreen[100],
            //   ),
            // ),
          ),
        ),
      ),
    );
  }
}
