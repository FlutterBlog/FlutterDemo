import 'package:flutter/material.dart';

// 实现一个简单的引导页
class FTGuidePage extends StatefulWidget {
  @override
  _FTGuidePageState createState() => _FTGuidePageState();
}

class _FTGuidePageState extends State<FTGuidePage> {
  int _pageIndex = 0;
  PageController _pageController = PageController();
  GlobalKey<_FTGuidePageState> _pageIndicatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          _buildPageView(),
          _buildPageIndicator(),
        ],
      ),
    ));
  }

  Widget _buildPageView() {
    return PageView(
      controller: _pageController,
      onPageChanged: (pageIndex) {
        setState(() {
          _pageIndex = pageIndex;
          print(pageIndex);
          print(_pageController.page);
        });
      },
      children: <Widget>[
        Container(
          color: Colors.grey[100],
          child: Center(
            child: Text(
              'Guide Page 11',
              style: TextStyle(
                fontSize: 26.0,
                color: Colors.blue,
              ),
            ),
          ),
        ),
        Container(
          color: Colors.grey[100],
          child: Center(
            child: Text(
              'Guide Page 22',
              style: TextStyle(
                fontSize: 26.0,
                color: Colors.blue,
              ),
            ),
          ),
        ),
        Container(
          color: Colors.grey[100],
          child: Center(
            child: RaisedButton(
              child: Text(
                "完成",
                style: TextStyle(
                  fontSize: 26.0,
                  color: Colors.blue,
                ),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, "TabBarHome");
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPageIndicator() {
    return Opacity(
      opacity: 0.7,
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(bottom: 60),
          height: 40,
          width: 80,
          padding: EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: Colors.blue[300],
            borderRadius: BorderRadius.all(const Radius.circular(6.0)),
          ),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTapUp: (detail) => _handlePageIndicatorTap(detail),
            child: Row(
              key: _pageIndicatorKey,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _dotWidget(0),
                _dotWidget(1),
                _dotWidget(2),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _dotWidget(int index) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: (_pageIndex == index) ? Colors.white : Colors.blue[100],
      ),
    );
  }

  _handlePageIndicatorTap(TapUpDetails detail) {
    RenderBox renderBox = _pageIndicatorKey.currentContext.findRenderObject();
    Size widgeSize = renderBox.paintBounds.size;
    Offset tapOffset = renderBox.globalToLocal(detail.globalPosition);

    if (tapOffset.dx > widgeSize.width / 2) {
      _scrollToNextPage();
    } else {
      _scrollToPreviousPage();
    }
  }

  _scrollToPreviousPage() {
    if (_pageIndex > 0) {
      _pageController.animateToPage(_pageIndex - 1,
          duration: const Duration(milliseconds: 200), curve: Curves.ease);
    }
  }

  _scrollToNextPage() {
    if (_pageIndex < 2) {
      _pageController.animateToPage(_pageIndex + 1,
          duration: const Duration(milliseconds: 200), curve: Curves.ease);
    } else {
      // 完成

    }
  }
}
