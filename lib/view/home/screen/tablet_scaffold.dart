import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responesive_ui_app/constant/global.dart';
import 'package:responesive_ui_app/view/footer/footer_tablet.dart';

import '../widgets/widgets.dart';

class TabletScaffold extends StatefulWidget {
  const TabletScaffold({super.key});

  @override
  State<TabletScaffold> createState() => _TabletScaffoldState();
}

class _TabletScaffoldState extends State<TabletScaffold> {
  final scrollController = ScrollController();
  void scrollListener() async {
    if (scrollController.offset >=
        scrollController.position.maxScrollExtent - 50) {
      isHindFooter(false);
    }
    if (scrollController.offset <
        scrollController.position.maxScrollExtent - 100) {
      isHindFooter(true);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isHindFooter(true);
    scrollController.addListener(scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(scrollListener);
    double widthHeight = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Flutter Weeken'.toUpperCase(),
            style: const TextStyle(color: Colors.black),
          ),
          actions: List.generate(
              3,
              (index) => Obx(
                    () => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: MouseRegion(
                        onHover: (event) {
                          isHoverMenuBar(true);
                          onHoverIndexMenu(index);
                        },
                        onExit: (event) {
                          isHoverMenuBar(false);
                          onHoverIndexMenu(0);
                        },
                        child: Center(
                          child: Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: (isHoverMenuBar.value &&
                                        onHoverIndexMenu.value == index)
                                    ? Colors.black12
                                    : null),
                            child: const Center(
                              child: Text(
                                'About',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),
        ),
        body: SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: PortfolioWidget().portfolioBodyText()),
                        Expanded(
                          child: Container(
                            height: widthHeight * 0.2,
                            width: widthHeight * 0.2,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/profile.jpeg'))),
                          ),
                        ),
                      ],
                    ),
                    PortfolioWidget().buildSocailContactList(
                        height: 600 * 0.07,
                        borderRadius: 30,
                        width: ((widthHeight / 2) - (widthHeight * 0.05)),
                        direction: Axis.horizontal),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                    height: height * 0.2,
                    width: widthHeight,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),
                    height: height * 0.2,
                    width: widthHeight,
                  ),
                ),
                PortfolioWidget().buildProductGrirdView(
                  lists: images,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  crossAxisCount: 1,
                  height: height * 0.25,
                ),
                // GridView.builder(
                //   shrinkWrap: true,
                //   physics: const NeverScrollableScrollPhysics(),
                //   itemCount: 7,
                //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //     mainAxisSpacing: 4,
                //     crossAxisSpacing: 4,
                //     crossAxisCount: 2,
                //     mainAxisExtent: widthHeight * 0.5,
                //   ),
                //   itemBuilder: (context, index) => Padding(
                //       padding: const EdgeInsets.all(4),
                //       child: GestureDetector(
                //         onTap: () {},
                //         child: Container(
                //           decoration: BoxDecoration(
                //             color: Colors.blueGrey,
                //             borderRadius: BorderRadius.circular(10),
                //           ),
                //         ),
                //       )),
                // ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Obx(
          () => isHindFooter.value ? const SizedBox() : const FooterTablets(),
        ));
  }
}
