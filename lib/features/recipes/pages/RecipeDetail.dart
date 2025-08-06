import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipefoodapp/features/onBoarding/managers/CategoriesDetailProvider.dart';
import 'package:recipefoodapp/utils/Appcolors.dart';
class RecipeDetail extends StatelessWidget {
  const RecipeDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Categories_provider_Detail(categoryId: selec),
      child: Consumer<Categories_provider_Detail>(
        builder: (context, vm, child) => Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 36),
            child: SizedBox(
              width: 357,
              height: 337,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 357,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusGeometry.circular(10),
                          color: Appcolors().redpinkmain
                      ),
                    ),
                  ),
                  Image.network()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
