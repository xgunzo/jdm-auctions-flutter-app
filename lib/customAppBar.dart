import 'package:flutter/material.dart';

customAppBar(String title) {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'lib/assets/images/logo/logo.png',
          fit: BoxFit.contain,
          height: 32,
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
        )
      ],
    ),
  );
}
