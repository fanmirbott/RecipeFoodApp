import 'package:flutter/cupertino.dart';
import 'package:recipefoodapp/core/utils/result.dart';
import 'package:recipefoodapp/data/models/Cuisene_model_recipe.dart';
import '../../data/repositories/categories_detail_repostory.dart';

class CategoriesProviderDetail extends ChangeNotifier {
  final CategoriesDetailRepository _repository;
   int categoryId;


  CategoriesProviderDetail({
    required CategoriesDetailRepository repository,
    required this.categoryId,
  }) : _repository = repository {
    getCategoriesDetail();
    getCategories();
  }

  bool isLoading = false;
  List<CuisineModelRecipe> productsDetail = [];
  List categories = [];

  Future<void> getCategoriesDetail() async {
    isLoading = true;
    notifyListeners();
    final result = await _repository.getCategoriesDetail(categoryId);
    result.fold(
          (error) => Result.error(error),
          (value) => productsDetail = value,
    );
    isLoading = false;
    notifyListeners();
  }

  Future<void> getCategories() async {
    isLoading = true;
    notifyListeners();
    final result = await _repository.getCategories();
    result.fold(
      (error) => Result.error(error),
      (value) => categories = value,
    );

    isLoading = false;
    notifyListeners();
  }
}
