import 'package:flutter/material.dart';

import 'beat/beat.dart';
import 'discrete_circle/discrete_circle.dart';
import 'three_rotating_dots/three_rotating_dots.dart';
import 'dots_triangle/dots_triangle.dart';
import 'two_rotating_arc/two_rotating_arc.dart';
import 'hexagon_dots/hexagon_dots.dart';
import 'flickr/flickr.dart';
import 'half_triangle_dot/half_triangle_dot.dart';

import 'horizontal_rotating_dots/horizontal_rotating_dots.dart';
import 'ink_drop/ink_drop.dart';
import 'newton_cradle/newton_cradle.dart';
import 'twisting_dots/twisting_dots.dart';
import 'staggered_dots_wave/staggered_dots_wave.dart';
import 'stretched_dots/stretched_dots.dart';
import 'wave_dots/wave_dots.dart';

import 'bouncing_ball/bouncing_ball.dart';
import 'three_arched_circle/three_arched_circle.dart';
import 'prograssive_dots/prograssive_dots.dart';
import 'four_rotating_dots/four_rotating_dots.dart';
import 'falling_dot/falling_dot.dart';

class LoadingAnimationWidget {
  LoadingAnimationWidget._();

  /// A ball falls inside a ring cut out when face up and falls when face down.
  /// Required color is applied to the ring and dot.
  static Widget fallingDot({
    required Color color,
    required double size,
    Key? key,
  }) {
    return FallingDot(
      color: color,
      size: size,
      key: key,
    );
  }

  /// Four dots shrink to the center and expand and rotates 315 degree.
  /// Required color is applied to four dots.
  static Widget fourRotatingDots({
    required Color color,
    required double size,
    Key? key,
  }) {
    return FourRotatingDots(
      color: color,
      size: size,
      key: key,
    );
  }

  /// Four dots in a row left most scales down and a new dot emerge from right.
  /// Required color is applied to four dots.
  static Widget prograssiveDots({
    required Color color,
    required double size,
    Key? key,
  }) {
    return PrograssiveDots(
      color: color,
      size: size,
      key: key,
    );
  }

  /// A dot becomes a full ring and also have discrete following rings.
  /// Required color is applied to the circular ring.
  static Widget discreteCircle({
    required Color color,
    required double size,
    Color secondRingColor = Colors.teal,
    Color thirdRingColor = Colors.orange,
    Key? key,
  }) {
    return DiscreteCircle(
      color: color,
      size: size,
      secondCircleColor: secondRingColor,
      thirdCircleColor: thirdRingColor,
      key: key,
    );
  }

  /// Three arc at 60 degree shrinks to a dot while rotating and comes back to inital.
  /// Required color is applied to all three arc.
  static Widget threeArchedCircle({
    required Color color,
    required double size,
    Key? key,
  }) {
    return ThreeArchedCircle(
      color: color,
      size: size,
      key: key,
    );
  }

  /// A ball fall from top and bounce back
  /// Required color is applied to the ball.
  static Widget bouncingBall({
    required Color color,
    required double size,
    Key? key,
  }) {
    return BouncingBall(
      color: color,
      size: size,
      key: key,
    );
  }

  /// Similar to flickr loading animation. Two disks swap positon and come back to initial.
  /// Required leftDotColor is applied to the left disk.
  /// Required rightDotColor is applied to the right disk.
  static Widget flickr({
    required Color leftDotColor,
    required Color rightDotColor,
    required double size,
    Key? key,
  }) {
    return Flickr(
      leftDotColor: leftDotColor,
      rightDotColor: rightDotColor,
      size: size,
      key: key,
    );
  }

  /// Six dots in each vertice of a hexagon emerge one by one then shrink to disappear while rotating
  /// Required color is applied to all dots.
  static Widget hexagonDots({
    required Color color,
    required double size,
    Key? key,
  }) {
    return HexagonDots(
      color: color,
      size: size,
      key: key,
    );
  }

