import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodapp/feature/AppDetails/recipe_app_bar.dart';
import 'package:foodapp/feature/AppDetails/recipe_navigation_bar.dart';
import 'package:foodapp/feature/page/categories/categoriesPageLunch.dart';
import 'package:foodapp/feature/page/categories/BreakfastDetails/categories_page_breakfast_state.dart';
import 'package:foodapp/feature/page/categories/categories_page_dessert.dart';
import 'package:foodapp/feature/page/categories/categories_page_dinner.dart';
import 'package:foodapp/feature/page/categories/categories_page_drinks.dart';
import 'package:foodapp/feature/page/categories/categories_page_vegan..dart';
import 'package:foodapp/feature/AppDetails/recipe_app_bar.dart';
import 'package:foodapp/utils/colors.dart';


class CategoriesPageDetail extends StatefulWidget {
  CategoriesPageDetail({super.key, required this.activIndex});

  int activIndex;

  @override
  State<CategoriesPageDetail> createState() => _CategoriesPageDetailState();
}

class _CategoriesPageDetailState extends State<CategoriesPageDetail> {

  List<Widget> Pages = [
    CategoriesPageBreakfastState(
      items: [
        "assets/Images/Recipes/Breakfast/eggs_benedict.png",
        "assets/Images/Recipes/Breakfast/french_toast.png",
        "assets/Images/Recipes/Breakfast/oatmeal_and_nut.png",
        "assets/Images/Recipes/Breakfast/oatmeal_granola.png",
        "assets/Images/Recipes/Breakfast/omelette_cheese.png",
        "assets/Images/Recipes/Breakfast/still_life_potato.png",
        "assets/Images/Recipes/Breakfast/sunny_bruschetta.png",
        "assets/Images/Recipes/Breakfast/tofu_sandwich.png",

      ],
      text: [
        "Eggs Benedict",
        "French Toast",
        "Oatmeal and Nut ",
        "Still Life Potato",
        "Baked Chicken",
        "Eggs Benedict",
        "Eggs Benedict",
        "Eggs Benedict",
      ],
      text1: [
        "Muffin with Canadian bacon",
        "Delicious slices of bread",
        "Wholesome blend for breakfast",
        "Earthy, textured, rustic charm",
        "Delicious and juicy wings",
        "Mixed vegetables and meat",
        "Eggs Benedict",
        "Eggs Benedict",
      ],
      CategoriesPageNum: ["5", "5", "4", "4", "3", "1", "8", "4"],
      CategoriesPageMinut: [
        "15min",
        "20min",
        "35min",
        "40min",
        "30min",
        "50min",
        "25min",
        "20min",
      ],
    ),
    CategoriesPageLunch(
      items: [
        "assets/Images/Recipes/Lunch/baked_chicken.png",
        "assets/Images/Recipes/Lunch/bbq_tacos.png",
        "assets/Images/Recipes/Lunch/bechamel_chicken.png",
        "assets/Images/Recipes/Lunch/chicken_burger.png",
        "assets/Images/Recipes/Lunch/chicken_curry.png",
        "assets/Images/Recipes/Lunch/grilled_skewer.png",
        "assets/Images/Recipes/Lunch/pad_thai_chicken.png",
        "assets/Images/Recipes/Lunch/salami_pizza.png",
      ],
      text: [
        "Baked Chicken",
        "BBQ Tacos",
        "Chicken Burger",
        "Chicken Curry",
        "Delicious wings",
        "Mixed meat",
        "Eggs Benedict",
        "Eggs Benedict",
      ],
      text1: [
        "Delicious and juicy wings",
        "Mixed vegetables and meat",
        "Crunchy bread",
        "Rice Bowl",
        "Delicious and juicy wings",
        "Mixed vegetables and meat",
        "Eggs Benedict",
        "Eggs Benedict",
      ],
      CategoriesPageNum: ["5", "5", "4", "4", "3", "1", "8", "4"],
      CategoriesPageMinut: [
        "15min",
        "20min",
        "35min",
        "40min",
        "30min",
        "50min",
        "25min",
        "20min",
      ],
    ),
    CategoriesPageDinner(
      items: [
        "assets/Images/Categories/dinner.png",
        "assets/Images/Categories/meat.png",
        "assets/Images/Categories/cookies.png",
        "assets/Images/Categories/salads.png",
        "assets/Images/Categories/seafood.png",
        "assets/Images/Categories/italiano.png",
        "assets/Images/Allergic/milk.png",
        "assets/Images/Allergic/mustard.png",
      ],
      text: [
        "Baked Chicken",
        "BBQ Tacos",
        "Chicken Burger",
        "Chicken Curry",
        "Delicious wings",
        "Mixed meat",
        "Eggs Benedict",
        "Eggs Benedict",
      ],
      text1: [
        "Delicious and juicy wings",
        "Mixed vegetables and meat",
        "Crunchy bread",
        "Rice Bowl",
        "Delicious and juicy wings",
        "Mixed vegetables and meat",
        "Eggs Benedict",
        "Eggs Benedict",
      ],
      CategoriesPageNum: ["5", "5", "4", "4", "3", "1", "8", "4"],
      CategoriesPageMinut: [
        "15min",
        "20min",
        "35min",
        "40min",
        "30min",
        "50min",
        "25min",
        "20min",
      ],
    ),
    CategoriesPageVegan(
      items: [
        "assets/Images/Categories/dinner.png",
        "assets/Images/Categories/meat.png",
        "assets/Images/Categories/cookies.png",
        "assets/Images/Categories/salads.png",
        "assets/Images/Categories/seafood.png",
        "assets/Images/Categories/italiano.png",
        "assets/Images/Allergic/milk.png",
        "assets/Images/Allergic/mustard.png",
      ],
      text: [
        "Baked Chicken",
        "BBQ Tacos",
        "Chicken Burger",
        "Chicken Curry",
        "Delicious wings",
        "Mixed meat",
        "Eggs Benedict",
        "Eggs Benedict",
      ],
      text1: [
        "Delicious and juicy wings",
        "Mixed vegetables and meat",
        "Crunchy bread",
        "Rice Bowl",
        "Delicious and juicy wings",
        "Mixed vegetables and meat",
        "Eggs Benedict",
        "Eggs Benedict",
      ],
      CategoriesPageNum: ["5", "5", "4", "4", "3", "1", "8", "4"],
      CategoriesPageMinut: [
        "15min",
        "20min",
        "35min",
        "40min",
        "30min",
        "50min",
        "25min",
        "20min",
      ],
    ),
    CategoriesPageDessert(
      items: [
        "assets/Images/Recipes/Dessert/caramel_flan.png",
        "assets/Images/Recipes/Dessert/cheesecake.png",
        "assets/Images/Recipes/Dessert/chocolate_brownie.png",
        "assets/Images/Recipes/Dessert/fruit_crepes.png",
        "assets/Images/Recipes/Dessert/macarons.png",
        "assets/Images/Recipes/Dessert/nut_brownie.png",
        "assets/Images/Recipes/Dessert/palmer_pastry.png",
        "assets/Images/Recipes/Dessert/spring_cupcake.png",
      ],
      text: [
        "Baked Chicken",
        "BBQ Tacos",
        "Chicken Burger",
        "Chicken Curry",
        "Delicious wings",
        "Mixed meat",
        "Eggs Benedict",
        "Eggs Benedict",
      ],
      text1: [
        "Delicious and juicy wings",
        "Mixed vegetables and meat",
        "Crunchy bread",
        "Rice Bowl",
        "Delicious and juicy wings",
        "Mixed vegetables and meat",
        "Eggs Benedict",
        "Eggs Benedict",
      ],
      CategoriesPageNum: ["5", "5", "4", "4", "3", "1", "8", "4"],
      CategoriesPageMinut: [
        "15min",
        "20min",
        "35min",
        "40min",
        "30min",
        "50min",
        "25min",
        "20min",
      ],
    ),
    CategoriesPageDrinks(
      items: [
        "assets/Images/Recipes/Drinks/american_coffee.png",
        "assets/Images/Recipes/Drinks/coffee_latte.png",
        "assets/Images/Recipes/Drinks/craft_beer.png",
        "assets/Images/Recipes/Drinks/fruit_tea.png",
        "assets/Images/Recipes/Drinks/iced_coffee.png",
        "assets/Images/Recipes/Drinks/juice_fresh.png",
        "assets/Images/Recipes/Drinks/pina_colada.png",
        "assets/Images/Recipes/Drinks/snowy_coffee.png",
      ],
      text: [
        "Baked Chicken",
        "BBQ Tacos",
        "Chicken Burger",
        "Chicken Curry",
        "Delicious wings",
        "Mixed meat",
        "Eggs Benedict",
        "Eggs Benedict",
      ],
      text1: [
        "Delicious and juicy wings",
        "Mixed vegetables and meat",
        "Crunchy bread",
        "Rice Bowl",
        "Delicious and juicy wings",
        "Mixed vegetables and meat",
        "Eggs Benedict",
        "Eggs Benedict",
      ],
      CategoriesPageNum: ["5", "5", "4", "4", "3", "1", "8", "4"],
      CategoriesPageMinut: [
        "15min",
        "20min",
        "35min",
        "40min",
        "30min",
        "50min",
        "25min",
        "20min",
      ],
    ),
  ];

