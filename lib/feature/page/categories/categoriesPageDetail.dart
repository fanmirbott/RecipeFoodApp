import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodapp/feature/AppDetails/recipe_navigation_bar.dart';
import 'package:foodapp/feature/page/categories/LunchDetails/categoriesPageLunch.dart';
import 'package:foodapp/feature/page/categories/BreakfastDetails/categories_page_breakfast_state.dart';
import 'package:foodapp/feature/page/categories/categories_page_dessert.dart';
import 'package:foodapp/feature/page/categories/categories_page_dinner.dart';
import 'package:foodapp/feature/page/categories/categories_page_drinks.dart';
import 'package:foodapp/feature/page/categories/categories_page_vegan..dart';
import 'package:foodapp/utils/colors.dart';
import 'BreakfastDetails/breakfast_details.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: "http://192.168.10.161/",
    validateStatus: (status) => true,
  ),
);

Future<List> fetchCategories() async {
  var response = await dio.get("api/v1/recipes/list");
  if (response.statusCode != 200) {
    throw Exception(response.data);
  }
  return response.data;
}
class CategoriesPageDetail extends StatefulWidget {
  CategoriesPageDetail({super.key, required this.activIndex});

  int activIndex;

  @override
  State<CategoriesPageDetail> createState() => _CategoriesPageDetailState();
}

class _CategoriesPageDetailState extends State<CategoriesPageDetail> {

  late List<int> likeStatus;



  Widget likeImg = Image.asset(
    "assets/Icons/Like/like.png",
    width: 28,
    height: 28,
  );
  Widget deslikeImg = Image.asset(
    "assets/Icons/Like/deslike.png",
    width: 28,
    height: 28,
  );

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
    return FutureBuilder(
      future: fetchCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("Something went wrong: ${snapshot.error}"),
            ),
          );
        } else if (snapshot.hasData) {
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
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset("assets/Icons/back-arrow.svg"),
                ),
                centerTitle: true,
                title: Text(
                  titleAppBar[widget.activIndex],
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
              body: GridView.builder(
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
                          builder: (context) => BreakfastDetails(
                            Breakfastmage:
                            "assets/Images/Recipes/Breakfast/eggs_benedict.png",
                            ImgText: "Pancake & Cream",
                            StarsNum: "4",
                            ReviewsNum: "2.273",
                            CheffImg: "assets/Images/ChefProfiles/ryan.png",
                            CheffUser: "@josh-ryan",
                            CheffName: "Josh Ryan-Chef",
                            DetailsText:
                            "Fluffy pancakes served with silky whipped cream, a classic breakfast indulgence perfect for a leisurely morning treat.",
                            ingredientsText: [
                              "cup all-purpose flour",
                              "tablespoons granulated sugar",
                              "teaspoon baking powder",
                              "teaspoon baking soda",
                              "teaspoon salt",
                              "nimadur",
                              "yana nimadur",
                              "fghfdgh",
                              "fghrh",
                            ],
                            ingredientsNum: [
                              "1",
                              "2",
                              "1",
                              "1/2",
                              "1/4",
                              "2",
                              "1",
                              "1",
                              "2",
                            ],
                          ),
                        ),
                      );
                      setState(() {});
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
                                        snapshot.data![index]["title"].toString(),
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: colors().textStyleColor,
                                        ),
                                      ),
                                      Text(
                                        snapshot.data![index]["title"],
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300,
                                          color: colors().textStyleColor,
                                        ),
                                      ),
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
                                                    snapshot.data![index]["rating"],
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
                                                    snapshot.data![index]["timeRequired"],
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
                                child: Image.network(
                                  snapshot.data![index]["photo"],
                                  fit: BoxFit.cover,
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
        } else {
          return Scaffold(
            body: Center(child: Text("Something went wrong... Again...")),
          );
        }
      },
    );
  }
}

// Positioned(
// top: 8,
// right: 8,
// child: GestureDetector(
// onTap: () {
// setState(() {
// likeStatus[index] = likeStatus[index] == 0
// ? 1
//     : 0;
// });
// },
// child: Image.asset(
// likeStatus[index] == 1
// ? "assets/Icons/Like/like.png"
//     : "assets/Icons/Like/deslike.png",
// width: 28,
// height: 28,
// ),
// ),
// ),

