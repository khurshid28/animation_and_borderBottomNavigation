import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimatedTabbar extends StatefulWidget {
  const AnimatedTabbar({Key? key}) : super(key: key);

  @override
  State<AnimatedTabbar> createState() => _AnimatedTabbarState();
}

class _AnimatedTabbarState extends State<AnimatedTabbar>
    with TickerProviderStateMixin {
  int selectIndex = 2;
  AnimationController? _animation;
  @override
  void initState() {
    _animation = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 400,
      ),
      upperBound: 2,
      lowerBound: -2,
      value: 0,
    );
    _animation!.addListener(() {});
    // _animation!.dispose();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
          child: Container(),
        ),
        bottomNavigationBar: AnimatedBuilder(
            animation: _animation!,
            builder: (context, child) {
              List listEelements = [
                "assets/3.svg",
                "assets/5.svg",
                "assets/1.svg",
                "assets/2.svg",
                "assets/4.svg",
              ];
              return Container(
                // color: Colors.red,
                width: size.width,
                height: 120,
                child: Stack(
                  children: [
                    Positioned(
                      top: 3,
                      left: size.width / 2 - 35,
                      child: Transform.rotate(
                        angle: _animation!.value * pi / 14,
                        child: Container(
                            width: 70,
                            height: 820,
                            alignment: Alignment.topCenter,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.elliptical(
                                  410,80
                                ),
                                topRight:Radius.elliptical(
                                  410,80
                                ),
                              ),
                            ),
                            child: Container()),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: size.width / 2 - 400,
                      child: Transform.rotate(
                        angle: -1 * pi / 7,
                        child: Container(
                          width: 800,
                          height: 800,
                          padding: EdgeInsets.all(selectIndex == 0 ? 15 : 20),
                          alignment: Alignment.topCenter,
                          decoration: const BoxDecoration(
                            color: Colors.lightBlueAccent,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                400,
                              ),
                            ),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              selectIndex = 0;
                              final duration = Duration(
                                milliseconds:
                                    ((selectIndex - 2 - _animation!.value)
                                                .abs() *
                                            100)
                                        .toInt(),
                              );
                              if (_animation!.value > (selectIndex - 2)) {
                                _animation = AnimationController(
                                    vsync: this,
                                    duration: duration,
                                    upperBound: _animation!.value,
                                    lowerBound: selectIndex - 2)
                                  ..reverse();
                              }
                              setState(() {});
                            },
                            child: SvgPicture.asset(
                              listEelements[0],
                              width: selectIndex == 0 ? 50 : 40,
                              height: selectIndex == 0 ? 50 : 40,
                              // colorBlendMode: BlendMode.src,
                              //  theme: SvgTheme(currentColor: Colors.red),
                              color:
                                  selectIndex == 0 ? Colors.black : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: size.width / 2 - 40,
                      child: Transform.rotate(
                        angle: -1 * pi / 14,
                        child: Container(
                          width: 80,
                          height: 800,
                          padding: EdgeInsets.all(selectIndex == 1 ? 15 : 20),
                          alignment: Alignment.topCenter,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                400,
                              ),
                            ),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              selectIndex = 1;
                              final duration = Duration(
                                milliseconds:
                                    ((selectIndex - 2 - _animation!.value)
                                                .abs() *
                                            100)
                                        .toInt(),
                              );
                              if (_animation!.value > (selectIndex - 2)) {
                                _animation = AnimationController(
                                  vsync: this,
                                  duration: duration,
                                  upperBound: _animation!.value,
                                  lowerBound: selectIndex - 2,
                                )..reverse();
                              } else if (_animation!.value <
                                  (selectIndex - 2)) {
                                _animation = AnimationController(
                                  vsync: this,
                                  duration: duration,
                                  upperBound: selectIndex - 2,
                                  lowerBound: _animation!.value,
                                )..forward();
                              }
                              setState(() {});
                            },
                            child: SvgPicture.asset(
                              listEelements[1],
                              width: selectIndex == 1 ? 50 : 40,
                              height: selectIndex == 1 ? 50 : 40,
                              color:
                                  selectIndex == 1 ? Colors.black : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: size.width / 2 - 40,
                      child: Transform.rotate(
                        angle: 0,
                        child: Container(
                          width: 80,
                          height: 800,
                          padding: EdgeInsets.all(selectIndex == 2 ? 15 : 20),
                          alignment: Alignment.topCenter,
                          decoration: const BoxDecoration(
                            // color: Colors.green,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                400,
                              ),
                            ),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              // _animation!.forward();
                              selectIndex = 2;
                              final duration = Duration(
                                milliseconds:
                                    ((selectIndex - 2 - _animation!.value)
                                                .abs() *
                                            100)
                                        .toInt(),
                              );
                              if (_animation!.value > (selectIndex - 2)) {
                                _animation = AnimationController(
                                  vsync: this,
                                  duration: duration,
                                  upperBound: _animation!.value,
                                  lowerBound: selectIndex - 2,
                                )..reverse();
                              } else if (_animation!.value <
                                  (selectIndex - 2)) {
                                _animation = AnimationController(
                                  vsync: this,
                                  duration: duration,
                                  upperBound: selectIndex - 2,
                                  lowerBound: _animation!.value,
                                )..forward();
                              }
                              setState(() {});
                            },
                            child: SvgPicture.asset(
                              listEelements[2],
                              width: selectIndex == 2 ? 50 : 40,
                              height: selectIndex == 2 ? 50 : 40,
                              color:
                                  selectIndex == 2 ? Colors.black : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: size.width / 2 - 40,
                      child: Transform.rotate(
                        angle: pi / 14,
                        child: GestureDetector(
                          child: Container(
                            width: 80,
                            height: 800,
                            padding: EdgeInsets.all(selectIndex == 3 ? 15 : 20),
                            alignment: Alignment.topCenter,
                            decoration: const BoxDecoration(
                              // color: Colors.green,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  400,
                                ),
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                selectIndex = 3;
                                final duration = Duration(
                                  milliseconds:
                                      ((selectIndex - 2 - _animation!.value)
                                                  .abs() *
                                              100)
                                          .toInt(),
                                );

                                if (_animation!.value > (selectIndex - 2)) {
                                  _animation = AnimationController(
                                    vsync: this,
                                    duration: duration,
                                    upperBound: _animation!.value,
                                    lowerBound: selectIndex - 2,
                                  )..reverse();
                                } else if (_animation!.value <
                                    (selectIndex - 2)) {
                                  _animation = AnimationController(
                                    vsync: this,
                                    duration: duration,
                                    upperBound: selectIndex - 2,
                                    lowerBound: _animation!.value,
                                  )..forward();
                                }

                                setState(() {});
                              },
                              child: SvgPicture.asset(
                                listEelements[3],
                                width: selectIndex == 3 ? 50 : 40,
                                height: selectIndex == 3 ? 50 : 40,
                                color: selectIndex == 3
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: size.width / 2 - 40,
                      child: Transform.rotate(
                        angle: pi / 7,
                        child: GestureDetector(
                          // onPanUpdate: (details) {
                          //   print(details.delta.dx);
                          //   print(details.delta.dy);
                          // },
                          child: Container(
                            width: 80,
                            height: 800,
                            padding: EdgeInsets.all(selectIndex == 4 ? 15 : 20),
                            alignment: Alignment.topCenter,
                            decoration: const BoxDecoration(
                              // color: Colors.green,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  400,
                                ),
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                selectIndex = 4;
                                final duration = Duration(
                                  milliseconds:
                                      ((selectIndex - 2 - _animation!.value)
                                                  .abs() *
                                              100)
                                          .toInt(),
                                );

                                if (_animation!.value > (selectIndex - 2)) {
                                  _animation = AnimationController(
                                    vsync: this,
                                    duration: duration,
                                    upperBound: _animation!.value,
                                    lowerBound: selectIndex - 2,
                                  )..reverse();
                                }
                                if (_animation!.value < (selectIndex - 2)) {
                                  _animation = AnimationController(
                                    vsync: this,
                                    duration: duration,
                                    upperBound: selectIndex - 2,
                                    lowerBound: _animation!.value,
                                  )..forward();
                                }
                                setState(() {});
                              },
                              child: SvgPicture.asset(
                                listEelements[4],
                                width: selectIndex == 4 ? 50 : 40,
                                height: selectIndex == 4 ? 50 : 40,
                                color: selectIndex == 4
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
