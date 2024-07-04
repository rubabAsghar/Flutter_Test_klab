
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';

import '../../constant/constant.dart';
import '../friendzy_screen/friendzy_screen.dart';


class NavBarScreen extends StatefulWidget {
  const NavBarScreen({Key? key,});

  @override
  _NavBarScreenState createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;


  @override
  void initState() {
    currentPage = 0;
    tabController = TabController(length: 5, vsync: this);
    tabController.animation!.addListener(
          () {
        final value = tabController.animation!.value.round();
        if (value != currentPage && mounted) {
          changePage(value);
        }
      },
    );
    super.initState();
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BottomBar(
          iconHeight:40 ,
          iconWidth: 40,

          fit: StackFit.expand,
          icon: (width, height) => Center(
            child: IconButton(
              padding:EdgeInsets.all(8),
              onPressed: null,
              icon: Icon(
                Icons.arrow_upward_rounded,
                color: themeColor2,
                size: width,
              ),
            ),
          ),
          borderRadius: BorderRadius.circular(500),
          duration: Duration(seconds: 1),
          curve: Curves.decelerate,
          showIcon: true,
          width: MediaQuery.of(context).size.width * 0.8,
          barColor:  Colors.white,
          body: (context, controller) => TabBarView(
            controller: tabController,
            children: [
              FriendzyScreen(),
              FriendzyScreen(),
              FriendzyScreen(),
              FriendzyScreen(),
              FriendzyScreen(),
            ],
          ),
          child: TabBar(
            indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
            controller: tabController,
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide.none,
                insets: EdgeInsets.fromLTRB(16, 0, 16, 8)),
            tabs: [
              CircleAvatar(
                  radius: 30,
                  backgroundColor:  currentPage == 0 ? themeColor1 : Colors.white,
                  child: Icon(
                    size: 20,
                    Icons.home,
                    color: currentPage == 0 ? Colors.white : themeColor1,
                  )),
              CircleAvatar(
                  backgroundColor:  currentPage == 1 ? themeColor1 : Colors.white,
                  child: Icon(
                    size: 20,
                    Icons.compare_arrows,
                    color: currentPage == 1 ? Colors.white : themeColor1,
                  )),
              CircleAvatar(
                  backgroundColor:  currentPage == 2 ? themeColor1 : Colors.white,
                  child: Icon(
                    size: 20,
                    Icons.add,
                    color: currentPage == 2 ? Colors.white : themeColor1,
                  )),
              CircleAvatar(

                  backgroundColor:  currentPage == 3 ? themeColor1 : Colors.white,
                  child: Icon(
                    size: 20,
                    Icons.group,
                    color: currentPage == 3 ? Colors.white : themeColor1,
                  )),
              CircleAvatar(
                  backgroundColor:  currentPage == 4 ? themeColor1 : Colors.white,
                  child: Icon(
                    size: 20,
                    Icons.messenger,
                    color: currentPage == 4? Colors.white : themeColor1,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}