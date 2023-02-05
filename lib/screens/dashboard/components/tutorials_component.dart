import 'package:admin/constants.dart';
import 'package:admin/models/TutorialModel.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/components/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TutorialsComponent extends StatefulWidget {
  const TutorialsComponent({Key? key}) : super(key: key);

  @override
  State<TutorialsComponent> createState() => _TutorialsComponentState();
}

class _TutorialsComponentState extends State<TutorialsComponent> {
  late YoutubePlayerController _controller;
  bool _isPlayerReady = false;
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  List<String> urls =['https://youtu.be/7NrIH748PiY','https://youtu.be/7NrIH748PiY','https://youtu.be/7NrIH748PiY','https://youtu.be/7NrIH748PiY'];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(title: "Tutorials For You",),
        SizedBox(height: defaultPadding,),
        Expanded(
          child: ListView.builder(
            itemCount: tutorialVideoList.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              if(Responsive.isDesktop(context)){
                return GestureDetector(
                    child: Container(
                      child: Column(
                        children: [
                          Text(tutorialVideoList[index].title.toString()),
                          FadeInImage.assetNetwork(
                            placeholder: 'assets/images/CC.png',
                            image: 'https://img.youtube.com/vi/' +
                                tutorialVideoList[index].url.substring(
                                    tutorialVideoList[index].url.length - 11) +
                                '/0.jpg',
                          ),
                        ],
                      ),
                      // constraints:
                      // const BoxConstraints(maxWidth: 500),
                      margin: const EdgeInsets.only(
                          top: 50, bottom: 50),
                      // decoration: const BoxDecoration(
                      //     borderRadius: BorderRadius.all(
                      //         Radius.circular(30))),
                    ),
                    onTap: () => showVideoDialog(
                        context,
                        tutorialVideoList[index].url
                            .substring(tutorialVideoList[index].url.length - 11)));

              }else{
                return GestureDetector(
                    child: Container(
                      child: Column(
                        children: [
                          Text(tutorialVideoList[index].title.toString()),
                          FadeInImage.assetNetwork(
                            placeholder: 'assets/images/CC.png',
                            image: 'https://img.youtube.com/vi/' +
                                tutorialVideoList[index].url.substring(
                                    tutorialVideoList[index].url.length - 11) +
                                '/0.jpg',
                          ),
                        ],
                      ),

                    ),
                    onTap: () => showVideoDialog(
                        context,
                        tutorialVideoList[index].url
                            .substring(tutorialVideoList[index].url.length - 11)));

              }
            },
          ),
        )
      ],


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
