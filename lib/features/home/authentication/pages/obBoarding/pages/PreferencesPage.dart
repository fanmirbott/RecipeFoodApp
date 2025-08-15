import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipefoodapp/core/cleint.dart';
import 'package:recipefoodapp/data/repositories/preferencesRepostory.dart';
import '../../../../../../core/utils/Appcolors.dart';
import '../../../../../managers/PreferencesViewModel.dart';
import '../widgets/PrefferencesBottom.dart';

class PreferencesPage extends StatelessWidget {
  final PageController controller;

  const PreferencesPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PreferencesViewModel(PreferencesRepository(ApiClient())),
      builder: (context, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Consumer<PreferencesViewModel>(
          builder: (context, vm, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 55),
              Text(
                "Select your cuisines preferences",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Appcolors().white,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                "Please select your cuisines preferences for better recommendations or skip it.",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: Appcolors().white,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  itemCount: vm.products.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(11.74),
                        child: Image.network(
                          vm.products[index]["image"],
                          width: 98,
                          height: 98,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        vm.products[index]["title"],
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Appcolors().white,
                        ),
                      ),
                    ],
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 21,
                  ),
                ),
              ),
              Row(
                spacing: 32,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PreferencesBottom(
                    iconButtonText: "Skip",
                    onPressed: () {},
                    buttonColor: Appcolors().pink,
                    textColor: Appcolors().pinkSub,
                  ),
                  PreferencesBottom(
                    iconButtonText: "Continue",
                    onPressed: () {
                      controller.nextPage(
                        duration: Duration(milliseconds: 300),
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
        ),
      ),
    );
  }
}
