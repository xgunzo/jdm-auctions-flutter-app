import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:jdm_salon/customAppBar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LexusIS350 extends StatefulWidget {
  @override
  _LexusIS350State createState() => _LexusIS350State();
}

class _LexusIS350State extends State<LexusIS350> {
  final controller = CarouselController();
  int activeIndex = 0;

  static const slideImages = [
    'lib/assets/images/lexus-is-350/lexus1.png',
    'lib/assets/images/lexus-is-350/lexus2.png',
    'lib/assets/images/lexus-is-350/lexus3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar("Lexus"),
        body: ListView(
          children: [
            spacer(),
            const Text(
              "Lexus IS350 Version L",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
            ),
            const Text(
              "2009",
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
                  "The second-generation IS marked the next introduction of Lexus' L-finesse "
                      "design philosophy on a production vehicle, following the premiere of the 2006 GS "
                      "executive sedan. The sedan's exterior design featured sleeker, coupé-like contours, "
                      "a fastback profile, and a repeated arrowhead motif in the front fascia and "
                      "side windows. The IS sedan has a drag coefficient of Cd=0.28.\n\n"
                      "In North America, IS models sold at launch included the IS 250 and IS 350 sedans; "
                      "in parts of Europe, the IS models sold by Lexus included the IS 250 and IS 220d sedans. "
                      "The IS 250 was also available in Australia, New Zealand, Thailand, Singapore, Hong Kong, "
                      "Taiwan, Chile (automatic only), South Africa and South Korea.",
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
