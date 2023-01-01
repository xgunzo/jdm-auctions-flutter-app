import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jdm_salon/customAppBar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class LanciaDelta extends StatefulWidget {
  @override
  _LanciaDeltaState createState() => _LanciaDeltaState();
}

class _LanciaDeltaState extends State<LanciaDelta> {
  final controller = CarouselController();
  int activeIndex = 0;

  static const slideImages = [
    'lib/assets/images/lancia-delta/lancia-delta-1.jpg',
    'lib/assets/images/lancia-delta/lancia-delta-2.jpg',
    'lib/assets/images/lancia-delta/lancia-delta-3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar("Lancia"),
        body: ListView(
          children: [
            spacer(),
            const Text(
              "Lancia Delta",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
            ),
            const Text(
              "1995",
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
                  "The first Delta (Tipo 831) was a five-door hatchback, designed by Giorgetto Giugiaro "
                      "and released in 1979. Between 1980 and 1982, it was also sold in Sweden, Denmark "
                      "and Norway by Saab Automobile, badged as the 'Saab-Lancia 600' to replace the "
                      "retired 96 model. The Delta was voted the 1980 European Car of the Year.\n\n"
                      "A special Delta HF Integrale version was a four-wheel drive hot hatch with a turbocharged "
                      "petrol engine. Modified versions of the HF dominated the World Rally Championship, scoring "
                      "46 victories overall and winning the Constructors' Championship a record six times in a row from "
                      "1987 to 1992, in addition to Drivers' Championship titles for Juha Kankkunen (1987 and 1991) and "
                      "Miki Biasion (1988 and 1989).",
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
