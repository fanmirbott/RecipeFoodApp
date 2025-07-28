import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodapp/utils/colors.dart';

class CategoriesPageDessert extends StatelessWidget {
  const CategoriesPageDessert({
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
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 37),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 30,
            crossAxisSpacing: 18.5,
            crossAxisCount: 2,
            mainAxisExtent: 226,
          ),
          itemBuilder: (context, index) {
            return Center(
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
                        color: colors().CategoriesContainerColor,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: 158,
                        height: 76,
                        child: Padding(
                          padding: EdgeInsets.only(top: 3, left: 15, right: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                text[index],
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: colors().TextStyleColor,
                                ),
                              ),
                              Text(
                                text1[index],
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300,
                                  color: colors().TextStyleColor,
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
                                            CategoriesPageNum[index],
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                              color: colors().CategoriesNum,
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
                                            CategoriesPageMinut[index],
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: colors().CategoriesNum,
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
                        child: Image.asset(items[index], fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
