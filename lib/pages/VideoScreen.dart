import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  // Daftar video lokal
  final List<String> videoPaths = [
    'video/vid1.mp4',
    'video/vid2.mp4',
    'video/vid3.mp4',
    'video/vid4.mp4',
    'video/vid5.mp4',
    'video/vid6.mp4',
    'video/vid7.mp4',
    'video/vid8.mp4',
  ];

  // Daftar judul video
  final List<String> videoTitles = [
    'Fluida Ideal',
    'Persamaan Kontinuitas',
    'Asas Bernoulli',
    'Kebocoran Dinding Tangki',
    'Gaya Angkat Sayap Pesawat',
    'Pipa Venturi',
    'Tabung Pitot',
    'Alat Penyemprot',
  ];

  // Daftar tautan YouTube
  final List<String> youtubeLinks = [
    'https://youtu.be/USbszEO-InM?si=rrV0sxzW06ZGBaTU',
    'https://youtu.be/QZiQsLvpt0g?si=DVxNGccvjcqkM8pR',
    'https://youtu.be/ETH8FWXKI0E?si=NxLlsnsTVjuwugXg',
    'https://youtu.be/o6_7J4VFoIQ?si=BwnbcIdjAEFYcxmL',
    'https://youtu.be/vqSTIcZ7bNs?si=IER1cwFwyOBRiHSG',
    'https://youtu.be/u9nsalbEUe8?si=OxIPe6FXUiwYgp1h',
    'https://youtu.be/taPlUNVNP1o?si=TDpDVLZ4F8J4gVoq',
    'https://youtu.be/dubvJyYVRRU?si=tAXvC3JbIBOgfIZR',
  ];

  // Indeks video saat ini
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(videoPaths[currentIndex]);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _rewindVideo() {
    final currentPosition = _controller.value.position;
    final duration = Duration(
        seconds: (currentPosition.inSeconds - 10)
            .clamp(0, currentPosition.inSeconds));
    _controller.seekTo(duration);
  }

  void _fastForwardVideo() {
    final currentPosition = _controller.value.position;
    final totalDuration = _controller.value.duration;
    final duration = Duration(
        seconds:
            (currentPosition.inSeconds + 10).clamp(0, totalDuration.inSeconds));
    _controller.seekTo(duration);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Pembelajaran'),
        leading: CupertinoButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Icon(CupertinoIcons.back),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Judul Video: ${videoTitles[currentIndex]}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: Stack(
                      children: [
                        VideoPlayer(_controller),
                        Positioned(
                          left: 0,
                          top: 0,
                          bottom: 0,
                          width: MediaQuery.of(context).size.width / 2,
                          child: GestureDetector(
                            onDoubleTap: _rewindVideo,
                            behavior: HitTestBehavior.opaque,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          bottom: 0,
                          width: MediaQuery.of(context).size.width / 2,
                          child: GestureDetector(
                            onDoubleTap: _fastForwardVideo,
                            behavior: HitTestBehavior.opaque,
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (_controller.value.isPlaying) {
                      _controller.pause();
                    } else {
                      _controller.play();
                    }
                  });
                },
                child: _controller.value.isPlaying
                    ? Icon(Icons.pause)
                    : Icon(Icons.play_arrow),
              ),
              SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  _showFullScreenVideo(context);
                },
                child: Icon(Icons.fullscreen),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            'Link YouTube: ${youtubeLinks[currentIndex]}',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.blue),
          ),
          SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: videoTitles.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(videoTitles[index]),
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                      _controller =
                          VideoPlayerController.asset(videoPaths[currentIndex]);
                      _initializeVideoPlayerFuture = _controller.initialize();
                      _controller.play();
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showFullScreenVideo(BuildContext context) async {
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);

    Navigator.of(context)
        .push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          body: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Center(
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
        ),
      ),
    )
        .then((_) async {
      await SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp]);
      if (!_controller.value.isPlaying) {
        _controller.play();
      }
    });
  }
}
