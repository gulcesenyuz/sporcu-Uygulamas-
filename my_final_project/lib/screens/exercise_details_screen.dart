import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_final_project/config/palette.dart';
import 'package:my_final_project/model/exercise.dart';
import 'package:video_player/video_player.dart';


class ExerciseDetailsScreen extends StatefulWidget {
  final Exercise exercise;
  ExerciseDetailsScreen(this.exercise);

  //final String title = "Video Demo";

  @override
  _ExerciseDetailsScreenState createState() => _ExerciseDetailsScreenState();
}

class _ExerciseDetailsScreenState extends State<ExerciseDetailsScreen> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // _controller = VideoPlayerController.network(widget.exercise.localVideo);
    _controller = VideoPlayerController.asset(widget.exercise.localVideo);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(0.0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.exercise.title),
          backgroundColor: Palette.darkOrange,
        ),
        body: Column(
          children: [
            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                color: Palette.opacityBlue,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 35),
                  child: Container(
                    child: Text(
                      widget.exercise.information,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Palette.darkGreen,
          onPressed: () {
            setState(() {
              if (_controller.value.isPlaying) {
                _controller.pause();
              } else {
                _controller.play();
              }
            });
          },
          child: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
        ),
      ),
    );
  }
}
