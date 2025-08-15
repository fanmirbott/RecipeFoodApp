import 'package:flutter/cupertino.dart';
import 'package:recipefoodapp/data/models/Cuisene_model_recipe.dart';
import '../../data/repositories/categories_detail_repostory.dart';

class CategoriesProviderDetail extends ChangeNotifier {
  final CategoriesDetailRepository _repository;
  late final int categoryId;

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

    productsDetail = (await _repository.getCategoriesDetail(categoryId)) as List<CuisineModelRecipe>;

    isLoading = false;
    notifyListeners();
  }

  Future<void> getCategories() async {
    isLoading = true;
    notifyListeners();

    categories = (await _repository.getCategories()) as List;

    isLoading = false;
    notifyListeners();
  }
}
