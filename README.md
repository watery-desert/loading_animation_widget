<p align="center">
<img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/package_cover.png" alt="Loading Animation Widget" />
</p>

<div align="center">

<a href="https://instagram.com/watery_desert">
<img src="https://raw.githubusercontent.com/watery-desert/assets/main/social_logo/instagram.png" height="32" alt="instagram: watery_desert"></a>

<a href="https://twitter.com/watery_desert">
<img src="https://raw.githubusercontent.com/watery-desert/assets/main/social_logo/twitter.png" height="32" alt="twitter: watery_desert"></a>

<a href="https://dribbble.com/watery_desert">
<img src="https://raw.githubusercontent.com/watery-desert/assets/main/social_logo/dribbble.png" height="32" alt="dribbble: watery_desert"></a>

<a href="https://www.youtube.com/channel/UCMr8V70B4402CNOJEYQ30Qg">
<img src="https://raw.githubusercontent.com/watery-desert/assets/main/social_logo/youtube.png" height="32" alt="youtube: watery_desert"></a>
</div>
<br>

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
All loading animation APIs are same straight forward. There is a static method for each animation inside `LoadingAnimationWidget` class, which returns the Object of that animation. Both `size` and `color` are required some animations need more than one color. The optional `time` parameter is in `int` and it's in milliseconds. The default time is most suitable time but you can still change it.

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

## Design credits with screen recordings

<style>
table, th, td {
  border: 0 px solid black;
}
</style>
<table>
   <tr>
      <td align="center">
         <a href="https://dribbble.com/shots/3967147-">1. wavingDots</a>
         <br>
         <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/wavingDots.gif"  width="200"/>
      </td>
      <td align="center">
         <a href="https://dribbble.com/shots/13966332-Spinner">2. inkDrop</a>
         <br>
         <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/inkDrop.gif"  width="200"/>
      </td>
      <td align="center">
         <a href="https://dribbble.com/shots/3308544-Preloader-IV">3. twistingDots</a>
         <br>
         <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/twistingDots.gif"  width="200"/>
      </td>
      <td align="center">
         <a href="https://ui8.net/luciyamaji/products/50-animated-loaders?rel=pro21">4. threeRotatingDots</a>
         <br> 
         <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/threeRotatingDots.gif"  width="200"/>
      </td>
   </tr>
   <td align="center">
      <a href="https://dribbble.com/shots/6727060-Wave-Loader">5. staggeredDotWave</a>
      <br> 
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/staggeredDotWave.gif"  width="200"/>
   </td>
   <td align="center">
      <a href="https://codepen.io/rbv912/pen/dYbqLQ?editors=0100">6. fourRotatingDots</a>
      <br> 
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/fourRotatingDots.gif"  width="200"/>
   </td>
   <td align="center">
      <a href="https://codepen.io/rbv912/pen/dYbqLQ?editors=0100">7. fallingDot</a>
      <br> 
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/fallingDot.gif"  width="200"/>
   </td>
   <td align="center">
      <a href="https://dribbble.com/shots/5790156-Focus-Reactive">8. progressiveDots</a>
      <br> 
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/progressiveDots.gif"  width="200"/>
   </td>
   </tr>
   <td align="center">
      <a href="https://dribbble.com/shots/7888464-Spinner">9. discreteCircular</a>
      <br> 
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/discreteCircular.gif"  width="200"/>
   </td>
   <td align="center">
      <a href="https://dribbble.com/shots/5095383-Loader-Animation">10. threeArchedCircle</a>
      <br> 
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/threeArchedCircle.gif"  width="200"/>
   </td>
   <td align="center">
      <a href="https://dribbble.com/shots/2379959-Bouncy-Ball">11. bouncingBall</a>
      <br> 
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/bouncingBall.gif"  width="200"/>
   </td>
   <td align="center">
      <a href="https://dribbble.com/shots/7498067-Loaders-Vol3-Colors">12. flickr</a>
      <br> 
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/flickr.gif"  width="200"/>
   </td>
   </tr>
   <td align="center">
      <a href="https://dribbble.com/shots/11962729-Healio-Emotion-Tracker-Apple-Watch">13. hexagonDots</a>
      <br> 
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/hexagonDots.gif"  width="200"/>
   </td>
   <td align="center">
      <a href="https://www.behance.net/gallery/58535057/Loader">14. beat</a>
      <br> 
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/beat.gif"  width="200"/>
   </td>
   <td align="center">
      <a href="https://dribbble.com/shots/2050032-Elemental-Loader">15. twoRotatingArc</a>
      <br> 
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/twoRotatingArc.gif"  width="200"/>
   </td>
   <td align="center">
      <a href="https://ui8.net/luciyamaji/products/50-animated-loaders?rel=pro21">16. threeHorizontalDots</a>
      <br> 
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/threeHorizontalDots.gif"  width="200"/>
   </td>
   </tr>
   <td align="center">
      <a href="https://dribbble.com/shots/2968029-Newton-Cradle-preloader-principle-freebie">17. newtonCradle</a>
      <br> 
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/newtonCradle.gif"  width="200"/>
   </td>
   <td align="center">
      <a href="https://dribbble.com/shots/9109441-Flat-Loaders">18. stretchedDots</a>
      <br> 
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/stretchedDots.gif"  width="200"/>
   </td>
   <td align="center">
      <a href="https://dribbble.com/shots/5878367-Loaders">19. halfTringleDot</a>
      <br> 
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/halfTringleDot.gif"  width="200"/>
   </td>
   <td align="center">
      <a href="https://dribbble.com/shots/2689200-Loading">20. dotTrangle</a>
      <br> 
      <img src="https://raw.githubusercontent.com/watery-desert/assets/main/loading_animation_widget/dotTrangle.gif"  width="200"/>
   </td>
   </tr>
</table>

<br>

<details>
<summary> All package list</summary>
<br>

● [Sliding Clipped Nav Bar](https://github.com/watery-desert/sliding_clipped_nav_bar)

● [Water Drop Nav Bar](https://github.com/watery-desert/water_drop_nav_bar)

● [Swipeable Tile](https://github.com/watery-desert/swipeable_tile)

➜ [Loading Animation Widget](https://github.com/watery-desert/loading_animation_widget)
</summary> 
</details>
<br>

