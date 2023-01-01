import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:jdm_salon/customAppBar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Porsche911 extends StatefulWidget {
  @override
  _Porsche911State createState() => _Porsche911State();
}

class _Porsche911State extends State<Porsche911> {
  final controller = CarouselController();
  int activeIndex = 0;

  static const slideImages = [
    'lib/assets/images/porsche-911-turbo/porsche-911-1.png',
    'lib/assets/images/porsche-911-turbo/porsche-911-2.png',
    'lib/assets/images/porsche-911-turbo/porsche-911-3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar("Porsche"),
        body: ListView(
          children: [
            spacer(),
            const Text(
              "Porsche 911 Turbo 4WD 996",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
            ),
            const Text(
              "2000",
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
                  "The Turbocharged version of the 997 series featured the same 3.6 L twin-turbocharged engine as the "
                      "996 Turbo, with modifications to have a power output of 480 PS (353 kW; 473 hp) and 620 N⋅m "
                      "(457 lb⋅ft) of torque. It has VTG (variable turbine geometry), that combines the low-rev boost "
                      "and quick responses of a small turbocharger with the high-rev power of a larger turbocharger. "
                      "It also offers higher fuel efficiency compared to the 996 Turbo.\n\n The 997 Turbo features a new "
                      "all-wheel-drive system, similar to the one found on the Cayenne. The new PTM (Porsche Traction "
                      "Management) system incorporates a clutch-based system that varies the amount of torque to the wheels to avoid tyre slippage. According to Porsche, redirecting torque to control oversteer or "
                      "understeer results in neutral handling as well as greatly improved performance in all weather "
                      "conditions.",
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
