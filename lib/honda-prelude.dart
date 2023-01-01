import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jdm_salon/customAppBar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class Prelude extends StatefulWidget {
  @override
  _PreludeState createState() => _PreludeState();
}

class _PreludeState extends State<Prelude> {
  final controller = CarouselController();
  int activeIndex = 0;

  static const slideImages = [
    'lib/assets/images/prelude-type-s-1997/prelude1.png',
    'lib/assets/images/prelude-type-s-1997/prelude2.png',
    'lib/assets/images/prelude-type-s-1997/prelude3.png',
    'lib/assets/images/prelude-type-s-1997/prelude4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar("Honda"),
        body: ListView(
          children: [
            spacer(),
            const Text(
              "Honda Prelude SiR Type S",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
            ),
            const Text(
              "1997",
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
                  "The Honda Prelude is a car produced by Japanese car manufacturer Honda from "
                  "1978 until 2001. The two-door coupe was loosely derived from the Honda Accord, "
                  "and spanned five generations. The Prelude was used by Honda to introduce the Japanese Honda "
                  "retail sales chain Honda Verno, with the international release of the model following shortly after.\n\n"
                  "Production of the Prelude concluded in 2001 upon the introduction of the fourth-generation Integra."
                  "The Prelude name was originally trademarked by Toyota, but was amicably given to Honda for use. The Prelude "
                  "complied with the series of music-themed vehicle names which Honda used at the time, along with the Accord, Quintet, "
                  "Concerto, Jazz, and Ballade.",
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
