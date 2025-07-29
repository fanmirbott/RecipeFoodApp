import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapp/feature/AppDetails/recipe_app_bar.dart';
import 'package:foodapp/feature/page/categories/categoriesPageDetail.dart';
import 'package:foodapp/feature/AppDetails/recipe_navigation_bar.dart';
import 'package:foodapp/utils/colors.dart';
import 'BreakfastDetails/categories_page_breakfast_state.dart';
import 'LunchDetails/categoriesPageLunch.dart';
import 'categories_page_dessert.dart';
import 'categories_page_dinner.dart';
import 'categories_page_drinks.dart';
import 'categories_page_vegan..dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final List<String> items = [
    "assets/Images/Categories/lunch.png",
    "assets/Images/Categories/breakfast.png",
    "assets/Images/Categories/dinner.png",
    "assets/Images/Categories/vegan.png",
    "assets/Images/Categories/dessert.png",
    "assets/Images/Categories/drinks.png",
    "assets/Images/Categories/drinks.png",
    "assets/Images/Categories/drinks.png",
    "assets/Images/Categories/drinks.png",
    "assets/Images/Categories/drinks.png",
  ];
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
  final List<String> text = [
    "Breakfast",
    "Lunch",
    "Dinner",
    "Vegan",
    "Dessert",
    "Drinks",
    "Drinks",
    "Drinks",
    "Drinks",
    "Drinks",
  ];

  int activCategore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: colors().fonColor,
      appBar: RecipeAppBar(),
      bottomNavigationBar: RecipeNavigationBar(),
      body: Padding(
        padding: EdgeInsets.only(right: 16.w, left: 16.w),
        child: GridView.builder(
          itemCount: items.length,
          padding: EdgeInsets.only(bottom: 80.h),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.h,
            crossAxisSpacing: 8.w,
          ),
          itemBuilder: (context, index) {
            return Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.61.r),
                  child: InkWell(
                    onTap: () {
                      activCategore = index;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoriesPageDetail(activIndex: index,),
                        ),
                      );
                      setState(() {});
                    },
                    child: Image.asset(
                      items[index],
                      width: 158.w,
                      height: 144.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  text[index],
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.61.sp,
                    color: Colors.white,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
