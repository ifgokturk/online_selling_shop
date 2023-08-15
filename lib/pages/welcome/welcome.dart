import 'package:flutter/material.dart';
import 'package:online_selling_shop/pages/welcome/widgets.dart';

class Welcome extends StatelessWidget {
   Welcome({super.key});
final PageController _controller=PageController() ;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Stack(
        children: [
          PageView(
controller: _controller,
            scrollDirection: Axis.horizontal,
            children: [
              //Frst Page
              appOnBoardingPage(
                _controller,
                title: "First app learning",
                subTitle: "Forget about of all knowledge in one learning",
                imagePath: "assets/images/reading.png",index:1,
              ),
              appOnBoardingPage(      _controller,
                title: "Connect with Everyone",
                subTitle: "Always keep in touch with your friends",
                imagePath: "assets/images/man.png",index:2,
              ),appOnBoardingPage(      _controller,
                title: "Always Facinated Learning",
                subTitle: "Learn alt of Thing",
                imagePath: "assets/images/boy.png",index:3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
