import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../widgets/widgets.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  bool isHover = false;
  void _hoverColorsEnter(PointerEvent details) {
    setState(() {
      isHover = true;
    });
  }

  void _hoverColorsExit(PointerEvent details) {
    setState(() {
      isHover = false;
    });
  }

  @override
  Widget build(BuildContext context) {
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
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: MouseRegion(
              onEnter: _hoverColorsEnter,
              onExit: _hoverColorsExit,
              child: Center(
                child: Container(
                  height: 30,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: isHover ? Colors.black12 : null),
                  child: const Center(
                    child: Text(
                      'About',
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Expanded(child: PortfolioWidget().portfolioBodyText()),
                    Expanded(
                      child: Container(
                        height: 400 * 0.6,
                        width: 400 * 0.6,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/profile.jpeg'))),
                      ),
                    ),
                  ],
                ),
              ),
              PortfolioWidget().buildSocailContactList(
                  height: height * 0.07,
                  borderRadius: 30,
                  width: (widthHeight / 3) - (widthHeight * 0.025),
                  direction: Axis.horizontal),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                        ),
                        height: (height) * 0.4,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red,
                        ),
                        height: (height) * 0.4,
                      ),
                    ),
                  ),
                ],
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 7,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  crossAxisCount: 3,
                  mainAxisExtent: widthHeight * 0.4,
                ),
                itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(4),
                    child: GestureDetector(
                      onTap: () {},
                      child: Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
