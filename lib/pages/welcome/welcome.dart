import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_selling_shop/pages/welcome/widgets.dart';

import 'notifier/notifier_welcome.dart';

class Welcome extends ConsumerWidget {
  Welcome({super.key});
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexDotProvider);
    return Container(
      color: Colors.pink,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(),
          body: Stack(
            alignment: Alignment.topCenter,
            children: [
              // showing three welcome pages
              PageView(
                onPageChanged: (value) {
                  ref.read(indexDotProvider.notifier).changeIndex(value);
                },
                controller: _controller,
                scrollDirection: Axis.horizontal,
                children: [
                  //Frst Page
                  appOnBoardingPage(
                    _controller,
                    title: "First app learning",
                    subTitle: "Forget about of all knowledge in one learning",
                    imagePath: "assets/images/reading.png",
                    index: 1,
                    context: context,
                  ),
                  appOnBoardingPage(
                    _controller,
                    title: "Connect with Everyone",
                    subTitle: "Always keep in touch with your friends",
                    imagePath: "assets/images/man.png",
                    index: 2,
                    context: context,
                  ),
                  appOnBoardingPage(
                    _controller,
                    title: "Always Facinated Learning",
                    subTitle: "Learn alt of Thing",
                    imagePath: "assets/images/boy.png",
                    index: 3,
                    context: context,
                  ),
                ],
              ),
              // for showing dots indicator
              Positioned(
                bottom: 50,
                child: DotsIndicator(
                  position: index,
                  dotsCount: 3,
                  mainAxisAlignment: MainAxisAlignment.center,
                  decorator: DotsDecorator(
                    size: const Size.square(9.0),
                    activeSize: const Size(24.0, 8.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.w),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
