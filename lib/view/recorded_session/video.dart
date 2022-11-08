import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {
  final String asset;
  const VideoView({ Key? key,required this.asset }) : super(key: key);

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
    VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        widget.asset)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }
  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _controller!.value.isInitialized
                ? 
                // AspectRatio(
                //     aspectRatio: _controller!.value.aspectRatio,
                //     child: VideoPlayer(_controller!),
                //   )
                Container(
                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height-100,

                  child:VideoPlayer(_controller!) ,)
                : Container(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: VideoProgressIndicator(
          _controller!,
          allowScrubbing: true,
          colors: VideoProgressColors(
              backgroundColor: Colors.red,
              bufferedColor: Colors.black,
              playedColor: Colors.blueAccent),
        ),
                    ),
                Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80,vertical: 8),
                  child: Container(
                    color: Colors.black54,
                    child: Row(
                      
                      mainAxisAlignment: MainAxisAlignment.center,
                      
                      children: [
                        ElevatedButton(
       style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xff3f3d56)),
          fixedSize: MaterialStateProperty.all(Size(50, 50)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100)))),
                onPressed: () {
                  _controller!.seekTo(Duration(
                   seconds: _controller!.value.position.inSeconds - 10));
                },
                
                child: Icon(Icons.fast_rewind_outlined)),
                SizedBox(
                  width: 20,
                ),
          //               InkWell(
          //                  onTap: () {
          //   setState(() {
          //     _controller!.value.isPlaying
          //                 ? _controller!.pause()
          //                 : _controller!.play();
          //   });
          // },
          // child: Icon(
          //   _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,size: 40,
          // ),
          //               ),
           ElevatedButton(
       style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xff6c64fa)),
          fixedSize: MaterialStateProperty.all(Size(70, 70)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100)))),
                onPressed: () {
                 setState(() {
              _controller!.value.isPlaying
                          ? _controller!.pause()
                          : _controller!.play();
            });
                },
                child: Icon( _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,)),
                         SizedBox(
                  width: 20,
                ),
                   
                        ElevatedButton(
       style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xff3f3d56)),
          fixedSize: MaterialStateProperty.all(Size(50, 50)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100)))),
                onPressed: () {
                  _controller!.seekTo(Duration(
                   seconds: _controller!.value.position.inSeconds + 10));
                },
                child: Icon(Icons.fast_forward_outlined)),
                      ],
                    ),
                  ),
                ),
                 SizedBox(
                  width: 20,
                ),
               
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     setState(() {
        //       _controller!.value.isPlaying
        //           ? _controller!.pause()
        //           : _controller!.play();
        //     });
        //   },
        //   child: Icon(
        //     _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
        //   ),
        // ),
      
    );
  }
  
}