  /// One ring emerge from the center and scale up until touches the outer ring.
  /// Then the outer ring expand a bit then come back to normal.
  /// Required color is applied to both rings.
  static Widget beat({
    required Color color,
    required double size,
    Key? key,
  }) {
    return Beat(
      color: color,
      size: size,
      key: key,
    );
  }

  /// Three dots in each vertice of an equilateral triangle expand towards side
  /// then moves to next vertice. Required color is applied to all dots.
  static Widget dotsTriangle({
    required Color color,
    required double size,
    Key? key,
  }) {
    return DotsTriangle(
      color: color,
      size: size,
      key: key,
    );
  }

  /// An equilateral triangle has two side and a dot in the empty side. The dot
  /// moves those two sides also change position. Required color is applied to
  /// two sides and the dot.
  static Widget halfTriangleDot({
    required Color color,
    required double size,
    Key? key,
  }) {
    return HalfTriangleDot(
      color: color,
      size: size,
      key: key,
    );
  }

  /// Two arc place at 180 degree apart from each other. While rotating shrink to dot.
  /// Required color is applied to both arc.
  static Widget twoRotatingArc({
    required Color color,
    required double size,
    Key? key,
  }) {
    return TwoRotatingArc(
      color: color,
      size: size,
      key: key,
    );
  }

  /// Three dots rotates in a horizontal plane. Required color is applied to all
  /// three dots.
  static Widget horizontalRotatingDots({
    required Color color,
    required double size,
    Key? key,
  }) {
    return HorizontalRotatingDots(
      color: color,
      size: size,
      key: key,
    );
  }

  /// Four balls swing and give newton cradle animation. Required color is
  /// applied to all four balls.
  static Widget newtonCradle({
    required Color color,
    required double size,
    Key? key,
  }) {
    return NewtonCradle(
      color: color,
      size: size,
      key: key,
    );
  }

  /// A dot falls down then completes a circle then become to dot again.
  /// Required color is applied to the ring and the dot.
  static Widget inkDrop({
    required Color color,
    required double size,
    Key? key,
  }) {
    return InkDrop(
      color: color,
      size: size,
      key: key,
    );
  }

  /// Two disks rotate twisting. Required leftDotColor is applied to the left
  /// disk. Required leftDotColor is applied to the left disk. Required rightDotColor
  /// is applied to the right disk.
  static Widget twistingDots({
    required Color leftDotColor,
    required Color rightDotColor,
    required double size,
    Key? key,
  }) {
    return TwistingDots(
      leftDotColor: leftDotColor,
      rightDotColor: rightDotColor,
      size: size,
      key: key,
    );
  }

  /// Five dots expands one after another like wave and then come back to
  /// original. Required color is applied to all dots.
  static Widget staggeredDotsWave({
    required Color color,
    required double size,
    Key? key,
  }) {
    return StaggeredDotsWave(
      color: color,
      size: size,
      key: key,
    );
  }

  /// Five dots stretch up and shrink. Then again stretch down and shrink. Required
  /// color is applied to all dots.
  static Widget stretchedDots({
    required Color color,
    required double size,
    Key? key,
  }) {
    return StretchedDots(
      color: color,
      size: size,
      key: key,
    );
  }

  /// Three dots go up and down give wave effect. Required color is applied to
  /// all dots.
  static Widget waveDots({
    required Color color,
    required double size,
    Key? key,
  }) {
    return WaveDots(
      color: color,
      size: size,
      key: key,
    );
  }

  /// Three balls at each vertice of an equilateral triangle moves to the center
  /// while rotating and then again go back to origianl position. Required color
  /// is applied to all balls.
  static Widget threeRotatingDots({
    required Color color,
    required double size,
    Key? key,
  }) {
    return ThreeRotatingDots(
      color: color,
      size: size,
      key: key,
    );
  }
}
