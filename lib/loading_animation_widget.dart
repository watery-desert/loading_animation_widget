library loading_animation_widget;

import 'package:flutter/material.dart';

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
import 'src/three_rotating_dots/three_rotating_dots.dart';

class LoadingAnimationWidget {
  LoadingAnimationWidget._();

  /// A ball falls inside a ring cut out when face up and falls when face down.
  /// Required color is applied to the ring and dot. Time is in milliseconds which is optional.
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

  /// Four dots shrink to the center and expand and rotates 315 degree.
  /// Required color is applied to four dots. Time is in milliseconds which is optional.
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

  /// Four dots in a row left most scales down and a new dot emerge from right.
  /// Required color is applied to four dots. Time is in milliseconds which is optional.
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

  /// A dot becomes a full ring and also have discrete following rings.
  /// Required color is applied to the circular ring. Time is in milliseconds which is optional.
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

  /// Three arc at 60 degree shrinks to a dot while rotating and comes back to inital.
  /// Required color is applied to all three arc. Time is in milliseconds which is optional.
  static Widget threeArchedCircle({
    required Color color,
    required double size,
    int time = 2000,
  }) {
    return ThreeArchedCircle(
      color: color,
      size: size,
      time: time,
    );
  }

  /// A ball fall from top and bounce back
  /// Required color is applied to the ball. Time is in milliseconds which is optional.

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

  /// Similar to flickr loading animation. Two disks swap positon and come back to initial.
  /// Required leftDotColor is applied to the left disk.
  /// Required rightDotColor is applied to the right disk.
  /// Time is in milliseconds which is optional.
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

  /// Six dots in each vertice of a hexagon emerge one by one then shrink to disappear while rotating
  /// Required color is applied to all dots. Time is in milliseconds which is optional.
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

  /// One ring emerge from the center and scale up until touches the outer ring.
  /// Then the outer ring expand a bit then come back to normal.
  /// Required color is applied to both rings. Time is in milliseconds which is optional.
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

  /// Three dots in each vertice of an equilateral triangle expand towards side
  /// then moves to next vertice. Required color is applied to all dots.
  /// Time is in milliseconds which is optional.
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

  /// An equilateral triangle has two side and a dot in the empty side. The dot
  /// moves those two sides also change position. Required color is applied to
  /// two sides and the dot. Time is in milliseconds which is optional.
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

  /// Two arc place at 180 degree apart from each other. While rotating shrink to dot.
  /// Required color is applied to both arc. Time is in milliseconds which is optional.
  static Widget twoRotatingArc({
    required Color color,
    required double size,
    int time = 1500,
  }) {
    return TwoRotatingArc(
      color: color,
      size: size,
      time: time,
    );
  }

  /// Three dots rotates in a horizontal plane. Required color is applied to all
  /// three dots. Time is in milliseconds which is optional.
  static Widget threeHorizontalDots({
    required Color color,
    required double size,
    int time = 800,
  }) {
    return ThreeHorizontalDots(
      color: color,
      size: size,
      time: time,
    );
  }

  /// Four balls swing and give newton cradle animation. Required color is
  /// applied to all four balls. Time is in milliseconds which is optional.
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

  /// A dot falls down then completes a circle then become to dot again.
  /// Required color is applied to the ring and the dot. Time is in
  /// milliseconds which is optional.
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

  /// Two disks rotate twisting. Required leftDotColor is applied to the left
  /// disk. Required leftDotColor is applied to the left disk. Required rightDotColor
  /// is applied to the right disk. Time is in milliseconds which is optional.
  static Widget twistingDots({
    required Color leftDotColor,
    required Color rightDotColor,
    required double size,
    int time = 3000,
  }) {
    return TwistingDots(
      leftDotColor: leftDotColor,
      rightDotColor: rightDotColor,
      size: size,
      time: time,
    );
  }

  /// Five dots expands one after another like wave and then come back to
  /// original. Required color is applied to all dots. Time is in
  /// milliseconds which is optional.
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

  /// Five dots stretch up and shrink. Then again stretch down and shrink. Required
  /// color is applied to all dots. Time is in milliseconds which is optional.
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

  /// Three dots go up and down give wave effect. Required color is applied to
  /// all dots. Time is in milliseconds which is optional.
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

  /// Three balls at each vertice of an equilateral triangle moves to the center
  /// while rotating and then again go back to origianl position. Required color
  /// is applied to all balls. Time is in milliseconds which is optional.
  static Widget threeRotatingBalls({
    required Color color,
    required double size,
    int time = 2000,
  }) {
    return ThreeRotatingBalls(
      color: color,
      size: size,
      time: time,
    );
  }
}
