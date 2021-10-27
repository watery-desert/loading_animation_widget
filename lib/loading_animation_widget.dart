library loading_animation_widget;

import 'package:flutter/material.dart';
import 'src/beat/beat.dart';

class LoadingAnimationWidget {
  static Widget beat(
      {required Color color, required double size, int duration = 1000}) {
    return Beat(
      color: color,
      size: size,
      duration: duration,
    );
  }
}
