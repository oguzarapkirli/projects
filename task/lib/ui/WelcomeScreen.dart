import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/WelcomeController.dart';
import 'LoginScreen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  final controller = Get.put(WelcomeController());

  @override
  void initState() {
    controller.tabController = TabController(length: 3, vsync: this);
    controller.tabController.index = controller.page.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: (controller.isLoading.value)
            ? const Center(child: CircularProgressIndicator())
            : _buildWelcome(context),
      ),
    );
  }

  Widget _buildWelcome(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 550,
                  child: TabBarView(
                    controller: controller.tabController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: controller.pages,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    (controller.page.value == 0)
                        ? const SizedBox()
                        : ElevatedButton(
                            onPressed: () {
                              if (controller.page.value == 0) {
                                return;
                              } else {
                                controller.page.value -= 1;
                                controller.tabController.animateTo(
                                  controller.page.value,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn,
                                );
                              }
                            },
                            child: Text(
                              'Geri',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: Colors.red),
                            ),
                          ),
                    ElevatedButton(
                      onPressed: () {
                        if (controller.page.value == 2) {
                          Get.offAll(
                            () => const LoginScreen(),
                            transition: Transition.rightToLeft,
                          );
                        } else {
                          controller.page.value += 1;
                          controller.tabController.animateTo(
                            controller.page.value,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                      child: Text(
                        (controller.page.value == 2) ? 'Başla' : 'İleri',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: Colors.red),
                      ),
                    ),
                  ],
                ),
                DotsIndicator(
                  dotsCount: controller.pages.length,
                  decorator: const DotsDecorator(
                    color: Colors.grey,
                    activeColor: Colors.white,
                  ),
                  position: controller.page.value.toDouble(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
