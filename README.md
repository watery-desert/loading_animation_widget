<p align="center">
   <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/package_cover.png" alt="Loading Animation Widget" />
</p>
<!-- <div align="center">
   <a href="https://instagram.com/watery_desert">
   <img src="https://raw.githubusercontent.com/watery-desert/assets/main/social_logo/instagram.png" height="32" alt="instagram: watery_desert"></a>
   <a href="https://twitter.com/watery_desert">
   <img src="https://raw.githubusercontent.com/watery-desert/assets/main/social_logo/twitter.png" height="32" alt="twitter: watery_desert"></a>
   <a href="https://www.youtube.com/channel/UCMr8V70B4402CNOJEYQ30Qg">
   <img src="https://raw.githubusercontent.com/watery-desert/assets/main/social_logo/youtube.png" height="32" alt="youtube: watery_desert"></a>
</div>
<br> -->

<div align="center">

[![Instagram Badge](https://img.shields.io/badge/-watery_desert-e84393?style=for-the-badge&labelColor=e84393&logo=instagram&logoColor=white)](https://instagram.com/watery_desert)
[![Twitter Badge](https://img.shields.io/badge/-watery_desert-1ca0f1?style=for-the-badge&logo=twitter&logoColor=white&link=https://twitter.com/watery_desert)](https://twitter.com/watery_desert)
[![YouTube Badge](https://img.shields.io/badge/-watery_desert-EA3223?style=for-the-badge&labelColor=EA3223&logo=youtube&logoColor=white)](https://youtube.com/watery_desert)
[![pub package](https://img.shields.io/pub/v/loading_animation_widget.svg?style=for-the-badge)](https://pub.dev/packages/loading_animation_widget)
</div>



## **How to use**

Add `loading_animation_widget:` to your `pubspec.yaml` dependencies then run `flutter pub get`

```yaml
 dependencies:
  loading_animation_widget:
```
Then import the package to use

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
      <a href="https://dribbble.com/shots/5878367-Loaders">halfTringleDot</a>
      <br> 
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/halfTringleDot.gif"  width="200"/>
   </td>
   <td align="center">
      <a href="https://dribbble.com/shots/2689200-Loading">dotTrangle</a>
      <br> 
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/dotTrangle.gif"  width="200"/>
   </td>
   </tr>
</table>

<br>
<details>
   <summary> All package list</summary>
   <br>

   ● [Sliding Clipped Nav Bar](https://github.com/watery-desert/sliding_clipped_nav_bar)\
   ● [Water Drop Nav Bar](https://github.com/watery-desert/water_drop_nav_bar)\
   ● [Swipeable Tile](https://github.com/watery-desert/swipeable_tile)\
   ➜ [Loading Animation Widget](https://github.com/watery-desert/loading_animation_widget)
   </summary> 
</details>
<br>

