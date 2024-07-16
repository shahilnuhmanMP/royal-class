import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:royal_class_app/app_theme.dart';

class BottomNavigation extends StatelessWidget {
  final String activeIcon;
  BottomNavigation({Key? key, this.activeIcon = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: colors(context).shadowColor!,
                  spreadRadius: 15,
                  blurRadius: 10,
                  offset: Offset(0, 10), // Shadow position, bottom
                ),
              ],
            ),
            child: Image.asset(
              "assets/images/bottom.png",
              fit: BoxFit.fitWidth,
            )),
        Container(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavigationIcon(
                iconLabel: "cycle",
                iconData: "assets/images/cycle.png",
                isActive: activeIcon == "cycle",
                onTap: () {
                  HapticFeedback.lightImpact();
                  // Navigator.pushAndRemoveUntil(
                  //     context, HomeScreenPage.route(), (route) => false);
                },
              ),
              BottomNavigationIcon(
                iconLabel: "map",
                iconData: "assets/images/map.png",
                isActive: activeIcon == "map",
                onTap: () {
                  HapticFeedback.lightImpact();
                  // Navigator.pushAndRemoveUntil(
                  //     context, HomeScreenPage.route(), (route) => false);
                },
              ),
              BottomNavigationIcon(
                iconLabel: "cart",
                iconData: "assets/images/cart.png",
                isActive: activeIcon == "map",
                onTap: () {
                  HapticFeedback.lightImpact();
                  // Navigator.pushAndRemoveUntil(
                  //     context, HomeScreenPage.route(), (route) => false);
                },
              ),
              BottomNavigationIcon(
                iconLabel: "person",
                iconData: "assets/images/person.png",
                isActive: activeIcon == "person",
                onTap: () {
                  HapticFeedback.lightImpact();
                  // Navigator.pushAndRemoveUntil(
                  //     context, OffersPage.route(), (route) => false);
                },
              ),
              Consumer(builder: (context, ref, child) {
                return BottomNavigationIcon(
                  iconLabel: "doc",
                  iconData: "assets/images/doc.png",
                  isActive: activeIcon == "doc",
                  onTap: () {
                    // Navigator.pushAndRemoveUntil(
                    //     context, SettingPage.route(), (route) => false);
                  },
                );
              }),
            ],
          ),
        ),
        Container(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: 70,
                  height: 60,
                  child: activeIcon == "cycle"
                      ? Stack(
                          children: [
                            Image.asset("assets/images/active.png"),
                            Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/images/cycle.png",
                                height: 20,
                              ),
                            )
                          ],
                        )
                      : Container()),
              Container(
                  width: 70,
                  height: 60,
                  child: activeIcon == "1"
                      ? Stack(
                          children: [
                            Image.asset("assets/images/active.png"),
                            Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/images/cycle.png",
                                height: 20,
                              ),
                            )
                          ],
                        )
                      : Container()),
              Container(
                  width: 70,
                  height: 60,
                  child: activeIcon == "1"
                      ? Stack(
                          children: [
                            Image.asset("assets/images/active.png"),
                            Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/images/cycle.png",
                                height: 20,
                              ),
                            )
                          ],
                        )
                      : Container()),
              Container(
                  width: 70,
                  height: 60,
                  child: activeIcon == "1"
                      ? Stack(
                          children: [
                            Image.asset("assets/images/active.png"),
                            Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/images/cycle.png",
                                height: 20,
                              ),
                            )
                          ],
                        )
                      : Container()),
              Container(
                  width: 70,
                  height: 60,
                  child: activeIcon == "1"
                      ? Stack(
                          children: [
                            Image.asset("assets/images/active.png"),
                            Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/images/cycle.png",
                                height: 20,
                              ),
                            )
                          ],
                        )
                      : Container()),
            ],
          ),
        )
      ],
    );
  }
}

class BottomNavigationIcon extends StatelessWidget {
  final String iconLabel;
  final String iconData;
  final bool isActive;
  final Function() onTap;

  const BottomNavigationIcon(
      {Key? key,
      required this.iconData,
      required this.iconLabel,
      required this.isActive,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: SizedBox(
        height: 68,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconData,
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
