import 'package:flutter/material.dart';
import 'package:foodapp/feature/AppDetails/recipe_app_bar.dart';
import 'package:foodapp/feature/AppDetails/recipe_navigation_bar.dart';

void main() {
  runApp(CategoriesPageDetails());
}

class CategoriesPageDetails extends StatefulWidget {
  CategoriesPageDetails({super.key});

  @override
  State<CategoriesPageDetails> createState() => _CategoriesPageDetailsState();
}

class _CategoriesPageDetailsState extends State<CategoriesPageDetails> {
  List<String> items = [
    "assets/Images/Categories/lunch.png",
    "assets/Images/Allergic/shrimp.png",
    "assets/Images/Allergic/banana.png",
    "assets/Images/Allergic/fish.png",
    "assets/Images/Allergic/kiwi.png",
    "assets/Images/Allergic/meat.png",
    "assets/Images/Allergic/milk.png",
    "assets/Images/Allergic/mustard.png",
  ];

  List<String> text = [
    "Eggs Benedict",
    "French Toast",
    "Oatmeal and Nut ",
    "Still Life Potato",
    "Baked Chicken",
    "Eggs Benedict",
    "Eggs Benedict",
    "Eggs Benedict",
  ];

  List<String> text1 = [
    "Muffin with Canadian bacon",
    "French Toast",
    "Oatmeal and Nut ",
    "Still Life Potato",
    "Baked Chicken",
    "Eggs Benedict",
    "Eggs Benedict",
    "Eggs Benedict",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xFF1C0F0D),
      appBar: RecipeAppBar(),
      bottomNavigationBar: RecipeNavigationBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 37),
        child:
            GridView.builder(
              itemCount: items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 30,
                crossAxisSpacing: 18.5,
                crossAxisCount: 2,
                mainAxisExtent: 226,
              ),
              itemBuilder: (context, index) {
                return Center(
                  child: Container(
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
                            color: Colors.white,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: 158,
                            height: 76,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3, left: 15, right: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(text[index]),
                                  Text("Muffin with Canadian bacon"),
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
                            child: Image.asset(items[index], fit: BoxFit.cover,),
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