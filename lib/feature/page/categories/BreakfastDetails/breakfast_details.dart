import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/feature/AppDetails/recipe_app_bar.dart';
import 'package:foodapp/feature/AppDetails/recipe_navigation_bar.dart';

class BreakfastDetails extends StatelessWidget {
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
  });

  final String Breakfastmage;
  final String ImgText;
  final String StarsNum;
  final String ReviewsNum;
  final String CheffImg;
  final String CheffUser;
  final String CheffName;
  final String DetailsText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              Breakfastmage,
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
                           ImgText,
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
                                  StarsNum,
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
                                  ReviewsNum,
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
                        image: AssetImage(
                          CheffImg,
                        ),
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
                          CheffUser,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: colors().breakfastText,
                          ),
                        ),
                        Text(
                          CheffName,
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
                        IconButton(
                          onPressed: () {},
                          style: IconButton.styleFrom(
                            fixedSize: Size(109, 21),
                            minimumSize: Size(109, double.infinity),
                            backgroundColor: colors().tabBar,
                          ),
                          icon: SizedBox(
                            height: 21,
                            child: Text(
                              "follow",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFEC888D),
                              ),
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
                DetailsText,
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
          ],
        ),
      ),
    );
  }
}
