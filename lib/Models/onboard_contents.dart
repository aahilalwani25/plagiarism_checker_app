import 'package:flutter/material.dart';

class OnboardListContent with ChangeNotifier{
  String title, description, image;
  bool isLastPage= false;

  OnboardListContent(
      {required this.title, required this.description, required this.image});
}

List<OnboardListContent> onboard_contents=[
  OnboardListContent(
    title: "The only app you need to catch plagiarism.",
    description:"The only number 1 application for checking plagiarised content",
    image: "assets/images/onboard_img_1.png",
  ),

  OnboardListContent(
    title: "Rest assured that your work is your own.",
    description:"We'll catch any instances of plagiarism and help you cite your sources correctly.",
    image: "assets/images/onboard_img_3.png",
  ),

  OnboardListContent(
    title: "Get the grades you deserve",
    description:"Protect your academic integrity with our plagiarism checker.",
    image: "assets/images/onboard_img_2.png",
  ),
  
];
