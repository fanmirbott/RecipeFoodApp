import 'package:flutter/material.dart';
import '../../../../../../utils/Appcolors.dart';
import '../widgets/PrefferencesBottom.dart';

class CookingLevelPage extends StatefulWidget {
  final PageController controller;

  const CookingLevelPage({super.key, required this.controller});

  @override
  State<CookingLevelPage> createState() => _CookingLevelPageState();
}

class _CookingLevelPageState extends State<CookingLevelPage> {
  int isSelect = 0;

  List text = ['Novice', 'Intermediate', 'Advanced', 'Professional'];
  List textBody = [
    'Lorem ipsum dolor sit amet consectetur. Auctor pretium cras id dui pellentesque ornare. Quisque malesuada netus pulvinar diam.',
    'Lorem ipsum dolor sit amet consectetur. Auctor pretium cras id dui pellentesque ornare. Quisque pulvinar diam.',
    'Lorem ipsum dolor sit amet pretium cras id dui pellentesque ornare. Quisque malesuada netus pulvinar diam.',
    'Lorem ipsum dolor sit amet consectetur. Auctor pretium cras id dui pellentesque ornare. Quisque malesuada.',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 55),
          Text(
            "What is your cooking level?",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Appcolors().white,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            "Please select your cooking level for better recommendations.",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 13,
              color: Appcolors().white,
            ),
          ),
          const SizedBox(height: 20),
          ...List.generate(text.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  isSelect = index;
                });
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isSelect == index
                        ? Appcolors().redpinkmain
                        : Appcolors().pink,
                    width: 1.5,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text[index],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Appcolors().white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      textBody[index],
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Appcolors().white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PreferencesBottom(
                iconButtonText: "Continue",
                onPressed: () {
                  widget.controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                buttonColor: Appcolors().redpinkmain,
                textColor: Appcolors().white,
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
