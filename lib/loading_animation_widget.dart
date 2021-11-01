library loading_animation_widget;

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/src/dots_in_out/dots_in_out.dart';
import 'src/beat/beat.dart';
import 'src/discrete_circle/discrete_circle.dart';
import 'src/triangle_dots/triangle_dots.dart';
import 'src/elementry_loader/elemental_loader.dart';
import 'src/hexagon_dots/hexagon_dots.dart';
import 'src/flickr/flickr.dart';
import 'src/trangle/trangle.dart';

import 'src/horizontalDotsRotation/horizontal_dots_rotation.dart';
import 'src/ink_drop/ink_drop.dart';
import 'src/newton_cradle/newton_cradle.dart';
import 'src/preloader/preloader.dart';
import 'src/staggered_wave/staggered_wave.dart';
import 'src/stretched_dots/stretched_dots.dart';
import 'src/waving_dots/waving_dots.dart';

class LoadingAnimationWidget {
  LoadingAnimationWidget._();

  /// Give
  static Widget beat({
    required Color color,
    required double size,
    int time = 1000,
  }) {
    return Beat(
      color: color,
      size: size,
      time: time,
    );
  }

  static Widget discreteCircle({
    required Color color,
    required double size,
    int time = 2000,
  }) {
    return DiscreteCircle(
      color: color,
      size: size,
      time: time,
    );
  }

  static Widget dotsTriangle({
    /// Color of the widget
    required Color color,
    required double size,
    int time = 1200,
  }) {
    return DotsTriangle(
      color: color,
      size: size,
      time: time,
    );
  }

  static Widget halfTringleDot({
    /// Color of the widget
    required Color color,
    required double size,
    int time = 3000,
  }) {
    return HalfTringleDot(
      color: color,
      size: size,
      time: time,
    );
  }

  static Widget hexagonDots({
    /// Color of the widget
    required Color color,
    required double size,
    int time = 3000,
  }) {
    return HexagonDots(
      color: color,
      size: size,
      time: time,
    );
  }

  static Widget elementalLoader({
    /// Color of the widget
    required Color color,
    required double size,
    int time = 1500,
  }) {
    return ElementalLoader(
      color: color,
      size: size,
      time: time,
    );
  }

  static Widget flickr({
    /// Color of the widget
    required List<Color> colors,
    required double size,
    int time = 2000,
  }) {
    return Flickr(
      colors: colors,
      size: size,
      time: time,
    );
  }

  static Widget horizontalDotsRotation({
    /// Color of the widget
    required Color color,
    required double size,
    int time = 3000,
  }) {
    return HorizontalDotsRotation(
      color: color,
      size: size,
      // time: time,
    );
  }

  static Widget newtonCradle({
    /// Color of the widget
    required Color color,
    required double size,
    int time = 3000,
  }) {
    return NewtonCradle(
      color: color,
      size: size,
      // time: time,
    );
  }

  static Widget inkDrop({
    /// Color of the widget
    required Color color,
    required double size,
    int time = 3000,
  }) {
    return InkDrop(
      color: color,
      size: size,
      // time: time,
    );
  }

  static Widget preloader({
    /// Color of the widget
    required List<Color> colors,
    required double size,
    int time = 3000,
  }) {
    return Preloader(
      colors: colors,
      size: size,
      time: time,
    );
  }

  static Widget staggeredDotWave({
    /// Color of the widget
    required Color color,
    required double size,
    int time = 3000,
  }) {
    return StaggeredDotWave(
      color: color,
      size: size,
      // time: time,
    );
  }

  static Widget stretchedDots({
    /// Color of the widget
    required Color color,
    required double size,
    int time = 3000,
  }) {
    return StretchedDots(
      color: color,
      size: size,
      // time: time,
    );
  }

  static Widget wavingDots({
    /// Color of the widget
    required Color color,
    required double size,
    int time = 3000,
  }) {
    return WavingDots(
      color: color,
      size: size,
      // time: time,
    );
  }

  static Widget dotsInOut({
    required Color color,
    required double size,
    int time = 2000,
  }) {
    return DotsInOut(
      color: color,
      size: size,
      time: time,
    );
  }
}
