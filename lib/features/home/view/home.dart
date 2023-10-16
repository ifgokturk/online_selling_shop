import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_selling_shop/common/widgets/app_bar.dart';
import 'package:online_selling_shop/common/widgets/image_widgets.dart';
import 'package:online_selling_shop/features/home/controller/home_controller.dart';
import 'package:online_selling_shop/features/home/view/widgets/home_widget.dart';

import '../../../common/widgets/search_widget.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  late PageController _controller;

//! initstate den daha iyi, değişikilk olduğunda çağırıyor
  @override
  void didChangeDependencies() {
    _controller =
        PageController(initialPage: ref.watch(homeScreenBannerDotsProvider));

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return
        //Global.storageService.getUserProfile().access_token==null?Center(child: const Text("basd user"))
        // :

        Scaffold(
      backgroundColor: Colors.white,
      appBar: homeAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15.h,
              ),
              const HelloText(),
              const UserName(),
              SizedBox(
                height: 20.h,
              ),
              searchBar(),
              SizedBox(
                height: 20.h,
              ),
              HomeBanner(ref: ref, controller: _controller),
              const HomeMenuBar(),
           /*
              CustomScrollView(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.all(20.w),
                    sliver: SliverGrid.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 40,
                      children: const [
                        Text("say hrllo"),
                        Text("say hrllo"),
                        Text("say hrllo"),
                        Text("say hrllo"),
                        Text("say hrllo"),
                      ],
                    ),
                  ),
                ],
              ),
           */
            const  CourseItemGrid(),

            ],
          ),
        ),
      ),
    );
  }
}
