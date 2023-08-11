// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:chewie/chewie.dart';

// class YoutubeScreen extends StatefulWidget {
//   const YoutubeScreen({super.key});

//   @override
//   State<YoutubeScreen> createState() => _YoutubeScreenState();
// }

// class _YoutubeScreenState extends State<YoutubeScreen> {
//  late  VideoPlayerController _videoController;
//   final videoURL = "https://www.youtube.com/watch?v=YMx8Bbev6T4";


//   final _chewieController = ChewieController(
//         videoPlayerController: VideoPlayerController.networkUrl(Uri.parse(
//           "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4")
//           ),
//           autoPlay: true,
//           looping: true,
//         );
//   @override
//   void initState() {
//     super.initState();


//     _videoController = VideoPlayerController.networkUrl(Uri.parse(
//         'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
//       ..initialize().then((_) {
//         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//         setState(() {});
//       });

      
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         centerTitle: true,
//         title: const Text(
//           "Youtube link",
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10),
//           child: Column(
//             children: [
              
//               const SizedBox(
//                 height: 20,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text("watch youtube video for more details"),
//                     GestureDetector(
//                       onTap: () {
//                       },
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 10),
//                         decoration: BoxDecoration(
//                             color: Colors.black,
//                             borderRadius: BorderRadius.circular(10)),
//                         child: const Text(
//                           "watch video",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 padding: const EdgeInsets.all(8),
//                 child: Chewie(controller: _chewieController),
//               ),
              
              
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose(){
//     super.dispose();
//     // VideoPlayerController.dispose();
//     _chewieController.dispose();
//     _videoController.dispose();
//   }
// }