  List<String> titleAppBar = [
    "Breakfast",
    "Lunch",
    "Dinnar",
    "Vegan",
    "Dessert",
    "Drinks",
  ];


  List<String> tabBar = [
    "Breakfast",
    "Lunch",
    "Dinnar",
    "Vegan",
    "Dessert",
    "Drinks",
  ];



  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      child: Scaffold(
        extendBody: true,
        backgroundColor: colors().fonColor,
        appBar: AppBar(
          backgroundColor: Color(0xFF1C0F0D),
          elevation: 0,
          leading: IconButton(
            padding: EdgeInsets.only(left: 27),
            onPressed: () {
              Navigator.pop(context );
            },
            icon: SvgPicture.asset("assets/Icons/back-arrow.svg"),
          ),
          centerTitle: true,
          title: Text( titleAppBar[widget.activIndex],
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
              color: Color(0xFFFD5D69),
            ),
          ),
          actions: [
            IconButton(
              style: IconButton.styleFrom(
                fixedSize: Size(28, 28),
                backgroundColor: Color(0xFFFFC6C9),
              ),
              onPressed: () {},
              icon: SvgPicture.asset("assets/Icons/notification.svg"),
            ),
            IconButton(
              onPressed: () {},
              style: IconButton.styleFrom(
                fixedSize: Size(28, 28),
                backgroundColor: Color(0xFFFFC6C9),
              ),
              icon: SvgPicture.asset("assets/Icons/search.svg"),
            ),
            SizedBox(width: 27),
          ],
        ),
        bottomNavigationBar: RecipeNavigationBar(),
        body: Column(
          children: [
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 37.w),
              child: SizedBox(
                width: 405.w,
                height: 35.h,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 19.w,
                    children: [
                      ...List.generate(tabBar.length, (index) {
                        return TextButton(
                          onPressed: () {
                            widget.activIndex = index;
                            setState(() {});
                          },
                          style: TextButton.styleFrom(
                            minimumSize: Size(0, 35),
                            backgroundColor: widget.activIndex == index
                                ? colors().tabBar
                                : Colors.transparent,
                          ),
                          child: SizedBox(
                            height: 35,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                tabBar[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: widget.activIndex == index
                                      ? colors().colorsWhite
                                      : colors().tabBar,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Pages[widget.activIndex],
          ],
        ),
      ),
    );
  }
}