// List<Widget> Pages = [
//   CategoriesPageBreakfastState(
//     items: [
//       "assets/Images/Recipes/Breakfast/eggs_benedict.png",
//       "assets/Images/Recipes/Breakfast/french_toast.png",
//       "assets/Images/Recipes/Breakfast/oatmeal_and_nut.png",
//       "assets/Images/Recipes/Breakfast/oatmeal_granola.png",
//       "assets/Images/Recipes/Breakfast/omelette_cheese.png",
//       "assets/Images/Recipes/Breakfast/still_life_potato.png",
//       "assets/Images/Recipes/Breakfast/sunny_bruschetta.png",
//       "assets/Images/Recipes/Breakfast/tofu_sandwich.png",
//     ],
//     text: [
//       "Eggs Benedict",
//       "French Toast",
//       "Oatmeal and Nut ",
//       "Still Life Potato",
//       "Baked Chicken",
//       "Eggs Benedict",
//       "Eggs Benedict",
//       "Eggs Benedict",
//     ],
//     text1: [
//       "Muffin with Canadian bacon",
//       "Delicious slices of bread",
//       "Wholesome blend for breakfast",
//       "Earthy, textured, rustic charm",
//       "Delicious and juicy wings",
//       "Mixed vegetables and meat",
//       "Eggs Benedict",
//       "Eggs Benedict",
//     ],
//     CategoriesPageNum: ["5", "5", "4", "4", "3", "1", "8", "4"],
//     CategoriesPageMinut: [
//       "15min",
//       "20min",
//       "35min",
//       "40min",
//       "30min",
//       "50min",
//       "25min",
//       "20min",
//     ],
//   ),
//   CategoriesPageLunch(
//     items: [
//       "assets/Images/Recipes/Lunch/baked_chicken.png",
//       "assets/Images/Recipes/Lunch/bbq_tacos.png",
//       "assets/Images/Recipes/Lunch/bechamel_chicken.png",
//       "assets/Images/Recipes/Lunch/chicken_burger.png",
//       "assets/Images/Recipes/Lunch/chicken_curry.png",
//       "assets/Images/Recipes/Lunch/grilled_skewer.png",
//       "assets/Images/Recipes/Lunch/pad_thai_chicken.png",
//       "assets/Images/Recipes/Lunch/salami_pizza.png",
//     ],
//     text: [
//       "Baked Chicken",
//       "BBQ Tacos",
//       "Chicken Burger",
//       "Chicken Curry",
//       "Delicious wings",
//       "Mixed meat",
//       "Eggs Benedict",
//       "Eggs Benedict",
//     ],
//     text1: [
//       "Delicious and juicy wings",
//       "Mixed vegetables and meat",
//       "Crunchy bread",
//       "Rice Bowl",
//       "Delicious and juicy wings",
//       "Mixed vegetables and meat",
//       "Eggs Benedict",
//       "Eggs Benedict",
//     ],
//     CategoriesPageNum: ["5", "5", "4", "4", "3", "1", "8", "4"],
//     CategoriesPageMinut: [
//       "15min",
//       "20min",
//       "35min",
//       "40min",
//       "30min",
//       "50min",
//       "25min",
//       "20min",
//     ],
//   ),
//   CategoriesPageDinner(
//     items: [
//       "assets/Images/Categories/dinner.png",
//       "assets/Images/Categories/meat.png",
//       "assets/Images/Categories/cookies.png",
//       "assets/Images/Categories/salads.png",
//       "assets/Images/Categories/seafood.png",
//       "assets/Images/Categories/italiano.png",
//       "assets/Images/Allergic/milk.png",
//       "assets/Images/Allergic/mustard.png",
//     ],
//     text: [
//       "Baked Chicken",
//       "BBQ Tacos",
//       "Chicken Burger",
//       "Chicken Curry",
//       "Delicious wings",
//       "Mixed meat",
//       "Eggs Benedict",
//       "Eggs Benedict",
//     ],
//     text1: [
//       "Delicious and juicy wings",
//       "Mixed vegetables and meat",
//       "Crunchy bread",
//       "Rice Bowl",
//       "Delicious and juicy wings",
//       "Mixed vegetables and meat",
//       "Eggs Benedict",
//       "Eggs Benedict",
//     ],
//     CategoriesPageNum: ["5", "5", "4", "4", "3", "1", "8", "4"],
//     CategoriesPageMinut: [
//       "15min",
//       "20min",
//       "35min",
//       "40min",
//       "30min",
//       "50min",
//       "25min",
//       "20min",
//     ],
//   ),
//   CategoriesPageVegan(
//     items: [
//       "assets/Images/Categories/dinner.png",
//       "assets/Images/Categories/meat.png",
//       "assets/Images/Categories/cookies.png",
//       "assets/Images/Categories/salads.png",
//       "assets/Images/Categories/seafood.png",
//       "assets/Images/Categories/italiano.png",
//       "assets/Images/Allergic/milk.png",
//       "assets/Images/Allergic/mustard.png",
//     ],
//     text: [
//       "Baked Chicken",
//       "BBQ Tacos",
//       "Chicken Burger",
//       "Chicken Curry",
//       "Delicious wings",
//       "Mixed meat",
//       "Eggs Benedict",
//       "Eggs Benedict",
//     ],
//     text1: [
//       "Delicious and juicy wings",
//       "Mixed vegetables and meat",
//       "Crunchy bread",
//       "Rice Bowl",
//       "Delicious and juicy wings",
//       "Mixed vegetables and meat",
//       "Eggs Benedict",
//       "Eggs Benedict",
//     ],
//     CategoriesPageNum: ["5", "5", "4", "4", "3", "1", "8", "4"],
//     CategoriesPageMinut: [
//       "15min",
//       "20min",
//       "35min",
//       "40min",
//       "30min",
//       "50min",
//       "25min",
//       "20min",
//     ],
//   ),
//   CategoriesPageDessert(
//     items: [
//       "assets/Images/Recipes/Dessert/caramel_flan.png",
//       "assets/Images/Recipes/Dessert/cheesecake.png",
//       "assets/Images/Recipes/Dessert/chocolate_brownie.png",
//       "assets/Images/Recipes/Dessert/fruit_crepes.png",
//       "assets/Images/Recipes/Dessert/macarons.png",
//       "assets/Images/Recipes/Dessert/nut_brownie.png",
//       "assets/Images/Recipes/Dessert/palmer_pastry.png",
//       "assets/Images/Recipes/Dessert/spring_cupcake.png",
//     ],
//     text: [
//       "Baked Chicken",
//       "BBQ Tacos",
//       "Chicken Burger",
//       "Chicken Curry",
//       "Delicious wings",
//       "Mixed meat",
//       "Eggs Benedict",
//       "Eggs Benedict",
//     ],
//     text1: [
//       "Delicious and juicy wings",
//       "Mixed vegetables and meat",
//       "Crunchy bread",
//       "Rice Bowl",
//       "Delicious and juicy wings",
//       "Mixed vegetables and meat",
//       "Eggs Benedict",
//       "Eggs Benedict",
//     ],
//     CategoriesPageNum: ["5", "5", "4", "4", "3", "1", "8", "4"],
//     CategoriesPageMinut: [
//       "15min",
//       "20min",
//       "35min",
//       "40min",
//       "30min",
//       "50min",
//       "25min",
//       "20min",
//     ],
//   ),
//   CategoriesPageDrinks(
//     items: [
//       "assets/Images/Recipes/Drinks/american_coffee.png",
//       "assets/Images/Recipes/Drinks/coffee_latte.png",
//       "assets/Images/Recipes/Drinks/craft_beer.png",
//       "assets/Images/Recipes/Drinks/fruit_tea.png",
//       "assets/Images/Recipes/Drinks/iced_coffee.png",
//       "assets/Images/Recipes/Drinks/juice_fresh.png",
//       "assets/Images/Recipes/Drinks/pina_colada.png",
//       "assets/Images/Recipes/Drinks/snowy_coffee.png",
//     ],
//     text: [
//       "Baked Chicken",
//       "BBQ Tacos",
//       "Chicken Burger",
//       "Chicken Curry",
//       "Delicious wings",
//       "Mixed meat",
//       "Eggs Benedict",
//       "Eggs Benedict",
//     ],
//     text1: [
//       "Delicious and juicy wings",
//       "Mixed vegetables and meat",
//       "Crunchy bread",
//       "Rice Bowl",
//       "Delicious and juicy wings",
//       "Mixed vegetables and meat",
//       "Eggs Benedict",
//       "Eggs Benedict",
//     ],
//     CategoriesPageNum: ["5", "5", "4", "4", "3", "1", "8", "4"],
//     CategoriesPageMinut: [
//       "15min",
//       "20min",
//       "35min",
//       "40min",
//       "30min",
//       "50min",
//       "25min",
//       "20min",
//     ],
//   ),
// ];
