import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_flutter_life/features/authentication/data/models/user.dart';
import 'package:firebase_flutter_life/features/authentication/data/repositories/firebase_user_data_service.dart';
import 'package:firebase_flutter_life/services/firebase_service.dart';
import 'package:firebase_flutter_life/services/internal_notifications.dart';
import 'package:firebase_flutter_life/services/shared_prefs.dart';

import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:provider/provider.dart';

enum PlayerState { stopped, playing, paused }

class PostTile extends StatefulWidget {
  final String lessonTitle;
  final String lessonTopic;
  final String postID;
  final String uid;
  final String recordingURL;
  final String username;

  const PostTile({
    Key key,
    this.lessonTitle,
    this.lessonTopic,
    this.postID,
    this.uid,
    this.recordingURL,
    this.username,
  }) : super(key: key);

  @override
  _PostTileState createState() => _PostTileState();
}

class _PostTileState extends State<PostTile> {
  FlutterSoundPlayer _myPlayer = FlutterSoundPlayer();
  bool _myPlayerIsInit = false;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    // Be careful : openAudioSession return a Future.
    // Do not access your FlutterSoundPlayer or FlutterSoundRecorder before the completion of the Future
    _myPlayer
        .openAudioSession(
      // device: AudioDevice.blueToothA2DP,
      focus: AudioFocus.requestFocusAndStopOthers,
      category: SessionCategory.playback,
    )
        .then((value) {
      setState(() {
        _myPlayerIsInit = true;
      });
    });
  }

  @override
  void dispose() {
    // Be careful : you must `close` the audio session when you have finished with it.
    _myPlayer.closeAudioSession();
    _myPlayer = null;
    super.dispose();
  }

  void play() async {
    if (_myPlayer.isPlaying) {
      await _myPlayer.startPlayer(
          fromURI: widget.recordingURL,
          codec: Codec.defaultCodec,
          numChannels: 1,
          whenFinished: () {
            print("finished playing audio");
          });
    } else {
      await _myPlayer.startPlayer(
          fromURI: widget.recordingURL,
          codec: Codec.defaultCodec,
          whenFinished: () {
            print("finished playing audio");
          });
    }

    await _myPlayer.setVolume(1);
    FirebaseService().updateListensCount();
  }

  Future<void> stopPlayer() async {
    if (_myPlayer != null) {
      await _myPlayer.stopPlayer();
    }
    isPlaying = false;
  }

  // Function getPlaybackFn() {
  //   if (!_myPlayerIsInit) {
  //     return null;
  //   }
  //   return _myPlayer.isStopped
  //       ? play
  //       : () {
  //           stopPlayer().then((value) => setState(() {}));
  //         };
  // }

  @override
  Widget build(BuildContext context) {
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
                backgroundImage:
                    AssetImage("assets/images/placeholder-user.png"),
              );
            }
          });
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          play();
          print("Lesson Tapped");
          print(widget.recordingURL);
          print(_myPlayer.playerState);
          SharedPrefs().listenCount += 1;
          InternalNotifications().contributionReminder(context);
          print(SharedPrefs().listenCount);
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
