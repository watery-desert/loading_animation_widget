import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loading_animation_widget/src/beat/beat.dart';
import 'package:loading_animation_widget/src/bouncing_ball/bouncing_ball.dart';
import 'package:loading_animation_widget/src/discrete_circle/discrete_circle.dart';
import 'package:loading_animation_widget/src/dots_triangle/dots_triangle.dart';
import 'package:loading_animation_widget/src/falling_dot/falling_dot.dart';
import 'package:loading_animation_widget/src/flickr/flickr.dart';
import 'package:loading_animation_widget/src/four_rotating_dots/four_rotating_dots.dart';
import 'package:loading_animation_widget/src/half_tringle_dot/half_tringle_dot.dart';
import 'package:loading_animation_widget/src/hexagon_dots/hexagon_dots.dart';
import 'package:loading_animation_widget/src/horizontal_rotating_dots/horizontal_rotating_dots.dart';
import 'package:loading_animation_widget/src/ink_drop/ink_drop.dart';
import 'package:loading_animation_widget/src/newton_cradle/newton_cradle.dart';
import 'package:loading_animation_widget/src/prograssive_dots/prograssive_dots.dart';
import 'package:loading_animation_widget/src/staggered_dots_wave/staggered_dots_wave.dart';
import 'package:loading_animation_widget/src/stretched_dots/stretched_dots.dart';
import 'package:loading_animation_widget/src/three_arched_circle/three_arched_circle.dart';
import 'package:loading_animation_widget/src/three_rotating_dots/three_rotating_dots.dart';
import 'package:loading_animation_widget/src/twisting_dots/twisting_dots.dart';
import 'package:loading_animation_widget/src/two_rotating_arc/two_rotating_arc.dart';
import 'package:loading_animation_widget/src/wave_dots/wave_dots.dart';
import 'base_structure.dart';

const Color _testColor = Color(0xFFFFFFFF);

const double _testSize = 200;

void main() {
  testWidgets('Beat Ticker has been disposed.', (WidgetTester tester) async {
    await tester.pumpWidget(
      baseStructure(const Beat(
        color: _testColor,
        size: _testSize,
      )),
    );

    tester.verifyTickersWereDisposed();
  });

  testWidgets('BounchingBall Ticker has been disposed.',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      baseStructure(const BouncingBall(
        color: _testColor,
        size: _testSize,
      )),
    );

    tester.verifyTickersWereDisposed();
  });

testWidgets('DiscreteCircle Ticker has been disposed.',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      baseStructure(const DiscreteCircle(
        color: _testColor,
        secondCircleColor: _testColor,
        thirdCircleColor: _testColor,
        size: _testSize,
      )),
    );

    tester.verifyTickersWereDisposed();
  });

  testWidgets('DotsTriangle Ticker has been disposed.',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      baseStructure(const DotsTriangle(
        color: _testColor,
        size: _testSize,
      )),
    );

    tester.verifyTickersWereDisposed();
  });

  testWidgets('FallingDot Ticker has been disposed.',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      baseStructure(const FallingDot(
        color: _testColor,
        size: _testSize,
      )),
    );

    tester.verifyTickersWereDisposed();
  });

  testWidgets('Flickr Ticker has been disposed.', (WidgetTester tester) async {
    await tester.pumpWidget(
      baseStructure(const Flickr(
        size: _testSize,
        leftDotColor: _testColor,
        rightDotColor: _testColor,
      )),
    );

    tester.verifyTickersWereDisposed();
  });

  testWidgets('FourRotatingDots Ticker has been disposed.',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      baseStructure(const FourRotatingDots(
        size: _testSize,
        color: _testColor,
      )),
    );

    tester.verifyTickersWereDisposed();
  });

  testWidgets('HalfTringleDot Ticker has been disposed.',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      baseStructure(const HalfTringleDot(
        size: _testSize,
        color: _testColor,
      )),
    );

    tester.verifyTickersWereDisposed();
  });

  testWidgets('HexagonDots Ticker has been disposed.',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      baseStructure(const HexagonDots(
        size: _testSize,
        color: _testColor,
      )),
    );

    tester.verifyTickersWereDisposed();
  });

  testWidgets('HorizontalRotatingDots Ticker has been disposed.',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      baseStructure(const HorizontalRotatingDots(
        size: _testSize,
        color: _testColor,
      )),
    );

    tester.verifyTickersWereDisposed();
  });

  testWidgets('InkDrop Ticker has been disposed.', (WidgetTester tester) async {
    await tester.pumpWidget(
      baseStructure(const InkDrop(
        size: _testSize,
        color: _testColor,
      )),
    );

    tester.verifyTickersWereDisposed();
  });

  testWidgets('NewtonCradle Ticker has been disposed.',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      baseStructure(const NewtonCradle(
        size: _testSize,
        color: _testColor,
      )),
    );

    tester.verifyTickersWereDisposed();
  });

  testWidgets('PrograssiveDots Ticker has been disposed.',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      baseStructure(const PrograssiveDots(
        size: _testSize,
        color: _testColor,
      )),
    );

    tester.verifyTickersWereDisposed();
  });

  testWidgets('StaggeredDotsWave Ticker has been disposed.',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      baseStructure(const StaggeredDotsWave(
        size: _testSize,
        color: _testColor,
      )),
    );

    tester.verifyTickersWereDisposed();
  });

  testWidgets('StretchedDots Ticker has been disposed.',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      baseStructure(const StretchedDots(
        size: _testSize,
        color: _testColor,
      )),
    );

    tester.verifyTickersWereDisposed();
  });

  testWidgets('ThreeArchedCircle Ticker has been disposed.',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      baseStructure(const ThreeArchedCircle(
        size: _testSize,
        color: _testColor,
      )),
    );

    tester.verifyTickersWereDisposed();
  });

  testWidgets('ThreeRotatingDots Ticker has been disposed.',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      baseStructure(const ThreeRotatingDots(
        size: _testSize,
        color: _testColor,
      )),
    );

    tester.verifyTickersWereDisposed();
  });

  testWidgets('TwistingDots Ticker has been disposed.',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      baseStructure(const TwistingDots(
        size: _testSize,
        leftDotColor: _testColor,
        rightDotColor: _testColor,
      )),
    );

    tester.verifyTickersWereDisposed();
  });
  testWidgets('TwoRotatingArc Ticker has been disposed.',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      baseStructure(const TwoRotatingArc(
        size: _testSize,
        color: _testColor,
      )),
    );

    tester.verifyTickersWereDisposed();
  });

  testWidgets('WaveDots Ticker has been disposed.',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      baseStructure(const WaveDots(
        size: _testSize,
        color: _testColor,
      )),
    );

    tester.verifyTickersWereDisposed();
  });
}
