
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomato_timer/screens/setting_page.dart';

import '../components/audio_player.dart';
import '../components/circular_animation.dart';
import '../components/clock_painter.dart';
import '../model/data_model.dart';

class HomePage extends StatelessWidget {
  int appBarHeight = 100;
  double circleBorder = 30;
  double buttonSize = 48;
  AudioPlayer _audioPlayer = AudioPlayer();
  String _audioFilePath = 'path_to_your_audio_file.mp3'; // Replace with your audio file path

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    Color currentColor = Provider.of<DataModel>(context, listen: false).currentColor;
    double circleWidth = screenWidth * 2 / 5;
    double innerCircleTop = (screenHeight)/2 - circleWidth - 100 + circleBorder/2;
    double innerCircleLeft = (screenWidth)/2 - circleWidth + circleBorder/2;
    double innerCircleWidth = screenWidth * 4 / 5 - circleBorder;

    return Scaffold(
      appBar: AppBar(
          title: Text(Provider.of<DataModel>(context, listen: true).time.toString()),
          //title: Text(context.read<DataModel>().time.toString()),
          leading: IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Show Snackbar',
            onPressed: () {
              Navigator.push(context, BottomToTopPageRoute(page: SettingPage()));
            },
          ),
          actions: <Widget> [
            IconButton(
              icon: const Icon(Icons.help_outline),
              tooltip: 'Show Snackbar',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a snackbar')));
              },
            ),
          ]
      ),
      body: Center(
        child: Stack(
          children: [
            Positioned(
              top: 0,
                child: SoundPlayerWidget(audioFilePath: 'assets/sounds/rain_thunder_storm.mp3'),
                //Image.asset('assets/iii.png'),
                //SoundPlayerWidget(audioFilePath: '/sounds/rain_thunder_storm.mp3'),
            ),
            Positioned(
              top: 0,
              child: CustomPaint(
                painter: ClockPainter(screenHeight, screenWidth, currentColor),
              ),
            ),
            Positioned(
                top: innerCircleTop,
                left: innerCircleLeft,
                child: CircularRevealAnimation(
                  isRunning: Provider.of<DataModel>(context, listen: false).isRunning,
                  duration: Duration(seconds: Provider.of<DataModel>(context, listen: true).time), // Duration of the animation
                  size: Size(innerCircleWidth, innerCircleWidth),
                  color: Colors.black, // Color of the animated container
                ),
            ),
            Positioned(
                top: (screenHeight)/2 - appBarHeight - buttonSize/2,
                left: (screenWidth)/2 - buttonSize/2,
                child: IconButton(
                  icon: (Provider.of<DataModel>(context, listen: false).isRunning) ? const Icon(Icons.stop) : const Icon(Icons.play_arrow),
                  iconSize: buttonSize,// Icon to display
                  onPressed: () {
                    // TODO: why set true have problem?
                    bool running = Provider.of<DataModel>(context, listen: false).isRunning;
                    Provider.of<DataModel>(context, listen: false).setIsRunning(!running);
                    // Stop and Start
                  },
                ),
            ),
          Positioned(
            top: screenHeight - 200,
            left: screenWidth/2 - 40,
            child: OutlinedButton(
              child: const Text('Quit'),
              onPressed: () {
                Provider.of<DataModel>(context, listen: false).setReset(true);
                Provider.of<DataModel>(context, listen: false).setIsRunning(false);
                Provider.of<DataModel>(context, listen: false).setTime(Provider.of<DataModel>(context, listen: false).time);
              },
            ),
            )
          ],
        )
      ),
    );
  }
}


// TODO: Make an route animation panel library
class BottomToTopPageRoute extends PageRouteBuilder {
  final Widget page;

  BottomToTopPageRoute({required this.page}) : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}

