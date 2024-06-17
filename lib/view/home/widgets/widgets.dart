import 'package:flutter/material.dart';

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
}
