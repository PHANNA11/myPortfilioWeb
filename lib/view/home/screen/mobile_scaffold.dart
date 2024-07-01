import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responesive_ui_app/view/footer/footer_mobile.dart';
import 'package:responesive_ui_app/view/home/widgets/widgets.dart';

import '../../../constant/global.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({super.key});

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
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

  List<String> listDrawers = ['Mobile App', 'Web App', 'Backend', 'UX/UI'];
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
      endDrawer: Drawer(
        backgroundColor: Colors.blueGrey,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 60,
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: const [
                      CircleAvatar(
                        maxRadius: 15,
                        backgroundImage:
                            AssetImage('assets/images/profile.jpeg'),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'FlutterWeeken.com',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ExpansionTile(
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                textColor: Colors.white,
                iconColor: Colors.white,
                backgroundColor: Colors.blueGrey,
                title: const Text('Service'),
                children: List.generate(listDrawers.length,
                    (index) => ListTile(title: Text(listDrawers[index]))),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: Text(
          'Flutter Weeken'.toUpperCase(),
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: double.infinity,
                      child: Container(
                        height: widthHeight * 0.4,
                        width: widthHeight * 0.3,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/profile.jpeg'))),
                      )),
                  PortfolioWidget().portfolioBodyText(),
                  PortfolioWidget().buildSocailContactList(
                      height: 600 * 0.07,
                      width: widthHeight - (widthHeight * 0.07)),
                  PortfolioWidget().buildProductGrirdView(
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                      crossAxisCount: 1,
                      height: 600 * 0.25,
                      lists: images)
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
          () => isHindFooter.value ? const SizedBox() : const FooterMobile()),
    );
  }
}
