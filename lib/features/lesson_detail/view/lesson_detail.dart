import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_selling_shop/common/utils/constanst.dart';
import 'package:online_selling_shop/common/utils/image_res.dart';
import 'package:online_selling_shop/common/widgets/app_bar.dart';
import 'package:online_selling_shop/common/widgets/app_shadow.dart';
import 'package:online_selling_shop/common/widgets/image_widgets.dart';
import 'package:online_selling_shop/common/widgets/popup_messages.dart';
import 'package:online_selling_shop/features/lesson_detail/controller/lesson_controller.dart';
import 'package:online_selling_shop/features/lesson_detail/widgets/lesson_detail_widgets.dart';
import 'package:video_player/video_player.dart';

class LessonDetail extends ConsumerStatefulWidget {
  const LessonDetail({super.key});

  @override
  ConsumerState<LessonDetail> createState() => _LessonDetailState();
}

class _LessonDetailState extends ConsumerState<LessonDetail> {
  int videoIndex=0;
  late var args;
  @override
  void didChangeDependencies() {
    var id = ModalRoute.of(context)!.settings.arguments as Map;
    args = id["id"];
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //var lessonDetail= ref.watch(lessonDetailControllerProvider(index: args.toInt()));
    var lessonData = ref.watch(lessonDataControllerProvider);
    print("-- my data length is ${lessonData.value!.lessonItem.length}");
    return Scaffold(
      appBar: buildGlobalAppBar(
        title:  "Lesson Detail",
      ),
      body: Center(
        child: lessonData.value == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  lessonData.when(
                    data: (data) {

                      return Column(
                        children: [
                          Container(
                            width: 325.w,
                            height: 200.h,
                            decoration:
                                data.lessonItem.isEmpty ? appBoxShadow():
                            networkImageDecoration(
                                imagePath:
                                    "${AppConstants.IMAGE_UPLOADS_PATH}${data.lessonItem[0].thumbnail}"),
                            child: data.initializeVideoPlayer == null
                                ? FutureBuilder(
                                    future: data.initializeVideoPlayer,
                                    builder: (context, snapShot) {
                                      if (snapShot.connectionState ==
                                          ConnectionState.done) {
                                        return videoPlayerController == null
                                            ? const Text(
                                                "Video Controller Null")
                                            : Stack(
                                                children: [
                                                  VideoPlayer(
                                                      videoPlayerController!)
                                                ],
                                              );
                                      } else {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                    },
                                  )
                                : const Text("hello"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 25.w, right: 25.w, top: 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap:(){
videoIndex=videoIndex-1;
if(videoIndex<0){
  videoIndex=0;
  toastInfo("No earlier videos");
  return ;
}
var videoUrl = data.lessonItem[videoIndex].url;
ref.read(lessonDataControllerProvider.notifier).playNextVid(videoUrl!);



                                  },
                                  child: AppImage(
                                    width: 24.w,
                                    height: 24.h,
                                    imagePath: ImageRes.left,
                                  ),
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (data.isplay) {
                                      videoPlayerController?.pause();
                                      ref
                                          .read(lessonDataControllerProvider
                                              .notifier)
                                          .playPause(false);
                                    } else {
                                      videoPlayerController?.play();
                                      ref
                                          .read(lessonDataControllerProvider
                                              .notifier)
                                          .playPause(true);
                                    }
                                  },
                                  child: data.isplay
                                      ? AppImage(
                                          width: 24.w,
                                          height: 24.h,
                                          imagePath: ImageRes.pause,
                                        )
                                      : AppImage(
                                          width: 24.w,
                                          height: 24.h,
                                          imagePath: ImageRes.pause,
                                        ),
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                GestureDetector(
                                  onTap:(){
                                    videoIndex=videoIndex+1;

if(videoIndex>data.lessonItem.length){
  videoIndex=data.lessonItem.length-1;
  toastInfo("You have seen all videos");
}
var videoUrl= data.lessonItem[videoIndex].url;
ref.read(lessonDataControllerProvider.notifier).playNextVid(videoUrl!);

                                  },
                                  child: AppImage(
                                    width: 24.w,
                                    height: 24.h,
                                    imagePath: ImageRes.right,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),

                          Padding(
                            padding: EdgeInsets.only(left: 25.w, right: 25.w),
                            child: LessonVideos(
                              lessonItem: data.lessonItem,
                              ref: ref,syncVideoIndex:syncVideoIndex
                            ),
                          ),
                        ],
                      );
                    },
                    error: (error, stackTrace) => Text(error.toString()),
                    loading: () => Text("loading"),
                  ),
                ],
              ),
      ),
    );
  }


  void syncVideoIndex(int index){
    videoIndex=index;
  }



}
