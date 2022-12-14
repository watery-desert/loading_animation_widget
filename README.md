<p align="center">
   <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/package_cover.png" alt="Loading Animation Widget" />
</p>

<div align="center">

[![YouTube Badge](https://img.shields.io/badge/-YouTube-EA3223?style=for-the-badge&logo=youtube&logoColor=white)](https://www.youtube.com/waterydesert)
[![Mastodon Badge](https://img.shields.io/badge/-Mastodon-6169F6?style=for-the-badge&logo=mastodon&logoColor=white)](https://mastodon.social/@watery_desert)
[![Patreon Badge](https://img.shields.io/badge/-Patreon-FF424D?style=for-the-badge&logo=patreon&logoColor=white)](https://www.patreon.com/watery_desert)
[![BMC Badge](https://img.shields.io/badge/-Buy_Me_a_Coffee-FFDD00?style=for-the-badge&logo=buymeacoffee&logoColor=535353)](https://www.buymeacoffee.com/watery_desert)
[![pub package](https://img.shields.io/pub/v/loading_animation_widget.svg?style=for-the-badge)](https://pub.dev/packages/loading_animation_widget)
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
      child: LoadingAnimationWidget.staggeredDotWave(
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
         <a href="https://dribbble.com/shots/3967147-">waveDots</a>
         <br>
         <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/waveDots.gif"  width="200"/>
      </td>
      <td align="center">
         <a href="https://dribbble.com/shots/13966332-Spinner">inkDrop</a>
         <br>
         <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/inkDrop.gif"  width="200"/>
      </td>
      <td align="center">
         <a href="https://dribbble.com/shots/3308544-Preloader-IV">twistingDots</a>
         <br>
         <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/twistingDots.gif"  width="200"/>
      </td>
      <td align="center">
         <a href="https://ui8.net/luciyamaji/products/50-animated-loaders?rel=pro21">threeRotatingDots</a>
         <br> 
         <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/threeRotatingDots.gif"  width="200"/>
      </td>
   </tr>
   <td align="center">
      <a href="https://dribbble.com/shots/6727060-Wave-Loader">staggeredDotsWave</a>
      <br> 
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/staggeredDotsWave.gif"  width="200"/>
   </td>
   <td align="center">
      <a href="https://codepen.io/rbv912/pen/dYbqLQ?editors=0100">fourRotatingDots</a>
      <br> 
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/fourRotatingDots.gif"  width="200"/>
   </td>
   <td align="center">
      <a href="https://codepen.io/rbv912/pen/dYbqLQ?editors=0100">fallingDot</a>
      <br> 
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/fallingDot.gif"  width="200"/>
   </td>
   <td align="center">
      <a href="https://dribbble.com/shots/5790156-Focus-Reactive">progressiveDots</a>
      <br> 
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/progressiveDots.gif"  width="200"/>
   </td>
   </tr>
   <td align="center">
      <a href="https://dribbble.com/shots/7888464-Spinner">discreteCircular</a>
      <br> 
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/discreteCircular.gif"  width="200"/>
   </td>
   <td align="center">
      <a href="https://dribbble.com/shots/5095383-Loader-Animation">threeArchedCircle</a>
      <br> 
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/threeArchedCircle.gif"  width="200"/>
   </td>
   <td align="center">
      <a href="https://dribbble.com/shots/2379959-Bouncy-Ball">bouncingBall</a>
      <br> 
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/bouncingBall.gif"  width="200"/>
   </td>
   <td align="center">
      <a href="https://dribbble.com/shots/7498067-Loaders-Vol3-Colors">flickr</a>
      <br> 
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/flickr.gif"  width="200"/>
   </td>
   </tr>
   <td align="center">
      <a href="https://dribbble.com/shots/11962729-Healio-Emotion-Tracker-Apple-Watch">hexagonDots</a>
      <br> 
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/hexagonDots.gif"  width="200"/>
   </td>
   <td align="center">
      <a href="https://www.behance.net/gallery/58535057/Loader">beat</a>
      <br> 
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/beat.gif"  width="200"/>
   </td>
   <td align="center">
      <a href="https://dribbble.com/shots/2050032-Elemental-Loader">twoRotatingArc</a>
      <br> 
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/twoRotatingArc.gif"  width="200"/>
   </td>
   <td align="center">
      <a href="https://ui8.net/luciyamaji/products/50-animated-loaders?rel=pro21">horizontalRotatingDots</a>
      <br> 
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/horizontalRotatingDots.gif"  width="200"/>
   </td>
   </tr>
   <td align="center">
      <a href="https://dribbble.com/shots/2968029-Newton-Cradle-preloader-principle-freebie">newtonCradle</a>
      <br> 
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/newtonCradle.gif"  width="200"/>
   </td>
   <td align="center">
      <a href="https://dribbble.com/shots/9109441-Flat-Loaders">stretchedDots</a>
      <br> 
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/stretchedDots.gif"  width="200"/>
   </td>
   <td align="center">
      <a href="https://dribbble.com/shots/5878367-Loaders">halfTriangleDot</a>
      <br> 
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/halfTriangleDot.gif"  width="200"/>
   </td>
   <td align="center">
      <a href="https://dribbble.com/shots/2689200-Loading">dotsTriangle</a>
      <br> 
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

