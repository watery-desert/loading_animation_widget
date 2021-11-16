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

import 'src/bouncing_ball/bouncing_ball.dart';
import 'src/arch_circle/arch_circle.dart';
import 'src/prograssive_dots/prograssive_dots.dart';
import 'src/four_rotating_dots/four_rotating_dots.dart';
import 'src/falling_dot/falling_dot.dart';

class LoadingAnimationWidget {
  LoadingAnimationWidget._();

  /// A ball falls inside a ring cut out when face up and falls when face down.
  static Widget fallingDot({
    required Color color,
    required double size,
    int time = 1500,
  }) {
    return FallingDot(
      color: color,
      size: size,
      time: time,
    );
  }

  static Widget fourRotatingDots({
    required Color color,
    required double size,
    int time = 2200,
  }) {
    return FourRotatingDots(
      color: color,
      size: size,
      time: time,
    );
  }

  static Widget prograssiveDots({
    required Color color,
    required double size,
    int time = 800,
  }) {
    return PrograssiveDots(
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

  static Widget archCircle({
    required Color color,
    required double size,
    int time = 2000,
  }) {
    return ArchCircle(
      color: color,
      size: size,
      time: time,
    );
  }

  static Widget bouncingBall({
    required Color color,
    required double size,
    int time = 1200,
  }) {
    return BouncingBall(
      color: color,
      size: size,
      time: time,
    );
  }

  static Widget flickr({
    required Color leftDotColor,
    required Color rightDotColor,
    required double size,
    int time = 2000,
  }) {
    return Flickr(
      leftDotColor: leftDotColor,
      rightDotColor: rightDotColor,
      size: size,
      time: time,
    );
  }

  static Widget hexagonDots({
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

  static Widget dotsTriangle({
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

  static Widget elementalLoader({
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

  static Widget horizontalDotsRotation({
    required Color color,
    required double size,
    int time = 800,
  }) {
    return HorizontalDotsRotation(
      color: color,
      size: size,
      time: time,
    );
  }

  static Widget newtonCradle({
    required Color color,
    required double size,
    int time = 1200,
  }) {
    return NewtonCradle(
      color: color,
      size: size,
      time: time,
    );
  }

  static Widget inkDrop({
    required Color color,
    required double size,
    int time = 1400,
  }) {
    return InkDrop(
      color: color,
      size: size,
      time: time,
    );
  }

  static Widget preloader({
    required Color leftDotColor,
    required Color rightDotColor,
    required double size,
    int time = 3000,
  }) {
    return Preloader(
      leftDotColor: leftDotColor,
      rightDotColor: rightDotColor,
      size: size,
      time: time,
    );
  }

  static Widget staggeredDotWave({
    required Color color,
    required double size,
    int time = 1600,
  }) {
    return StaggeredDotWave(
      color: color,
      size: size,
      time: time,
    );
  }

  static Widget stretchedDots({
    required Color color,
    required double size,
    int time = 2000,
  }) {
    return StretchedDots(
      color: color,
      size: size,
      time: time,
    );
  }

  static Widget wavingDots({
    required Color color,
    required double size,
    int time = 1200,
  }) {
    return WavingDots(
      color: color,
      size: size,
      time: time,
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
