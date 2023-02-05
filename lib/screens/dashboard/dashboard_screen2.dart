import 'package:admin/constants.dart';
import 'package:admin/models/BlogModel.dart';
import 'package:admin/models/TutorialModel.dart';
import 'package:admin/responsive.dart';
import 'package:admin/screens/dashboard/components/header.dart';
import 'package:admin/screens/dashboard/components/topten.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../main/components/side_menu.dart';
import 'components/recent_files.dart';

class DashboardScreen2 extends StatefulWidget {
  const DashboardScreen2({Key? key}) : super(key: key);

  @override
  State<DashboardScreen2> createState() => _DashboardScreen2State();
}

class _DashboardScreen2State extends State<DashboardScreen2> {
  late YoutubePlayerController _controller;
  bool _isPlayerReady = false;
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  List<String> urls =['https://www.youtube.com/watch?v=KltWJERR6u4','https://www.youtube.com/watch?v=AAZYFr8-vxY','https://youtu.be/7NrIH748PiY','https://youtu.be/7NrIH748PiY'];
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
                Header(title: "Dashboard",),
                SizedBox(height: defaultPadding),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          //       MyFiles(),
                          if(Responsive.isDesktop(context))
                          Container(
                            height: 300,
                            child: ListView.builder(
                              itemCount: tutorialVideoList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                if(Responsive.isDesktop(context)){
                                  return GestureDetector(
                                      child: Container(
                                        height: 170,
                                        width: 170,
                                        margin: EdgeInsets.all(10.0),
                                        child: Column(
                                          children: [
                                            FadeInImage.assetNetwork(
                                              placeholder: 'assets/images/CC.png',
                                              image: 'https://img.youtube.com/vi/' +
                                                  tutorialVideoList[index].url.substring(
                                                      tutorialVideoList[index].url.length - 11) +
                                                  '/0.jpg',
                                            ),
                                            Text(tutorialVideoList[index].title.toString()),

                                          ],
                                        ),
                                        // constraints:
                                        // const BoxConstraints(maxWidth: 500),
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
                          ),

                          if(Responsive.isMobile(context))
                            Container(
                              height: 130,
                              child: ListView.builder(
                                itemCount: tutorialVideoList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                    return GestureDetector(
                                        child: Container(
                                          height: 100,
                                          width: 100,
                                          margin: EdgeInsets.all(10.0),
                                          child: FadeInImage.assetNetwork(
                                            placeholder: 'assets/images/CC.png',
                                            image: 'https://img.youtube.com/vi/' +
                                                tutorialVideoList[index].url.substring(
                                                    tutorialVideoList[index].url.length - 11) +
                                                '/0.jpg',
                                          ),
                                        ),
                                        onTap: () => showVideoDialog(
                                            context,
                                            tutorialVideoList[index].url
                                                .substring(tutorialVideoList[index].url.length - 11)));


                                },
                              ),
                            ),

                          RecentFiles(),
                          SizedBox(height: defaultPadding),
                          TopTen(),
                          if (Responsive.isMobile(context))
                            SizedBox(height: defaultPadding),
                        ],
                      ),
                    ),
                    if (!Responsive.isMobile(context))
                      SizedBox(width: defaultPadding),
                    // On Mobile means if the screen is less than 850 we dont want to show it
                  ],
                )
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
