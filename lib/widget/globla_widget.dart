import 'package:flutter/material.dart';

PreferredSizeWidget appBarByPlatform() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    centerTitle: false,
    title: Text(
      ' Flutter Weeken'.toUpperCase(),
      style: const TextStyle(color: Colors.black),
    ),
  );
}
