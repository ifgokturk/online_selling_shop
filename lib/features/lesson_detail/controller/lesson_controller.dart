import 'package:online_selling_shop/common/models/course_entities.dart';
import 'package:online_selling_shop/common/models/lesson_entities.dart';
import 'package:online_selling_shop/common/utils/constanst.dart';
import 'package:online_selling_shop/features/course_detail/repo/course_repo.dart';
import 'package:online_selling_shop/features/lesson_detail/repo/lesson_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_player/video_player.dart';

part 'lesson_controller.g.dart';

VideoPlayerController? videoPlayerController;
@riverpod
Future<void> lessonDetailController(LessonDetailControllerRef ref,
    {required int index}) async {
  LessonRequestEntity lessonRequestEntity = LessonRequestEntity();
  lessonRequestEntity.id = index;
  final response =
      await LessonRepo.courseLessonDetail(params: lessonRequestEntity);
  if (response.code == 200) {
    var url =
        "${AppConstants.IMAGE_UPLOADS_PATH}${response.data!.elementAt(0).url}";
    print(url);
    videoPlayerController = VideoPlayerController.network(url);
    var initializeVideoPlayerFuture = videoPlayerController?.initialize();
    LessonVideo vidInstance = LessonVideo(
      lessonItem: response.data!,
      isplay: false,
      initializeVideoPlayer: initializeVideoPlayerFuture,
    );
    ref
        .read(lessonDataControllerProvider.notifier)
        .updateLessonData(vidInstance);
  } else {
    print("request failed");
  }
}

@riverpod
class LessonDataController extends _$LessonDataController {
  @override
  FutureOr<LessonVideo> build() async {
    return LessonVideo();
  }

  // state dğeişikilğiini bildiriyor
  @override
  set state(AsyncValue<LessonVideo> newState) {
    print("------------- ${newState.value!.lessonItem.first.url}");
    super.state = newState;
  }

  void updateLessonData(LessonVideo lessons) {
    update((data) => data.copyWith(
          url: lessons.url,
          initializeVideoPlayer: lessons.initializeVideoPlayer,
          lessonItem: lessons.lessonItem,
          isPlay: lessons.isplay,
        ));
  }

  void playPause(bool isPlay) {
    update((data) => data.copyWith(
          isPlay: isPlay,
        ));
  }

  void playNextVid(String url) async {
    if (videoPlayerController != null) {
      videoPlayerController?.pause();
      videoPlayerController?.dispose();
    }
    update((data) => data.copyWith(
          isPlay: false,
          initializeVideoPlayer: null,
        ));
    var vidUrl = "${AppConstants.IMAGE_UPLOADS_PATH}$url";
    videoPlayerController = VideoPlayerController.network(vidUrl);
    var initializeVideoPlayerFuture = videoPlayerController?.initialize()
        .then((value) {
          videoPlayerController?.seekTo(Duration(seconds: 0));
          videoPlayerController?.play();
    }
    );
    update((data) => data.copyWith(
          initializeVideoPlayer: initializeVideoPlayerFuture,
          isPlay: true,
          url: vidUrl,
        ));

  }
}
