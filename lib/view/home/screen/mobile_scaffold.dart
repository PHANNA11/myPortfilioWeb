import 'package:flutter/material.dart';
import 'package:responesive_ui_app/view/footer/footer_mobile.dart';
import 'package:responesive_ui_app/view/home/widgets/widgets.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({super.key});

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  @override
  Widget build(BuildContext context) {
    double widthHeight = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: const Drawer(),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
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
                            image: AssetImage('assets/images/profile.jpeg'))),
                  )),
              PortfolioWidget().portfolioBodyText(),
              PortfolioWidget().buildSocailContactList(
                  height: 600 * 0.07,
                  width: widthHeight - (widthHeight * 0.07)),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 7,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  crossAxisCount: 1,
                  mainAxisExtent: height * 0.25,
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
              FooterMobile()
            ],
          ),
        ),
      ),
    );
  }
}
