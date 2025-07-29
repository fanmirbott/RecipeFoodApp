import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodapp/feature/page/categories/LunchDetails/lunchDetails.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/feature/page/categories/categoriesPageDetail.dart';

class CategoriesPageLunch extends StatefulWidget {
  const CategoriesPageLunch({
    super.key,
    required this.items,
    required this.text,
    required this.text1,
    required this.CategoriesPageNum,
    required this.CategoriesPageMinut,
  });

  final List<String> items;
  final List<String> text;
  final List<String> text1;
  final List<String> CategoriesPageNum;
  final List<String> CategoriesPageMinut;

  @override
  State<CategoriesPageLunch> createState() => _CategoriesPageLunchState();
}

class _CategoriesPageLunchState extends State<CategoriesPageLunch> {
  late List<int> likeStatus;

  @override
  void initState() {
    super.initState();
    likeStatus = List.filled(widget.items.length, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 37),
        child: GridView.builder(
          itemCount: widget.items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 30,
            crossAxisSpacing: 18.5,
            crossAxisCount: 2,
            mainAxisExtent: 226,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LunchDetails(
                      foodImage: "assets/Images/Recipes/Breakfast/eggs_benedict.png",
                      ImgText: "Pad Thai Chicken",
                      StarsNum: "4.2",
                      ReviewsNum: "2.273",
                      CheffImg: "assets/Images/ChefProfiles/ryan.png",
                      CheffUser: "@josh-ryan",
                      CheffName: "Josh Ryan-Chef",
                      DetailsText: "A savory Thai dish featuring tender chicken, rice noodles, and a flavorful sauce made from soy sauce, fish sauce, tamarind paste, and brown sugar, topped with bean sprouts, peanuts, and fresh cilantro for a delightful balance of flavors and textures.",
                      ingredientsNum: [
                        "8",
                        "2",
                        "8",
                        "8",
                        "4",
                        "2",
                        "1",
                        "7",
                        "2",],
                      ingredientsText: [
                        "oz (about 225g) rice noodles",
                        "nma gap",
                        "tinch",
                        "mayli tinch bolsa agar",
                        "ha uzingda nma gap",
                        "nma ishing bor",
                        "norm gapir",
                        "nma qilasan",
                        "axaxaxaxaxaxa",
                      ],
                    ),
                  ),
                );
              },
              child: Center(
                child: SizedBox(
                  width: 168,
                  height: 226,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        width: 158,
                        height: 226,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusGeometry.circular(14),
                          color: colors().categoriesContainerColor,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: 158,
                          height: 76,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 3,
                              left: 15,
                              right: 15,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.text[index],
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: colors().textStyleColor,
                                  ),
                                ),
                                Text(
                                  widget.text1[index],
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300,
                                    color: colors().textStyleColor,
                                  ),
                                ),
                                Spacer(),
                                SizedBox(
                                  width: 125.5,
                                  height: 18,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 23,
                                        height: 18,
                                        child: Row(
                                          spacing: 5,
                                          children: [
                                            Text(
                                              widget.CategoriesPageNum[index],
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: colors().categoriesNum,
                                              ),
                                            ),
                                            SvgPicture.asset(
                                              "assets/Icons/star.svg",
                                              width: 10,
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      SizedBox(
                                        width: 50,
                                        height: 18,
                                        child: Row(
                                          spacing: 5,
                                          children: [
                                            Text(
                                              widget.CategoriesPageMinut[index],
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: colors().categoriesNum,
                                              ),
                                            ),
                                            SvgPicture.asset(
                                              "assets/Icons/clock.svg",
                                              width: 10,
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(14),
                        child: Container(
                          width: 169,
                          height: 153,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 0,
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                            borderRadius: BorderRadiusGeometry.circular(14),
                          ),
                          child: Image.asset(
                            widget.items[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              likeStatus[index] = likeStatus[index] == 0
                                  ? 1
                                  : 0;
                            });
                          },
                          child: Image.asset(
                            likeStatus[index] == 1
                                ? "assets/Icons/Like/like.png"
                                : "assets/Icons/Like/deslike.png",
                            width: 28,
                            height: 28,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
