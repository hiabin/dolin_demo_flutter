import 'package:dolin_demo_flutter/app/constants/app_fonts.dart';
import 'package:dolin_demo_flutter/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/index_controller.dart';

class IndexView extends GetView<IndexController> {
  const IndexView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: PageView(
            controller: controller.pageController,
            physics: const NeverScrollableScrollPhysics(), // 禁止左右滑动，同 iOS 交互
            children: controller.pages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            // showSelectedLabels: false,
            // showUnselectedLabels: false,
            iconSize: 22,
            currentIndex: controller.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              controller.setCurrentIndex(index);
              controller.pageController.jumpToPage(index);
            },
            items: [
              BottomNavigationBarItem(
                  icon: const Icon(AppFonts.home),
                  label: LocaleKeys.index_home.tr),
              BottomNavigationBarItem(
                  icon: const Icon(AppFonts.comic),
                  label: LocaleKeys.index_comic.tr),
              BottomNavigationBarItem(
                  icon: const Icon(AppFonts.practice),
                  label: LocaleKeys.index_practice.tr),
              BottomNavigationBarItem(
                  icon: const Icon(AppFonts.mine),
                  label: LocaleKeys.index_mine.tr),
            ],
          ),
        ));
  }
}
