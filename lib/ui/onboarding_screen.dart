import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20, top: 20),
            child: InkWell(
              onTap: () => null,
              child: Text(
                "Skip",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(
                () {
                  currentIndex = page;
                },
              );
            },
            controller: _pageController,
            children: [
              createPage(
                image: "assets/images/plant-one.png",
                title: Constants.titleOne,
                description: Constants.description,
              ),
              createPage(
                image: "assets/images/plant-two.png",
                title: Constants.titleTwo,
                description: Constants.descriptionTwo,
              ),
              createPage(
                image: "assets/images/plant-three.png",
                title: Constants.titleThree,
                description: Constants.descriptionThree,
              ),
            ],
          ),
          Positioned(
            bottom: 80,
            left: 30,
            child: Row(
              children: _buildIndicator(),
            ),
          ),
          Positioned(
            bottom: 60,
            right: 30,
            child: Container(
              child: IconButton(onPressed: null, icon: Icon(Icons.arrow_back_ios)),
            ),
          )
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 10,
      width: isActive ? 20 : 0,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Constants.primaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }
}

class createPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  const createPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 50,
        right: 50,
        bottom: 50,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 350,
            child: Image.asset(image),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Constants.primaryColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w400, color: Colors.grey),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
