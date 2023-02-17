import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  var color = Colors.white;
  double height = 300.0.h;
  double width = 180.0.w;
  double sizeHeight = 60.0.h;
  double imgHeight = 50.h;
  double reviewHeight = 60.0.h;
  double textHeight = 32.sp;
  double productHeight = 30.h;
  double secondHeight = 32.sp;
  double titleHeight = 15.sp;
  double iconHeight = 20.h;
  double firstHeight = 100.h;
  double topLeft = 20.r;
  double topRight = 20.r;
  double topText = 20.h;
  double topHeight = 60.h;
  double belowHeight = 400.h;
  double rightMargin = 100.w;
  double listHeight = 335.h;
  double blackHeight = 100.h;
  double blackwidth = 320.w;
  double position = 180.h;
  String name = "name";
  List colors = [
    const Color(0xffa2aef8),
    const Color(0xffd0c3f7),
    const Color(0xffd5b5e9),
    const Color(0xffa2aef8),
    const Color(0xffd0c3f7),
  ];
  bool selected = false;

  DragUpdateDetails? updateVerticalDragDetails;
  DragStartDetails? startVerticalDragDetails;

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.offset >=
          _scrollController.position.maxScrollExtent) {
        setState(() {
          blackHeight = 50.h;
          blackwidth = (blackwidth / 3).w;
        });
        print("scroll detect");
      }
      if (_scrollController.offset <=
              _scrollController.position.minScrollExtent &&
          !_scrollController.position.outOfRange) {
        setState(() {
          blackHeight = 100.h;
          print("reach the top");
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // timeDilation = 10.0;
    return Scaffold(
      backgroundColor: color,
      // body: NotificationListener<ScrollNotification>(
      //   onNotification: (scrollNotification) {
      //     print('inside the onNotification');
      //     if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
      //       print('scrolled down');
      //       setState(() {
      //         color = Colors.pink;
      //         height = 300;
      //       });
      //       //the setState function
      //     } else if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
      //       print('scrolled up');
      //       setState(() {
      //         color = Colors.grey;
      //         height = 500;
      //       });
      //       //setState function
      //     }
      //     return true;
      //   },
      //   child: ListView(
      //     controller: _scrollController,
      //     // This next line does the trick.
      //     scrollDirection: Axis.vertical,
      //     children: <Widget>[
      //       AnimatedContainer(
      //         height: height,
      //         curve: Curves.easeInOut,
      //         color: color,
      //         duration: Duration(milliseconds: 500),
      //       ),
      //       Container(
      //         height: 160.0,
      //         color: Colors.blue,
      //       ),
      //       Container(
      //         height: 160.0,
      //         color: Colors.green,
      //       ),
      //       Container(
      //         height: 160.0,
      //         color: Colors.yellow,
      //       ),
      //       Container(
      //         height: 160.0,
      //         color: Colors.orange,
      //       ),
      //     ],
      //   ),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (_scrollController.position.userScrollDirection ==
              ScrollDirection.reverse) {
            // setState(() {
            //   listHeight = 100.h;
            //   color = Colors.white;
            //   listHeight = 1200.h;
            //   height = 300.h;
            //   width = 180.w;
            //   sizeHeight = 60.h;
            //   imgHeight = 50.h;
            //   reviewHeight = 40.h;
            //   textHeight = 32.sp;
            //   titleHeight = 15.sp;
            //   iconHeight = 20.h;
            //   //firstHeight = 100.h;
            //   topLeft = 20.r;
            //   topRight = 20.r;
            //   topText = 20.h;
            //   topHeight = 60.h;
            //   belowHeight = 400.h;
            // });
            //the setState function
          } else if (_scrollController.position.userScrollDirection ==
              ScrollDirection.forward) {
            setState(() {
              blackHeight = 100.h;
              firstHeight = 100.h;
              secondHeight = 32.h;
              productHeight = 30.h;
              topHeight = 60.h;
              // color = Colors.black;
              // height = 1200.h;
              // width = MediaQuery.of(context).size.width;
              // sizeHeight = 0.h;
              // textHeight = 0.sp;
              // titleHeight = 0.sp;
              // iconHeight = 0.h;
              // firstHeight = 0.h;
              // topLeft = 0.r;
              // topRight = 0.r;
              // topText = 0.h;
              // topHeight = 0.h;
              // belowHeight = 0.h;
            });
          }
          return true;
        },
        child: Container(
          height: 800.h,
          color: Colors.transparent,
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                controller: _scrollController,
                child: Column(
                  children: [
                    SizedBox(
                      height: sizeHeight,
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.easeOut,
                      height: height / 2,
                      width: double.infinity,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onVerticalDragUpdate: (dragDetails) {
                              updateVerticalDragDetails = dragDetails;
                            },
                            onVerticalDragStart: (dragDetails) {
                              startVerticalDragDetails = dragDetails;
                            },
                            onVerticalDragEnd: (endDetails) {
                              double dx = updateVerticalDragDetails!
                                      .globalPosition.dx -
                                  startVerticalDragDetails!.globalPosition.dx;
                              double dy = updateVerticalDragDetails!
                                      .globalPosition.dy -
                                  startVerticalDragDetails!.globalPosition.dy;
                              double? velocity = endDetails.primaryVelocity;

                              //Convert values to be positive
                              if (dx < 0) dx = -dx;
                              if (dy < 0) dy = -dy;

                              if (velocity! < 0) {
                                print('Hello swipe up');
                                setState(() {
                                  listHeight = 100.h;
                                  color = Colors.white;
                                  listHeight = 1200.h;
                                  height = 300.h;
                                  width = 180.w;
                                  sizeHeight = 60.h;
                                  imgHeight = 50.h;
                                  secondHeight = 32.h;
                                  reviewHeight = 40.h;
                                  textHeight = 32.sp;
                                  titleHeight = 15.sp;
                                  iconHeight = 20.h;
                                  firstHeight = 100.h;
                                  topLeft = 20.r;
                                  topRight = 20.r;
                                  topText = 20.h;
                                  topHeight = 60.h;
                                  belowHeight = 400.h;
                                  position = 180.h;
                                });
                              } else {
                                print('Hello swipe down--------------');
                                setState(() {
                                  color = Colors.black;
                                  height = 1200.h;
                                  width = 360.w;
                                  sizeHeight = 0.h;
                                  imgHeight = 0.h;
                                  reviewHeight = 0.h;
                                  textHeight = 0.sp;
                                  titleHeight = 0.sp;
                                  iconHeight = 0.h;
                                  firstHeight = 0.h;
                                  topLeft = 0.r;
                                  topRight = 0.r;
                                  topText = 0.h;
                                  topHeight = 0.h;
                                  belowHeight = 0.h;
                                  rightMargin = 0.w;
                                  productHeight = 0;

                                  position = 0.h;
                                });
                              }
                            },
                            onPanUpdate: (val) {},
                            child: Container(
                              width: width,
                              margin: EdgeInsets.only(
                                  right: rightMargin, left: iconHeight),
                              decoration: BoxDecoration(
                                color: colors[index],
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20.r),
                                  bottomLeft: Radius.circular(20.r),
                                  topRight: Radius.circular(topRight),
                                  topLeft: Radius.circular(topLeft),
                                ),
                              ),
                              child: Image.asset("assets/images/shoes.png"),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, top: topText),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "FREE",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: textHeight,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "METCON 3",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: textHeight,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 20.w, right: 20.w, top: topText),
                      child: Row(
                        children: [
                          Text(
                            "Product Details",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: titleHeight,
                                fontWeight: FontWeight.normal),
                          ),
                          const Spacer(),
                          Icon(Icons.edit,
                              color: Colors.black, size: iconHeight),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: productHeight,
                    ),
                    Container(
                      height: listHeight,
                      color: color,
                      child: ListView(
                        padding: const EdgeInsets.all(0),
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        children: [
                          Stack(
                            children: [
                              GestureDetector(
                                // onVerticalDragUpdate: (dragDetails) {
                                //   updateVerticalDragDetails = dragDetails;
                                // },
                                // onVerticalDragStart: (dragDetails) {
                                //   startVerticalDragDetails = dragDetails;
                                // },
                                // onVerticalDragEnd: (endDetails) {
                                //   double dx = updateVerticalDragDetails!
                                //           .globalPosition.dx -
                                //       startVerticalDragDetails!
                                //           .globalPosition.dx;
                                //   double dy = updateVerticalDragDetails!
                                //           .globalPosition.dy -
                                //       startVerticalDragDetails!
                                //           .globalPosition.dy;
                                //   double? velocity = endDetails.primaryVelocity;
                                //
                                //   if (dx < 0) dx = -dx;
                                //   if (dy < 0) dy = -dy;
                                //   if (velocity! > 0) {
                                //     print('Hello swipe down');
                                //     setState(() {
                                //       listHeight = 100.h;
                                //       color = Colors.white;
                                //       listHeight = 1200.h;
                                //       height = 300.h;
                                //       width = 180.w;
                                //       sizeHeight = 60.h;
                                //       imgHeight = 50.h;
                                //       reviewHeight = 40.h;
                                //       textHeight = 32.sp;
                                //       titleHeight = 15.sp;
                                //       iconHeight = 20.h;
                                //       firstHeight = 100.h;
                                //       topLeft = 20.r;
                                //       topRight = 20.r;
                                //       topText = 20.h;
                                //       topHeight = 60.h;
                                //       belowHeight = 400.h;
                                //     });
                                //   } else {
                                //     print('Hello swipe down--------------');
                                //     setState(() {
                                //       // selected = !selected;
                                //       // color = Colors.black;
                                //       // height = 1200.h;
                                //       // width = 360.w;
                                //       // sizeHeight = 0.h;
                                //       // imgHeight = 0.h;
                                //       // reviewHeight = 0.h;
                                //       // textHeight = 0.sp;
                                //       // titleHeight = 0.sp;
                                //       // iconHeight = 0.h;
                                //       secondHeight = 0;
                                //       firstHeight = 0.h;
                                //       blackHeight = 100.h;
                                //       listHeight = 1200.h;
                                //       productHeight = 0.h;
                                //       topHeight = 10.h;
                                //       position = 10.h;
                                //       // topLeft = 0.r;
                                //       // topRight = 0.r;
                                //       // topText = 0.h;
                                //       // topHeight = 0.h;
                                //       // belowHeight = 0.h;
                                //       // rightMargin = 0.w;
                                //     });
                                //   }
                                // },
                                onPanUpdate: (val) {},
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: 0.h, left: 20.w, right: 20.w),
                                  height: firstHeight,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffd0c3f7),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30.r),
                                      topRight: Radius.circular(30.r),
                                    ),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30.w),
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 20.h),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: const [
                                              Text(
                                                "Lastone",
                                                style: TextStyle(
                                                    color: Color(0xff7563a3),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                "CJ6314-146",
                                                style: TextStyle(
                                                    color: Color(0xff7563a3),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // Padding(
                              //   padding: EdgeInsets.only(top: topHeight),
                              //   child: Container(
                              //     margin: EdgeInsets.only(left: 20.w, right: 20.w),
                              //     height: blackHeight,
                              //     width: double.infinity,
                              //     decoration: BoxDecoration(
                              //       color: Colors.black,
                              //       borderRadius: BorderRadius.all(
                              //         Radius.circular(30.r),
                              //       ),
                              //     ),
                              //     child: Padding(
                              //       padding: EdgeInsets.only(
                              //           top: 25.h, left: 30.w, right: 30.w),
                              //       child: Row(
                              //         mainAxisAlignment:
                              //             MainAxisAlignment.spaceBetween,
                              //         children: [
                              //           Column(
                              //             crossAxisAlignment:
                              //                 CrossAxisAlignment.start,
                              //             children: [
                              //               const Text(
                              //                 "210",
                              //                 style: TextStyle(
                              //                   color: Color(0xff7563a3),
                              //                   fontWeight: FontWeight.bold,
                              //                 ),
                              //               ),
                              //               Text(
                              //                 "U 160",
                              //                 style: TextStyle(
                              //                   color: Colors.white,
                              //                   fontSize: 40.sp,
                              //                 ),
                              //               ),
                              //             ],
                              //           ),
                              //           Image.asset(
                              //             "assets/images/card.png",
                              //             height: 40.h,
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: secondHeight, left: 20.w, right: 20.w),
                            height: belowHeight,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xffd5b5e9),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.r),
                              ),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 30.w, right: 30.w),
                                  child: Row(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                              top: 20.h,
                                            ),
                                            height: 45.h,
                                            width: 50.w,
                                            decoration: BoxDecoration(
                                              color: const Color(0xffd7b966),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.r),
                                              ),
                                            ),
                                            child: Image.asset(
                                              "assets/images/img1.png",
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 20.h, left: 30.w),
                                            height: 45.h,
                                            width: 50.w,
                                            decoration: BoxDecoration(
                                              color: const Color(0xffc992d8),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.r),
                                              ),
                                            ),
                                            child: Image.asset(
                                              "assets/images/img2.png",
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 20.h, left: 60.w),
                                            height: 45.h,
                                            width: 50.w,
                                            decoration: BoxDecoration(
                                              color: const Color(0xffa2c4be),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.r),
                                              ),
                                            ),
                                            child: Image.asset(
                                              "assets/images/img3.png",
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Icon(
                                        Icons.edit,
                                        size: 15.h,
                                        color: const Color(0xffc394cd),
                                      ),
                                    ],
                                  ),
                                ),
                                Image.asset(
                                  "assets/images/shoes.png",
                                  height: 250.h,
                                  fit: BoxFit.fill,
                                ),
                                Text(
                                  "Likes 12.3k",
                                  style: TextStyle(
                                    color: const Color(0xffc394cd),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 20.w, right: 20.w, top: topText),
                            child: Row(
                              children: [
                                Text(
                                  "People assets",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: titleHeight,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: textHeight, left: 20.w, right: 20.w),
                            height: belowHeight,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color(0xffadc2f3),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.r),
                              ),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 20.w),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 20.h, left: 60.w),
                                        height: 50.h,
                                        width: 55.w,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffc7bcfa),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.r),
                                          ),
                                        ),
                                        child: Image.asset(
                                          "assets/images/img3.png",
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Image.asset(
                                  "assets/images/shoes.png",
                                  height: 250.h,
                                  fit: BoxFit.fill,
                                ),
                                Text(
                                  "Photos 609",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 20.w, right: 20.w, top: topText),
                            child: Row(
                              children: [
                                Text(
                                  "Reviews",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: titleHeight,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20.h, left: 20.w),
                                height: imgHeight,
                                width: 55.w,
                                decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.r),
                                  ),
                                ),
                                child: Image.asset(
                                  "assets/images/img3.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 17.h, left: 10.w),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.r),
                                  ),
                                ),
                                height: reviewHeight,
                                width: 100.w,
                                child: Center(
                                  child: Text(
                                    "All the way",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15.sp),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 20.h, left: 20.w),
                                height: imgHeight,
                                width: 55.w,
                                decoration: BoxDecoration(
                                  color: const Color(0xff8b7daf),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.r),
                                  ),
                                ),
                                child: Image.asset(
                                  "assets/images/img1.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 17.h, left: 10.w),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.r),
                                  ),
                                ),
                                height: reviewHeight,
                                width: 100.w,
                                child: Center(
                                  child: Text(
                                    "Omg!!",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15.sp),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: position.h,
                child: AnimatedContainer(
                  padding: EdgeInsets.only(top: 10.h),
                  margin: EdgeInsets.only(left: 20.w, right: 20.w),
                  height: blackHeight,
                  width: blackwidth,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.r),
                    ),
                  ),
                  duration: const Duration(seconds: 2),
                  child: Padding(
                    padding: EdgeInsets.only(top: 0.h, left: 30.w, right: 30.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "210",
                              style: TextStyle(
                                color: Color(0xff7563a3),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "U 160",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40.sp,
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          "assets/images/card.png",
                          height: 40.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
