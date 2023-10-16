import 'package:flutter/material.dart';
import 'package:online_selling_shop/common/widgets/text_widgets.dart';

import '../utils/app_colors.dart';

AppBar buildAppBar({String title = ""}) {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(10),
      child: Container(
        color: Colors.grey.withOpacity(0.5),
        height: 1,
      ),
    ),
    title: Text16Normal(text: title, color: AppColors.primaryText),
  );
}