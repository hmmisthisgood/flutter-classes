import 'package:flutter/material.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({Key? key}) : super(key: key);

  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  int currentIndex = 0;

  List items = [Icons.home, Icons.search, Icons.person];

  final pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// Icon()= Widget
    ///  Icons.home= IconData
    /// IconButton= Clickable icon widget

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            currentIndex = index;
            setState(() {});
            pageController.animateToPage(index,
                duration: Duration(milliseconds: 400), curve: Curves.easeIn);
          },
          items: List.generate(
            3,
            (index) {
              return BottomNavigationBarItem(
                icon: Icon(
                  items[index],
                  color: index == currentIndex ? Colors.blue : Colors.grey,
                ),
                label: "home",
              );
            },
          )),
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Container(
            child: Center(child: Text("homepage")),
          ),
          Container(
            child: Center(child: Text("Search page")),
          ),
          Container(
            child: Center(child: Text("Profile page")),
          )
        ],
      ),
    );
  }
}
