import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/feature/AppDetails/recipe_app_bar.dart';
import 'package:foodapp/feature/AppDetails/recipe_navigation_bar.dart';


class BreakfastDetails extends StatefulWidget {

  const BreakfastDetails({
    super.key,
    required this.Breakfastmage,
    required this.ImgText,
    required this.StarsNum,
    required this.ReviewsNum,
    required this.CheffImg,
    required this.CheffUser,
    required this.CheffName,
    required this.DetailsText,
    required this.ingredientsNum,
    required this.ingredientsText,
  });

  final String Breakfastmage;
  final String ImgText;
  final String StarsNum;
  final String ReviewsNum;
  final String CheffImg;
  final String CheffUser;
  final String CheffName;
  final String DetailsText;

  final List<String> ingredientsNum;
  final List<String> ingredientsText;

  @override
  State<BreakfastDetails> createState() => _BreakfastDetailsState();
}

class _BreakfastDetailsState extends State<BreakfastDetails> {
  bool follow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: RecipeAppBar(),
      bottomNavigationBar: RecipeNavigationBar(),
      backgroundColor: colors().fonColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36.5),
        child: Column(
          children: [
            SizedBox(height: 26),
            Stack(
              children: [
                Container(
                  width: 357,
                  height: 337,
                  decoration: BoxDecoration(
                    color: colors().tabBar,
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      width: 357,
                      height: 281,
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(10),
                        child: Stack(
                          children: [
                            Image.asset(
                              widget.Breakfastmage,
                              width: 357,
                              height: 281,
                              fit: BoxFit.cover,
                            ),
                            Center(
                              child: IconButton(
                                onPressed: () {},
                                style: IconButton.styleFrom(
                                  backgroundColor: colors().tabBar,
                                  fixedSize: Size(74, 71),
                                ),
                                icon: SvgPicture.asset(
                                  "assets/Icons/play.svg",
                                  width: 29,
                                  height: 40,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 357,
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Text(
                              widget.ImgText,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: colors().categoriesContainerColor,
                              ),
                            ),
                            Spacer(),
                            Row(
                              spacing: 4,
                              children: [
                                SvgPicture.asset(
                                  "assets/Icons/star-filled.svg",
                                ),
                                Text(
                                  widget.StarsNum,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: colors().categoriesContainerColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 10),
                            Row(
                              spacing: 4,
                              children: [
                                SvgPicture.asset("assets/Icons/reviews.svg"),
                                Text(
                                  widget.ReviewsNum,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: colors().categoriesContainerColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 26),
            SizedBox(
              width: 356,
              height: 63,
              child: Row(
                children: [
                  Container(
                    width: 61,
                    height: 63,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(widget.CheffImg),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  SizedBox(
                    width: 132,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.CheffUser,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: colors().breakfastText,
                          ),
                        ),
                        Text(
                          widget.CheffName,
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            color: colors().colorsWhite,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 15),
                  SizedBox(
                    width: 130,
                    height: 21,
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            follow =! follow;
                            setState(() {

                            });
                          },
                          style: TextButton.styleFrom(
                            fixedSize: Size(109, 21),
                            backgroundColor: follow ? colors().unfollow :colors().categoriesNum,
                            padding: EdgeInsets.zero,
                          ),
                          child: Text(
                            follow ? "unfollow" : "Following",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: follow ? colors().categoriesContainerColor : colors().tabBar,
                            ),
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(
                            "assets/Icons/three_dots.svg",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(width: 356, height: 1, color: Color(0xFFEC888D)),
            SizedBox(height: 31),
            SizedBox(
              width: 357,
              height: 30,
              child: Row(
                spacing: 15,
                children: [
                  Text(
                    "Details",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: colors().breakfastText,
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      spacing: 4,
                      children: [
                        SvgPicture.asset(
                          "assets/Icons/clock.svg",
                          color: colors().colorsWhite,
                        ),
                        Text(
                          "45 min",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: colors().colorsWhite,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            SizedBox(
              width: 357,
              height: 36,
              child: Text(
                widget.DetailsText,
                style: TextStyle(
                  color: colors().colorsWhite,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(height: 31),
            SizedBox(
              width: 358,
              height: 28,
              child: Text(
                "Ingredients",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: colors().breakfastText,
                ),
              ),
            ),
             SizedBox(height: 24,),
             SizedBox(
                width: 358,
                height: 162,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 80),
                    child: Column(
                      children: [
                        ...List.generate(widget.ingredientsText.length, (index){
                          return Row(
                              spacing: 2,
                              children: [
                                Container(
                                  width: 3,
                                  height: 3,
                                  decoration: BoxDecoration(
                                    color: colors().breakfastText,
                                    shape: BoxShape.circle,
                                  ),),
                                Text(
                                  widget.ingredientsNum[index],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: colors().breakfastText,
                                  ),
                                ),
                                Text(
                                  widget.ingredientsText[index],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: colors().categoriesContainerColor,
                                  ),
                                ),
                              ]
                          );
                        })
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
