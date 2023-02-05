
import 'dart:convert';

import 'package:admin/constants.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/components/header.dart';
import 'package:admin/screens/dashboard/components/tutorials_component.dart';
import 'package:admin/screens/main/components/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class TutorialVideoComponent extends StatefulWidget {
  const TutorialVideoComponent({Key? key}) : super(key: key);

  @override
  State<TutorialVideoComponent> createState() => _TutorialVideoComponentState();
}

class _TutorialVideoComponentState extends State<TutorialVideoComponent> {
  final _formKey = GlobalKey<FormState>();
  late YoutubePlayerController _controller;
  bool _isPlayerReady = false;
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  List<String> urls =['https://youtu.be/7NrIH748PiY','https://youtu.be/7NrIH748PiY','https://youtu.be/7NrIH748PiY','https://youtu.be/7NrIH748PiY'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SideMenu(),
        body: SafeArea(
          child: SingleChildScrollView(
            primary: false,
            padding: EdgeInsets.all(defaultPadding),
            child: Column(
              children: [
                // Header(title: "Need Help ?",),
                // SizedBox(height: defaultPadding),
                ListView.builder(
                  itemCount: urls.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                          child: Container(
                            height: 300,
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/images/CC.png',
                              image: 'https://img.youtube.com/vi/' +
                                  urls[index].substring(
                                      urls[index].length - 11) +
                                  '/0.jpg',
                            ),
                            constraints:
                            const BoxConstraints(maxWidth: 500),
                            margin: const EdgeInsets.only(
                                top: 50, bottom: 50),
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(30))),
                          ),
                          onTap: () => showVideoDialog(
                              context,
                              urls[index]
                                  .substring(urls[index].length - 11))),
                    );
                  },
                ),
              ],
            ),
          ),
        )
    );
  }


  showVideoDialog(BuildContext context, url) {
    _controller = YoutubePlayerController(
      initialVideoId: url,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
      ),
    )..addListener(listener);

    AlertDialog alert = AlertDialog(
        content: Container(
          width: 500,
          height: 200,
          child: YoutubePlayerBuilder(
            onExitFullScreen: () {
              // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
              SystemChrome.setPreferredOrientations(DeviceOrientation.values);
            },
            player: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
              onReady: () {
                _isPlayerReady = true;
              },
            ),
            builder: (context, player) => Scaffold(),
          ),
        ));

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

}
