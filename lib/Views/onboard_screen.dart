// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
// import 'package:rounded_loading_button/rounded_loading_button.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import '../Models/onboard_contents.dart';
// import '../global/components/Screen.dart';

// class OnboardScreen extends StatefulWidget {
//   PageController? pageController;
//   OnboardScreen({super.key});

//   @override
//   State<OnboardScreen> createState() => _OnboardScreenState();
// }

// class _OnboardScreenState extends State<OnboardScreen> {
//   @override
//   Widget build(BuildContext context) {
//     Screen screen = Screen(context: context);
//     PageController pageController = PageController();
//     RoundedLoadingButtonController skipBtnController =
//         RoundedLoadingButtonController();
//     RoundedLoadingButtonController nextBtnController =
//         RoundedLoadingButtonController();
//     bool isLastPage = false;

//     print('object');

//     return Scaffold(
//       bottomSheet: SizedBox(
//         height: screen.height! * 0.1,
//         child: Column(
//           children: [
//             Center(
//                 child: SmoothPageIndicator(
//                     controller: pageController, // PageController
//                     count: onboard_contents.length,
//                     //effect: const ExpandingDotsEffect(), // your preferred effect
//                     onDotClicked: (index) {
//                       pageController.animateToPage(index,
//                           duration: Duration(seconds: 1),
//                           curve: Curves.easeInOut);
//                     })),
//             isLastPage == true
//                 ? Container(
//                     padding: const EdgeInsets.all(10),
//                     width: screen.width! * 0.4,
//                     child: RoundedLoadingButton(
//                       color: Colors.green,
//                       animateOnTap: true,
//                       controller: nextBtnController,
//                       onPressed: () {
//                         pageController.nextPage(
//                             duration: const Duration(seconds: 1),
//                             curve: Curves.easeInOut);
//                         nextBtnController.reset();
//                       },
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: const [
//                           Icon(Icons.skip_next),
//                           AutoSizeText("Get Started")
//                         ],
//                       ),
//                     ),
//                   )
//                 : Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.all(10),
//                         width: screen.width! * 0.4,
//                         child: RoundedLoadingButton(
//                           controller: skipBtnController,
//                           onPressed: () {
//                             pageController.animateToPage(
//                                 onboard_contents.length - 1,
//                                 duration: const Duration(seconds: 1),
//                                 curve: Curves.easeInOut);
//                             skipBtnController.reset();
//                           },
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: const [
//                               Icon(Icons.skip_next),
//                               AutoSizeText("Skip")
//                             ],
//                           ),
//                         ),
//                       ),
//                       Container(
//                         padding: const EdgeInsets.all(10),
//                         width: screen.width! * 0.4,
//                         child: RoundedLoadingButton(
//                           color: Colors.green,
//                           animateOnTap: true,
//                           controller: nextBtnController,
//                           onPressed: () {
//                             pageController.nextPage(
//                                 duration: const Duration(seconds: 1),
//                                 curve: Curves.easeInOut);
//                             nextBtnController.reset();
//                           },
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: const [
//                               Icon(Icons.skip_next),
//                               AutoSizeText("Next")
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   )
//           ],
//         ),
//       ),
//       body: SafeArea(
//         child: Center(
//           child: PageView.builder(
//               onPageChanged: (index) {
//                 if (index == onboard_contents.length - 1) {
//                   setState(() {
//                     isLastPage = true;
//                   });
//                 }
//               },
//               controller: pageController,
//               itemCount: onboard_contents.length,
//               itemBuilder: (itemBuilder, index) {
//                 return Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                         width: screen.width! * 0.7,
//                         child: Image.asset(onboard_contents[index].image)),
//                     SizedBox(
//                       width: screen.width! * 0.7,
//                       child: AutoSizeText(
//                         onboard_contents[index].title,
//                         textAlign: TextAlign.center,
//                         style: const TextStyle(
//                             fontSize: 30, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     SizedBox(
//                       width: screen.width! * 0.9,
//                       child: AutoSizeText(
//                         onboard_contents[index].description,
//                         textAlign: TextAlign.center,
//                         style: const TextStyle(
//                           fontSize: 20,
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
//               }),
//         ),
//       ),
//     );
//   }
// }
