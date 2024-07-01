import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../constant/global.dart';

class PortfolioWidget {
  Widget portfolioBodyText() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Hi, I\'m Phanna',
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
          const Text(
            'UPDATE: The app has been updated since I wrote this article but the concept is same. You may check the new version here.\nSince the launch of flutter 2.0 everyone is talking about the updates.',
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.location_on,
                        size: 16,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'str.271 , Phnom Penh',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.radio_button_checked,
                        size: 16,
                        color: Colors.blueAccent,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'available for new projects',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSocailContactList(
      {double? height, double? width, double? borderRadius, Axis? direction}) {
    return Wrap(
      direction: direction ?? Axis.vertical,
      children: List.generate(
        3,
        (index) => Padding(
          padding: const EdgeInsets.all(4),
          child: GestureDetector(
            child: Container(
              height: height ?? 40,
              width: width ?? double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(borderRadius ?? 20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: Icon(
                    Icons.facebook,
                    size: height ?? 30,
                  )),
                  const Expanded(flex: 2, child: Text('Facebook'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildProductGrirdView(
      {double? height,
      required List lists,
      int? crossAxisCount,
      double? crossAxisSpacing,
      double? mainAxisSpacing}) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: lists.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: mainAxisSpacing ?? 4,
        crossAxisSpacing: crossAxisSpacing ?? 4,
        crossAxisCount: crossAxisCount ?? 1,
        mainAxisExtent: height ?? (100 * 0.25),
      ),
      itemBuilder: (context, index) => MouseRegion(
          onHover: (event) {
            isHover(true);
            onIndex = index.obs;
          },
          onExit: (event) {
            isHover(false);
            onIndex = 0.obs;
          },
          child: Obx(
            () => Padding(
              padding: EdgeInsets.all(
                  isHover.value && onIndex.value == index ? 0 : 6),
              child: AnimatedContainer(
                //  transform: Matrix4.outer(u, v),
                curve: Curves.fastOutSlowIn,
                decoration: BoxDecoration(
                  boxShadow: (isHover.value && onIndex.value == index)
                      ? [
                          const BoxShadow(
                              blurRadius: 4,
                              color: Colors.blueGrey,
                              // offset: Offset(2, 2),
                              blurStyle: BlurStyle.solid)
                        ]
                      : [],
                  color: (isHover.value && onIndex.value == index)
                      ? Colors.blueGrey
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                duration: const Duration(microseconds: 0),
                child: crossAxisCount! > 1
                    ?
                    // for grirdView
                    Column(
                        children: [
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(images[index]))),
                          )),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 4),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          image: const DecorationImage(
                                              image: NetworkImage(
                                                  'https://images-platform.99static.com/yjs48H2_z933ez1BO67TcdysRwQ=/0x0:960x960/500x500/top/smart/99designs-contests-attachments/103/103754/attachment_103754936'))),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text(
                                        'App Name',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 4),
                                  child: Text('App description'),
                                ),
                                const Spacer(),
                                InkWell(
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 255, 208, 0),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 8),
                                      child: Text('View source'),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ))
                        ],
                      )
                    : Row(
                        children: [
                          Container(
                            height: height ?? 200,
                            width: height ?? 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        NetworkImage(lists[index].toString()))),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 4),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          image: const DecorationImage(
                                              image: NetworkImage(
                                                  'https://images-platform.99static.com/yjs48H2_z933ez1BO67TcdysRwQ=/0x0:960x960/500x500/top/smart/99designs-contests-attachments/103/103754/attachment_103754936'))),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text(
                                        'App Name',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 4),
                                  child: Text('App description'),
                                ),
                                const Spacer(),
                                InkWell(
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 255, 208, 0),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 8),
                                      child: Text('View source'),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
              ),
            ),
          )),
    );
  }
}
