import 'dart:math';

import 'package:flutter/material.dart';

Color getRandomColor() {
  Random random = Random();
  return Color.fromARGB(
    255,
    random.nextInt(200) + 56,
    random.nextInt(200) + 56,
    random.nextInt(200) + 56,
  );
}

String mapSimplifiedName(String name) {
  return name.split(" ").map((str) => str.characters.first).join(" ");
}
