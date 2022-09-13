import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:pageview_builder/model/onboarding.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:pageview_builder/widgets/arrow_button.dart';

void main() {
  runApp(DevicePreview(builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _currentPage = 0;
  final PageController _onboardingController = PageController();
  PageController get onboardingController => _onboardingController;
  void onboardingToPage(double index) {
    onboardingController.animateToPage(
      index.toInt(),
      duration: const Duration(milliseconds: 300),
      curve: _currentPage < index ? Curves.easeOutBack : Curves.easeIn,
    );
    _currentPage = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              alignment: Alignment.bottomCenter,
              image: Image.asset(
                "assets/images/waves-nobg.png",
                width: double.infinity,
                height: 100,
              ).image,
            )),
        child: PageView.builder(
            controller: onboardingController,
            itemCount: OnboardingData.onboarding.length,
            // physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              OnboardingData data = OnboardingData.onboarding[index];
              return SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30.0, horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 400,
                          color: data.color,
                        ),
                        // Image.asset(data.image),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(data.title,
                            style: const TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 250,
                          child: Text(data.description,
                              textAlign: TextAlign.center,
                              maxLines: 4,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white.withOpacity(0.8),
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (index != 0) ...[
                              ArrowButton(
                                backgroundColor: Colors.white,
                                isNext: false,
                                onPressed: () => onboardingToPage(index - 1),
                              ),
                            ] else ...[
                              Opacity(
                                opacity: 0,
                                child: ArrowButton(
                                  backgroundColor: Colors.white,
                                  isNext: false,
                                  onPressed: () {},
                                ),
                              ),
                            ],
                            DotsIndicator(
                              dotsCount: OnboardingData.onboarding.length,
                              position: _currentPage,
                              // onTap: (i) => model.onboardingToPage(i),
                              decorator: DotsDecorator(
                                activeColor: const Color(0xFF5388FF),
                                color: Colors.orange,
                                size: const Size(10, 10),
                                activeSize: const Size(20, 10),
                                activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                spacing: const EdgeInsets.all(4),
                              ),
                            ),
                            if (index <
                                OnboardingData.onboarding.length - 1) ...[
                              ArrowButton(
                                backgroundColor: Colors.white,
                                isNext: true,
                                onPressed: () => onboardingToPage(index + 1),
                              ),
                            ] else ...[
                              Opacity(
                                opacity: 0,
                                child: ArrowButton(
                                  backgroundColor: Colors.white,
                                  isNext: true,
                                  onPressed: () {},
                                ),
                              ),
                            ]
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
