import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:jdm_salon/customAppBar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CivicEP3 extends StatefulWidget {
  @override
  _CivicEP3State createState() => _CivicEP3State();
}

class _CivicEP3State extends State<CivicEP3> {
  final controller = CarouselController();
  int activeIndex = 0;

  static const slideImages = [
    'lib/assets/images/civic-type-r-ep3/ep3-1.jpg',
    'lib/assets/images/civic-type-r-ep3/ep3-2.jpg',
    'lib/assets/images/civic-type-r-ep3/ep3-3.jpg',
    'lib/assets/images/civic-type-r-ep3/ep3-4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar("Honda"),
        body: ListView(
          children: [
            spacer(),
            const Text(
              "Honda Civic Type R EP3",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
            ),
            const Text(
              "2001",
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
                  "In 2001, Honda introduced the next generation of the Civic Type R as a unique 3-door hatchback to "
                      "the UK market, which was manufactured in Swindon, England. This European Domestic Market Civic "
                      "Type R featured a 200 PS (147 kW; 197 hp) 2.0-liter i-VTEC engine (K20A2) and the regular Type R "
                      "treatment of seam welding, close ratio 6-speed transmission and upgraded brakes, but did not "
                      "include some of the other higher-end features "
                      "such as the helical LSD and red Recaro race seats that were standard on the EK9.\n",
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
