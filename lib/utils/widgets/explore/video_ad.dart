import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoAdSection extends StatefulWidget {
  const VideoAdSection({
    super.key,
    required this.videoController,
    required this.page,
    required this.isShow,
  });

  final VideoPlayerController videoController;
  final Widget page;
  final bool isShow;

  @override
  State<VideoAdSection> createState() => _VideoAdSectionState();
}

class _VideoAdSectionState extends State<VideoAdSection> {
  @override
  Widget build(BuildContext context) {
    return widget.isShow
        ? AspectRatio(
            aspectRatio: widget.videoController.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer(
                  widget.videoController,
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Color.fromARGB(211, 0, 0, 0),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.02,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lorem ipsum ",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          "Lorem ipsum is a placeholder text ",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        : AspectRatio(
            aspectRatio: widget.videoController.value.aspectRatio,
            child: const Center(child: CircularProgressIndicator()),
          );
  }
}
