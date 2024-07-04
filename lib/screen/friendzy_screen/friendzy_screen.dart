import 'package:flutter/material.dart';
import 'package:stories_for_flutter/stories_for_flutter.dart';

import '../../constant/constant.dart';
import '../../widget/travel_card.dart';


const double borderRadius = 15.0;

class FriendzyScreen extends StatefulWidget {
  const FriendzyScreen({super.key});
  @override
  _FriendzyScreenState createState() => _FriendzyScreenState();
}

class _FriendzyScreenState extends State<FriendzyScreen>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int activePageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Friendzy",
            style: TextStyle(fontWeight: FontWeight.bold, color: themeColor1),
          ),
          actions: [
            Container(
                margin: const EdgeInsets.only(right: 5),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: themeColor1)),
                child: const Icon(
                  Icons.notification_add_outlined,
                  color: themeColor1,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stories(
                highLightColor: themeColor1,
                displayProgress: true,
                storyItemList: [
                  // First group of stories
                  StoryItem(
                      name: "My Story",
                      thumbnail: NetworkImage(
                          "https://a.storyblok.com/f/191576/1200x800/215e59568f/round_profil_picture_after_.webp"),
                      stories: [story]),
                  // Second story group
                  StoryItem(
                    name: "Alina",
                    thumbnail: NetworkImage(
                      "https://www.mockofun.com/wp-content/uploads/2019/12/circle-photo.jpg",
                    ),
                    stories: [story],
                  ),
                  StoryItem(
                    name: "Selena",
                    thumbnail: NetworkImage(
                      "https://www.mockofun.com/wp-content/uploads/2019/12/circle-profile-pic.jpg",
                    ),
                    stories: [story],
                  ),
                  StoryItem(
                    name: "Amber",
                    thumbnail: NetworkImage(
                      "https://www.pikpng.com/pngl/b/355-3555383_circle-profile-picture-clipart.png",
                    ),
                    stories: [story],
                  ),
                  StoryItem(
                    name: "July",
                    thumbnail: NetworkImage(
                      "https://www.pngitem.com/pimgs/m/348-3481514_circle-profile-girl-hd-png-download.png",
                    ),
                    stories: [story],
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: _menuBar(context),
                      ),
                      Expanded(
                        flex: 2,
                        child: PageView(
                          controller: _pageController,
                          physics: const ClampingScrollPhysics(),
                          onPageChanged: (int i) {
                            FocusScope.of(context).requestFocus(FocusNode());
                            setState(() {
                              activePageIndex = i;
                            });
                          },
                          children: <Widget>[
                            SingleChildScrollView(child: Column(children: List.generate(5, (index)=>TravelCard(width: width, title: '', body: '',)).toList(),)),
                            ConstrainedBox(
                              constraints: const BoxConstraints.expand(),
                              child: const Center(
                                child: Text("Search Partners"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _menuBar(BuildContext context) {
    return Container(
      width: 300.0,
      height: 50.0,
      decoration: const BoxDecoration(
        color: themeColor2,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              onTap: _onPlaceBidButtonPress,
              child: Container(
                margin: const EdgeInsets.all(7),
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                decoration: (activePageIndex == 0)
                    ? const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.all(Radius.circular(borderRadius)),
                      )
                    : null,
                child: const Text("Make Friends",
                    style: TextStyle(
                        color: themeColor1, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              borderRadius:
                  const BorderRadius.all(Radius.circular(borderRadius)),
              onTap: _onBuyNowButtonPress,
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(7),
                alignment: Alignment.center,
                decoration: (activePageIndex == 1)
                    ? const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(borderRadius),
                        ),
                      )
                    : null,
                child: const Text(
                  "Search Partners",
                  style: TextStyle(
                      color: themeColor1, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onPlaceBidButtonPress() {
    _pageController.animateToPage(0,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onBuyNowButtonPress() {
    _pageController.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }
}
