import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:jdm_salon/customAppBar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Mercedes190E extends StatefulWidget {
  @override
  _Mercedes190EState createState() => _Mercedes190EState();
}

class _Mercedes190EState extends State<Mercedes190E> {
  final controller = CarouselController();
  int activeIndex = 0;

  static const slideImages = [
    'lib/assets/images/mercedes-190e/merc-1.png',
    'lib/assets/images/mercedes-190e/merc-2.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar("Mercedes-Benz"),
        body: ListView(
          children: [
            spacer(),
            const Text(
              "Mercedes-Benz 190E",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
            ),
            const Text(
              "1992",
              textAlign: TextAlign.center,
              style: TextStyle(
                  height: 2, fontSize: 25.0, fontWeight: FontWeight.w500),
            ),
            spacer(),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              CarouselSlider.builder(
                carouselController: controller,
                options: CarouselOptions(
                  height: 300,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  //autoPlay: true,
                  onPageChanged: (index, reason) =>
                      setState(() => activeIndex = index),
                ),
                itemCount: slideImages.length,
                itemBuilder: (context, index, realIndex) {
                  final slideImage = slideImages[index];

                  return buildImage(slideImage, index);
                },
              ),
              const SizedBox(height: 32),
              buildIndicator(),
              spacer(),
              buildButtons(),
              spacer(),
              spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: const Text(
                  "In 1993, for the U.S. market, 2 LE models were offered, limited to 1,400 units (700 190 E 2.3 "
                      "LE and 700 190 E 2.6 LE). Both the 2.3 and 2.6 Limited Editions had a rear badge deletion "
                      "meaning that the '190E' and '2.3' or '2.6' chrome badges on the trunk lid were not added.\n\n "
                  "The 2.3 LE was only offered in Emerald Green while the 2.6 was only offered in Black. The 2.3 litre were "
                  "only produced in Brilliant Emerald Pearl color. The 2.3 LE comes with 15-inch 8-hole alloy wheels, "
                "cream beige leather upholstery, burl walnut trim on the entire dash, fully electric front seats, rear "
                  "headrests, and headlamp wipers with a washing system.\n\n The 2.6 litre Black Sportline included Recaro "
                  "seats with red inserts and red piping, rear matching headrests, carbon fiber trim, Sportline gear "
                  "shift, a sportier steering wheel, headlight wipers, low profile tires, eight spoke rims, and a "
                  "Sportline tuned suspension which added tighter handling and lowered the car by a quarter inch. The suspension was the same suspension as the 190E Cosworth.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: 1.5, fontSize: 20.0, fontWeight: FontWeight.w400),
                ),
              ),
            ]),
            spacer(),
            Divider(
              height: 5.0,
              thickness: 5.0,
              color: Theme.of(context).primaryColor,
            ),
            spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const Text(
                "If you are interested in buying this car, please contact us below!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    height: 1.5, fontSize: 20.0, fontWeight: FontWeight.w700),
              ),
            ),
            spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100.0),
              child:
              ElevatedButton.icon(
                onPressed: () async {
                  final number = "+789654123";
                  await FlutterPhoneDirectCaller.callNumber(number);
                },
                icon: Icon(Icons.phone),
                label: Text("Call us"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  textStyle: TextStyle(fontSize: 24),
                ),
              ),
            ),
            spacer(),
          ],
        ));
  }

  Widget buildImage(String slideImage, int index) => Container(
    margin: EdgeInsets.symmetric(horizontal: 12),
    color: Colors.grey,
    width: double.infinity,
    child: Image.asset(
      slideImage,
      fit: BoxFit.cover,
    ),
  );

  Widget buildIndicator() => AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count: slideImages.length,
    onDotClicked: animateToSlide,
    effect: JumpingDotEffect(
      dotWidth: 20,
      dotHeight: 20,
      activeDotColor: Colors.blueGrey,
      dotColor: Colors.black12,
    ),
  );

  Widget buildButtons({bool stretch = false}) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 13)),
        child: Icon(Icons.arrow_back, size: 32),
        onPressed: previous,
      ),
      stretch ? Spacer() : SizedBox(width: 32),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 13)),
        child: Icon(Icons.arrow_forward, size: 32),
        onPressed: next,
      ),
    ],
  );

  void animateToSlide(int index) => controller.animateToPage(index);

  void next() => controller.nextPage();

  void previous() => controller.previousPage();
}

SizedBox spacer() => SizedBox(height: 15.0);
