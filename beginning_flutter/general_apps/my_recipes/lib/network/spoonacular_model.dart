import 'package:json_annotation/json_annotation.dart';
import '../data/models/models.dart';
part 'spoonacular_model.g.dart';

@JsonSerializable()
class SpoonacularResults {
  final List<SpoonacularResult> results;
  final int offset;
  final int number;
  final int totalResults;

  SpoonacularResults({
    required this.results,
    required this.offset,
    required this.number,
    required this.totalResults,
  });

  factory SpoonacularResults.fromJson(Map<String, dynamic> json) =>
      _$SpoonacularResultsFromJson(json);
  Map<String, dynamic> toJson() => _$SpoonacularResultsToJson(this);
}

@JsonSerializable()
class SpoonacularResult {
  final int id;
  final String title;
  final String image;
  final String imageType;

  SpoonacularResult({
    required this.id,
    required this.title,
    required this.image,
    required this.imageType,
  });

  factory SpoonacularResult.fromJson(Map<String, dynamic> json) =>
      _$SpoonacularResultFromJson(json);

  Map<String, dynamic> toJson() => _$SpoonacularResultToJson(this);
}

@JsonSerializable()
class SpoonacularRecipe {
  int preparationMinutes;
  int cookingMinutes;
  String sourceName;
  List<ExtendedIngredient> extendedIngredients;
  int id;
  String title;
  int readyInMinutes;
  int servings;
  String sourceUrl;
  String image;
  String imageType;
  String summary;
  String? instructions;

  SpoonacularRecipe({
    required this.preparationMinutes,
    required this.cookingMinutes,
    required this.sourceName,
    required this.extendedIngredients,
    required this.id,
    required this.title,
    required this.readyInMinutes,
    required this.servings,
    required this.sourceUrl,
    required this.image,
    required this.imageType,
    required this.summary,
    this.instructions,
  });
  factory SpoonacularRecipe.fromJson(Map<String, dynamic> json) =>
      _$SpoonacularRecipeFromJson(json);

  Map<String, dynamic> toJson() => _$SpoonacularRecipeToJson(this);
}

@JsonSerializable()
class ExtendedIngredient {
  int id;
  String? aisle;
  String? image;
  String name;
  String? nameClean;
  String original;
  String? originalName;
  double amount;
  String unit;

  ExtendedIngredient({
    required this.id,
    required this.aisle,
    required this.image,
    required this.name,
    required this.nameClean,
    required this.original,
    required this.originalName,
    required this.amount,
    required this.unit,
  });
  factory ExtendedIngredient.fromJson(Map<String, dynamic> json) =>
      _$ExtendedIngredientFromJson(json);

  Map<String, dynamic> toJson() => _$ExtendedIngredientToJson(this);
}

/// Methods to convert network recipes into local recipes
List<Recipe> spoonacularResultsToRecipe(SpoonacularResults result) {
  final recipes = <Recipe>[];
  for (final result in result.results) {
    recipes.add(spoonacularToRecipe(result));
  }
  return recipes;
}

Recipe spoonacularToRecipe(SpoonacularResult result) {
  return Recipe(
      id: result.id,
      image: result.image,
      label: result.title,
      bookmarked: false,
      ingredients: const <Ingredient>[],
      description: result.title);
}

Recipe spoonacularRecipeToRecipe(SpoonacularRecipe spoonacularRecipe) {
  final ingredients = <Ingredient>[];
  for (final ingredient in spoonacularRecipe.extendedIngredients) {
    ingredients.add(Ingredient(
        id: ingredient.id,
        name: ingredient.name,
        amount: ingredient.amount,
        recipeId: spoonacularRecipe.id));
  }
  return Recipe(
    id: spoonacularRecipe.id,
    label: spoonacularRecipe.title,
    image: spoonacularRecipe.image,
    bookmarked: false,
    description: spoonacularRecipe.summary,
    ingredients: ingredients,
  );
}
