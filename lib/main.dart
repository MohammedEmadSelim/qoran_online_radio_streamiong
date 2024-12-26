import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuranRadioPlayer(),
    );
  }
}

class QuranRadioPlayer extends StatefulWidget {
  @override
  _QuranRadioPlayerState createState() => _QuranRadioPlayerState();
}

class _QuranRadioPlayerState extends State<QuranRadioPlayer> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final String radioStreamUrl = "https://stream.radiojar.com/8s5u5tpdtwzuv";

  @override
  void initState() {
    super.initState();
    _startStreaming();
  }

  Future<void> _startStreaming() async {
    try {
      await _audioPlayer.setUrl(radioStreamUrl);
      _audioPlayer.play();
    } catch (e) {
      print("Error starting the stream: $e");
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("إذاعة القرآن الكريم"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Quran Radio Streaming",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _audioPlayer.play();
              },
              child: Text("Play"),
            ),
            ElevatedButton(
              onPressed: () {
                _audioPlayer.stop();
              },
              child: Text("Pause"),
            ),
          ],
        ),
      ),
    );
  }
}
