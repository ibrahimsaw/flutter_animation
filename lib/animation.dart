import 'package:animated_switcher_plus/animated_switcher_plus.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

const double _kSize = 100;
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
        const SnackBar(
          content: Text(
            'There is nothing left 🌚',
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
      physics: const NeverScrollableScrollPhysics(),
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
                  style: const TextStyle(
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
                    icon: const Icon(
                      Icons.chevron_left_rounded,
                    ),
                    onPressed: _onTapPrevious,
                  ),
                  IconButton(
                    icon: const Icon(
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
    'waterydesert.com',
    const Text(
      'Total animations: 20',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18,
      ),
    ),
  ),
  AppBody(
    'waveDots',
    LoadingAnimationWidget.waveDots(
      color: Colors.black,
      size: _kSize,
    ),
  ),
  AppBody(
    'inkDrop',
    LoadingAnimationWidget.inkDrop(
      color: Colors.black,
      size: _kSize,
    ),
  ),
  AppBody(
    'twistingDots',
    LoadingAnimationWidget.twistingDots(
      leftDotColor: const Color(0xFF1A1A3F),
      rightDotColor: const Color(0xFFEA3799),
      size: _kSize,
    ),
  ),
  AppBody(
    'threeRotatingDots',
    LoadingAnimationWidget.threeRotatingDots(
      color: Colors.black,
      size: _kSize,
    ),
  ),
  AppBody(
    'staggeredDotsWave',
    LoadingAnimationWidget.staggeredDotsWave(
      color: Colors.black,
      size: _kSize,
    ),
  ),
  AppBody(
    'fourRotatingDots',
    LoadingAnimationWidget.fourRotatingDots(
      color: Colors.black,
      size: _kSize,
    ),
  ),
  AppBody(
    'fallingDot',
    LoadingAnimationWidget.fallingDot(
      color: Colors.black,
      size: _kSize,
    ),
  ),
  AppBody(
    'prograssiveDots',
    LoadingAnimationWidget.prograssiveDots(
      color: Colors.black,
      size: _kSize,
    ),
  ),
  AppBody(
    'discreteCircle',
    LoadingAnimationWidget.discreteCircle(
        color: Colors.black,
        size: _kSize,
        secondRingColor: Colors.black,
        thirdRingColor: Colors.purple),
  ),
  AppBody(
    'threeArchedCircle',
    LoadingAnimationWidget.threeArchedCircle(
      color: Colors.black,
      size: _kSize,
    ),
  ),
  AppBody(
    'bouncingBall',
    LoadingAnimationWidget.bouncingBall(
      color: Colors.black,
      size: _kSize,
    ),
  ),
  AppBody(
    'flickr',
    LoadingAnimationWidget.flickr(
      leftDotColor: const Color(0xFF0063DC),
      rightDotColor: const Color(0xFFFF0084),
      size: _kSize,
    ),
  ),
  AppBody(
    'hexagonDots',
    LoadingAnimationWidget.hexagonDots(
      color: Colors.black,
      size: _kSize,
    ),
  ),
  AppBody(
    'beat',
    LoadingAnimationWidget.beat(
      color: Colors.black,
      size: _kSize,
    ),
  ),
  AppBody(
    'twoRotatingArc',
    LoadingAnimationWidget.twoRotatingArc(
      color: Colors.black,
      size: _kSize,
    ),
  ),
  AppBody(
    'horizontalRotatingDots',
    LoadingAnimationWidget.horizontalRotatingDots(
      color: Colors.black,
      size: _kSize,
    ),
  ),
  AppBody(
    'newtonCradle',
    LoadingAnimationWidget.newtonCradle(
      color: Colors.black,
      size: 2 * _kSize,
    ),
  ),
  AppBody(
    'stretchedDots',
    LoadingAnimationWidget.stretchedDots(
      color: Colors.black,
      size: _kSize,
    ),
  ),
  AppBody(
    'halfTriangleDot',
    LoadingAnimationWidget.halfTriangleDot(
      color: Colors.black,
      size: _kSize,
    ),
  ),
  AppBody(
    'dotsTriangle',
    LoadingAnimationWidget.dotsTriangle(
      color: Colors.black,
      size: _kSize,
    ),
  ),
];



class HomesPage extends StatefulWidget {
  const HomesPage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePage> {
  bool _showFirstChild = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sample')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          AnimatedSwitcherPlus.flipY(
            duration: const Duration(milliseconds: 1000),
            child: Container(
              key: ValueKey(_showFirstChild),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color:
                _showFirstChild ? Colors.blue.shade50 : Colors.red.shade50,
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              child: Text(
                _showFirstChild ? 'Primary Text' : 'Secondary Text',
              ),
            ),
          ),
          const Spacer(),
          Center(
            child: ElevatedButton(
              onPressed: () => setState(() {
                _showFirstChild = !_showFirstChild;
              }),
              child: const Text('Animate'),
            ),
          ),
        ],
      ),
    );
  }
}