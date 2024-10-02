<p align="center">
<a style="text-decoration: none" href="https://waterydesert.com"><img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/package_cover.png" alt="Loading Animation Widget"/></a>
   
</p>

<div align="center">

[![YouTube Badge](https://img.shields.io/badge/-YouTube-EA3223?style=for-the-badge&logo=youtube&logoColor=white)](https://www.youtube.com/waterydesert)
[![Twitter Badge](https://img.shields.io/badge/-Twitter-198CD8?style=for-the-badge&logo=twitter&logoColor=white)](https://twitter.com/watery_desert)
[![Patreon Badge](https://img.shields.io/badge/-Patreon-FF424D?style=for-the-badge&logo=patreon&logoColor=white)](https://www.patreon.com/watery_desert)
[![pub package](https://img.shields.io/pub/v/loading_animation_widget.svg?style=for-the-badge)](https://pub.dev/packages/loading_animation_widget)
[![WateryDesert](https://img.shields.io/badge/WateryDesert-Website-F8D977?style=for-the-badge)](https://waterydesert.com)
</div>

<hr>

## How to use

#### Installation

Add `loading_animation_widget:` to your `pubspec.yaml` dependencies then run `flutter pub get`

```yaml
 dependencies:
  loading_animation_widget:
```
#### Import
Add this line to import the package.

```dart 
import 'package:loading_animation_widget/loading_animation_widget.dart';
```
\
All loading animation APIs are same straight forward. There is a static method for each animation inside `LoadingAnimationWidget` class, which returns the Object of that animation. Both `size` and `color` are required some animations need more than one color.

Loading animation with one `color`
```dart
Scaffold(
    body: Center(
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: Colors.white,
        size: 200,
      ),
    ),
```              

Loading animation with more than one color. You have to provide both required colors.
```dart
Scaffold(
    body: Center(
        child: LoadingAnimationWidget.twistingDots(
          leftDotColor: const Color(0xFF1A1A3F),
          rightDotColor: const Color(0xFFEA3799),
          size: 200,
        ),
      ),
```       

## Screen recordings with design credits


<table>
   <tr>
      <td align="center">
         <p>waveDots</p>
         <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/waveDots.gif"  width="200"/>
      </td>
      <td align="center">
         <p>inkDrop</p>
         <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/inkDrop.gif"  width="200"/>
      </td>
      <td align="center">
         <p>twistingDots</p>
         <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/twistingDots.gif"  width="200"/>
      </td>
      <td align="center">
         <p>threeRotatingDots</p>
         <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/threeRotatingDots.gif"  width="200"/>
      </td>
   </tr>
   <td align="center">
      <p>staggeredDotsWave</p>
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/staggeredDotsWave.gif"  width="200"/>
   </td>
   <td align="center">
      <p>fourRotatingDots</p>
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/fourRotatingDots.gif"  width="200"/>
   </td>
   <td align="center">
      <p>fallingDot</p>
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/fallingDot.gif"  width="200"/>
   </td>
   <td align="center">
      <p>progressiveDots</p>
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/progressiveDots.gif"  width="200"/>
   </td>
   </tr>
   <td align="center">
      <p>discreteCircular</p>
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/discreteCircular.gif"  width="200"/>
   </td>
   <td align="center">
      <p>threeArchedCircle</p>
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/threeArchedCircle.gif"  width="200"/>
   </td>
   <td align="center">
      <p>bouncingBall</p>
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/bouncingBall.gif"  width="200"/>
   </td>
   <td align="center">
      <p>flickr</p>
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/flickr.gif"  width="200"/>
   </td>
   </tr>
   <td align="center">
      <p>hexagonDots</p>
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/hexagonDots.gif"  width="200"/>
   </td>
   <td align="center">
      <p>beat</p>
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/beat.gif"  width="200"/>
   </td>
   <td align="center">
      <p>twoRotatingArc</p>
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/twoRotatingArc.gif"  width="200"/>
   </td>
   <td align="center">
      <p>horizontalRotatingDots</p>
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/horizontalRotatingDots.gif"  width="200"/>
   </td>
   </tr>
   <td align="center">
      <p>newtonCradle</p>
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/newtonCradle.gif"  width="200"/>
   </td>
   <td align="center">
      <p>stretchedDots</p>
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/stretchedDots.gif"  width="200"/>
   </td>
   <td align="center">
      <p>halfTriangleDot</p>
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/halfTriangleDot.gif"  width="200"/>
   </td>
   <td align="center">
      <p>dotsTriangle</p>
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/dotsTriangle.gif"  width="200"/>
   </td>
   </tr>
</table>

<br>
<details>
   <summary>All flutter packages</summary>
   <br>

   ● [Sliding Clipped Nav Bar](https://github.com/watery-desert/sliding_clipped_nav_bar)\
   ● [Water Drop Nav Bar](https://github.com/watery-desert/water_drop_nav_bar)\
   ● [Swipeable Tile](https://github.com/watery-desert/swipeable_tile)\
   ➜ [Loading Animation Widget](https://github.com/watery-desert/loading_animation_widget)
   </summary> 
</details>
<br>

