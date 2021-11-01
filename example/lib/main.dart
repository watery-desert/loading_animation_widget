import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

const Color _kAppColor = Color(0xFFFDDE6F);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          canvasColor: _kAppColor,
          snackBarTheme: SnackBarThemeData(
              backgroundColor: Colors.brown,
              contentTextStyle: TextStyle(
                fontSize: 20,
              ))),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  void _onTapNext() {
    if (_currentPage + 1 < listOfAnimations.length) {
      _pageController.jumpToPage(_currentPage + 1);
      setState(() {
        _currentPage++;
      });
    } else {
      _pageController.animateToPage(
        0,
        duration: const Duration(milliseconds: 800),
        curve: Curves.ease,
      );
      setState(() {
        _currentPage = 0;
      });
    }
  }

  void _onTapPrevious() {
    if (_currentPage == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'There is nothing left LOL 🌚🤣',
          ),
        ),
      );
    } else {
      _pageController.jumpToPage(_currentPage - 1);
      setState(() {
        _currentPage--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: _pageController,
      children: listOfAnimations
          .map(
            (appBody) => Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SafeArea(
                    bottom: false,
                    child: Text(
                      appBody.title,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: appBody.widget,
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.chevron_left_rounded,
                        ),
                        onPressed: _onTapPrevious,
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.chevron_right_rounded,
                        ),
                        onPressed: _onTapNext,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class AppBody {
  final String title;
  final Widget widget;
  AppBody(
    this.title,
    this.widget,
  );
}

final listOfAnimations = <AppBody>[
  AppBody(
    'Initial',
    Text('Initial'),
  ),
  AppBody(
    'beat',
    LoadingAnimationWidget.dotsInOut(
      color: Colors.white,
      size: 100,
    ),
  ),
  AppBody(
    'beat',
    LoadingAnimationWidget.beat(
      color: Colors.white,
      size: 100,
    ),
  ),
  AppBody(
    'discrete circle',
    LoadingAnimationWidget.discreteCircle(
      color: Colors.white,
      size: 100,
    ),
  ),
  AppBody(
    'discrete circle',
    LoadingAnimationWidget.elementalLoader(
      color: Colors.white,
      size: 200,
    ),
  ),
  AppBody(
    'discrete circle',
    LoadingAnimationWidget.flickr(
      colors: [
        Color(0xFF0063DC),
        Color(0xFFFF0084),
      ],
      size: 200,
    ),
  ),
  AppBody(
    'discrete circle',
    LoadingAnimationWidget.hexagonDots(
      color: Colors.red,
      size: 200,
    ),
  ),
  AppBody(
    'discrete circle',
    LoadingAnimationWidget.horizontalDotsRotation(
      color: Colors.red,
      size: 200,
    ),
  ),
  AppBody(
    'discrete circle',
    LoadingAnimationWidget.inkDrop(
      color: Colors.red,
      size: 200,
    ),
  ),
  AppBody(
    'discrete circle',
    LoadingAnimationWidget.newtonCradle(
      color: Colors.red,
      size: 200,
    ),
  ),
  AppBody(
    'discrete circle',
    LoadingAnimationWidget.preloader(
      colors: [Colors.red, Colors.blue],
      size: 200,
    ),
  ),
  AppBody(
    'discrete circle',
    LoadingAnimationWidget.staggeredDotWave(
      color: Colors.red,
      size: 200,
    ),
  ),
  AppBody(
    'discrete circle',
    LoadingAnimationWidget.stretchedDots(
      color: Colors.red,
      size: 200,
    ),
  ),
  AppBody(
    'discrete circle',
    LoadingAnimationWidget.halfTringleDot(
      color: Colors.red,
      size: 200,
    ),
  ),
  AppBody(
    'discrete circle',
    LoadingAnimationWidget.dotsTriangle(
      color: Colors.red,
      size: 200,
    ),
  ),
  AppBody(
    'discrete circle',
    LoadingAnimationWidget.wavingDots(
      color: Colors.red,
      size: 200,
    ),
  ),
];
