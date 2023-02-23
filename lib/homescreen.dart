import 'package:clothing_shop_ui/constant.dart';
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
  var color = kWhiteColor;
  double height = 300.0.h;
  double width = 180.0.w;
  double sizeHeight = 100.0.h;
  double imgHeight = 50.h;
  double reviewHeight = 60.0.h;
  double textHeight = 32.sp;
  double productHeight = 30.h;
  double secondHeight = 80.h;
  double titleHeight = 15.sp;
  double iconHeight = 20.w;
  double firstHeight = 100.h;
  double topLeft = 20.r;
  double topRight = 20.r;
  double topText = 20.h;
  double topHeight = 60.h;
  double belowHeight = 400.h;
  double rightMargin = 50.w;
  double listHeight = 335.h;
  double blackHeight = 100.h;
  double blackwidth = 320.w;
  double position = 60.h;
  double slide = 0.8;
  String name = "name";
  List colors = [
    kPurpleColor,
    kPinkColor,
    kLightPinkColor,
    kPurpleColor,
    kPinkColor,
  ];

  List img = [
    "assets/images/shoes1.png",
    "assets/images/shoes2.png",
    "assets/images/shoes3.png",
    "assets/images/shoes4.png",
    "assets/images/shoes1.png",
  ];
  bool animate = false;

  Future startAnimation() async {
    setState(() {
      animate = true;
    });
  }

  Future endAnimation() async {
    setState(() {
      animate = false;
    });
  }

  DragUpdateDetails? updateVerticalDragDetails;
  DragStartDetails? startVerticalDragDetails;

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.offset >= 10) {
        setState(() {
          blackHeight = 50.h;
          blackwidth = 120.w;
          firstHeight = 0.h;
          listHeight = 1000.h;
          productHeight = 10.h;
          secondHeight = 0.h;
          startAnimation();
        });
        print("scroll detect");
      }
      if (_scrollController.offset <= 10) {
        setState(() {
          blackHeight = 100.h;
          blackwidth = 320.w;
          firstHeight = 100.h;
          listHeight = 335.h;
          productHeight = 30.h;
          secondHeight = 80.h;
          endAnimation();
          print("reach the top");
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (_scrollController.position.userScrollDirection ==
              ScrollDirection.reverse) {
          } else if (_scrollController.position.userScrollDirection ==
              ScrollDirection.forward) {
            setState(() {});
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
                      height: height / 1.6,
                      width: double.infinity,
                      child: PageView.builder(
                          padEnds: false,
                          controller: PageController(viewportFraction: slide),
                          itemCount: img.length,
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
                                    productHeight = 30.h;
                                    color = kWhiteColor;
                                    listHeight = 1000.h;
                                    height = 300.h;
                                    width = 180.w;
                                    rightMargin = 50.w;
                                    sizeHeight = 100.h;
                                    imgHeight = 50.h;
                                    secondHeight = 80.h;
                                    reviewHeight = 40.h;
                                    textHeight = 32.sp;
                                    titleHeight = 15.sp;
                                    iconHeight = 20.w;
                                    firstHeight = 100.h;
                                    topLeft = 20.r;
                                    topRight = 20.r;
                                    topText = 20.h;
                                    topHeight = 60.h;
                                    belowHeight = 400.h;
                                    position = 60.h;
                                    slide = 0.8;
                                  });
                                } else {
                                  print('Hello swipe down--------------');
                                  setState(() {
                                    slide = 1;
                                    color = kBlackColor;
                                    height = 940.h;
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
                                child: Image.asset(
                                  img[index],
                                ),
                              ),
                            );
                          }),
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
                                    color: kBlackColor,
                                    fontSize: textHeight,
                                    fontFamily: "Poppins-Bold"),
                              ),
                              Text(
                                "METCON 3",
                                style: TextStyle(
                                    color: kBlackColor,
                                    fontSize: textHeight,
                                    fontFamily: "Poppins-Bold"),
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
                                color: kBlackColor.withOpacity(0.6),
                                fontSize: titleHeight,
                                fontFamily: "Poppins-SemiBold"),
                          ),
                          const Spacer(),
                          Icon(Icons.edit,
                              color: kBlackColor, size: iconHeight),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: productHeight,
                    ),
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: 0.h, left: 20.w, right: 20.w),
                          height: firstHeight,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xff7563a3).withOpacity(0.3),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.r),
                              topRight: Radius.circular(30.r),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
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
                                            fontFamily: "Poppins-Bold"),
                                      ),
                                      Text(
                                        "CJ6314-146",
                                        style: TextStyle(
                                            color: Color(0xff7563a3),
                                            fontFamily: "Poppins-Bold"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: secondHeight, left: 20.w, right: 20.w),
                      height: belowHeight,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: kLightPinkColor.withOpacity(0.5),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.r),
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 30.w, right: 30.w),
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
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 20.h, left: 30.w),
                                      height: 45.h,
                                      width: 50.w,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffd8c9e5),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.r),
                                        ),
                                      ),
                                      child: Image.asset(
                                        "assets/images/img2.png",
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
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Icon(
                                  Icons.edit,
                                  size: 15.h,
                                  color: kDarkPinkColor,
                                ),
                              ],
                            ),
                          ),
                          Image.asset(
                            "assets/images/shoes.png",
                            height: 270.h,
                            fit: BoxFit.fill,
                          ),
                          Text(
                            "Likes 12.3k",
                            style: TextStyle(
                              color: kDarkPinkColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 22.w, right: 20.w, top: topText),
                      child: Row(
                        children: [
                          Text(
                            "People assets",
                            style: TextStyle(
                                color: kBlackColor.withOpacity(0.6),
                                fontSize: titleHeight,
                                fontFamily: "Poppins-SemiBold"),
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
                        color: const Color(0xffb9c8ef).withOpacity(0.5),
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
                                  margin:
                                      EdgeInsets.only(top: 30.h, left: 60.w),
                                  height: 65.h,
                                  width: 65.w,
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
                          Container(
                            height: 250.h,
                            color: Colors.transparent,
                            child: Image.asset(
                              "assets/images/shoes4.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          Text(
                            "Photos 609",
                            style: TextStyle(
                              color: const Color(0xff8eacf1),
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
                                color: kBlackColor,
                                fontSize: titleHeight,
                                fontFamily: "Poppins-SemiBold"),
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
                            color: kGreyColor.withOpacity(0.6),
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
                                  color: kBlackColor,
                                  fontSize: 15.sp,
                                  fontFamily: "Poppins-Regular"),
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
                            color: kLightPurpleColor,
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
                            color: kGreyColor.withOpacity(0.6),
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
                                  color: kBlackColor,
                                  fontSize: 15.sp,
                                  fontFamily: "Poppins-Regular"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(microseconds: 1),
                left: animate ? 200.w : 0,
                bottom: animate ? 10 : position.h,
                child: AnimatedContainer(
                  padding: EdgeInsets.only(top: animate ? 2.h : 10.h),
                  margin: EdgeInsets.only(left: 20.w, right: 20.w),
                  height: blackHeight,
                  width: blackwidth,
                  decoration: BoxDecoration(
                    color: kBlackColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.r),
                    ),
                  ),
                  duration: const Duration(microseconds: 2),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 0.h,
                        left: animate ? 20.w : 30.w,
                        right: animate ? 20.w : 30.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "210",
                              style: TextStyle(
                                fontSize: animate ? 0 : 14.sp,
                                color: const Color(0xff7563a3),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "U 160",
                              style: TextStyle(
                                fontFamily: "Poppins-Medium",
                                color: kWhiteColor,
                                fontSize: animate ? 30.sp : 40.sp,
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          "assets/images/card.png",
                          height: animate ? 0.h : 40.h,
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
