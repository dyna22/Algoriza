import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_dy/login.dart';
import 'package:test_dy/register.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int index = 0;
  PageController _controller = PageController();

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                itemCount: contents.length,
                controller: _controller,
                onPageChanged: (int indx) {
                  setState(() {
                    index = indx;
                  });
                },
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.all(60),
                    child: Column(
                      children: [
                        Image.asset(contents[i].image),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Text(
                            contents[i].title,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            contents[i].discription,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.teal[600],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contents.length,
                (index) => buildDot(index, context),
              ),
            ),
          ),
          Container(
            height: 60,
            margin: EdgeInsets.all(30),
            width: double.infinity,
            child: ElevatedButton(
              child: Text(
                "Get Started",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                if (index == contents.length - 1) {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => Login()));
                }
                _controller.nextPage(
                  duration: Duration(milliseconds: 100),
                  curve: Curves.bounceIn,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 70),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Don't have account ?"),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Register()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 45),
                      child: Text(
                        "SignUp",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildDot(int indx, BuildContext context) {
    return Container(
      height: 10,
      width: index == indx ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
      ),
    );
  }
}

class Content {
  String image;
  String title;
  String discription;
  Content({this.image, this.title, this.discription});
}

List<Content> contents = [
  Content(
      image: "assets/1.jpg",
      title: "Get food delivery to your doorstep asap",
      discription:
          "We have young and professional delivery team that will bring your food as soon as possible to your doorstep"),
  Content(
      image: "assets/1.jpg",
      title: "Get food delivery to your doorstep asap",
      discription:
          "We have young and professional delivery team that will bring your food as soon as possible to your doorstep"),
  Content(
      image: "assets/2.jpg",
      title: "Buy any food from your favorit resturant",
      discription:
          "We are constantly adding your favorit resturant throughout the territory and around your area carefully selected")
];
