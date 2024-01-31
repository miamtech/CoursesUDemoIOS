//
//  MealzViewConfig.swift
//  SampleUIKitIntegration
//
//  Created by Diarmuid McGonagle on 22/01/2024.
//

import Foundation
import CoursesUxMiamFramework
import MealzUIModuleIOS
import MiamIOSFramework
import MealzNavModuleIOS

struct MealzViewConfig {
    
    // ----------------------------- RECIPE DETAILS ------------------------------
    
    static let recipeDetailsBaseViews = BasePageViewParameters(
        loading: TypeSafeLoading(CoursesULoadingView())
    )
    static let recipeDetailsConfig = RecipeDetailsFeatureConstructor(
        baseViews: recipeDetailsBaseViews
    )
    
    // ------------------------------- MEAL PLANNER ------------------------------
    
    static let mealPlannerBaseViews = BasePageViewParameters(
        loading: TypeSafeLoading(CoursesULoadingView()),
        background: TypeSafeBackground(CoursesUBackgroundView())
    )
    static let mealPlannerFormView = MealPlannerFormViewOptions(
        form: TypeSafeMealPlannerForm(CoursesUMealPlannerForm())
    )
    static let mealPlannerResultsView = MealPlannerResultsViewOptions(
        toolbar: TypeSafeMealPlannerResultsToolbar(CoursesUMealPlannerToolbar()),
        footer: TypeSafeMealPlannerResultsFooter(CoursesUMealPlannerFooter()),
        recipeCard: TypeSafeMealPlannerRecipeCard(CoursesUMealPlannerRecipeCard()),
        recipeCardLoading: TypeSafeRecipeCardLoading(CoursesUMealPlannerRecipeCardLoading())
    )
    static let mealPlannerReplaceRecipeView = MealPlannerRecipePickerViewOptions(
        search: TypeSafeSearch(CoursesUMealPlannerSearch()),
        recipeCard: TypeSafeCatalogRecipeCard(CoursesURecipeCard()),
        recipeCardLoading: TypeSafeRecipeCardLoading(CoursesURecipeCardLoading())
    )
    static let mealPlannerBasketView = MealPlannerBasketViewOptions(
        footer: TypeSafeMealPlannerBasketFooter(CoursesUMealPlannerBasketPreviewFooter())
    )
    static let basketRecipeView = BasketRecipeViewOptions(
        recipeOverview: TypeSafeBasketRecipeOverview(CoursesUMealPlannerBasketPreviewRecipeOverview()),
        recipeOverviewLoading: TypeSafeRecipeCardLoading(MealzMealPlannerRecipeCardLoading()),
        basketProduct: TypeSafeBasketProduct(CoursesUMealPlannerBasketPreviewProduct()),
        ingredientsAtHomeToggleButton: TypeSafeBaseButton(CoursesUMealPlannerBasketPreviewSectionTitle()),
        removedIngredientsToggleButton: TypeSafeBaseButton(CoursesUMealPlannerBasketPreviewSectionTitle()),
        unavailableIngredientsToggleButton: TypeSafeBaseButton(CoursesUMealPlannerBasketPreviewSectionTitle()),
        ingredientsAtHome: TypeSafeNotInBasketProduct(CoursesUMealPlannerBasketPreviewSectionProduct()),
        removedIngredients: TypeSafeNotInBasketProduct(CoursesUMealPlannerBasketPreviewSectionProduct()),
        unavailableIngredients: TypeSafeNotInBasketProduct(CoursesUMealPlannerBasketPreviewSectionProduct())
    )
    static let mealPlannerRecapView = MealPlannerRecapViewOptions(
        success: TypeSafeMealPlannerRecap(CoursesUMealPlannerRecapView())
    )
    
    static let mealPlannerRecipesListGridConfig = MealPlannerRecipesListGridConfig(
        spacing: CGSize(width: 4, height: 4)
    )
    
    static let mealPlannerConfig = MealPlannerFeatureConstructor(
        baseViews: mealPlannerBaseViews,
        mealPlannerFormViewOptions: mealPlannerFormView,
        mealPlannerResultsViewOptions: mealPlannerResultsView,
        mealPlannerRecipePickerViewOptions: mealPlannerReplaceRecipeView,
        mealPlannerBasketViewOptions: mealPlannerBasketView,
        basketRecipeViewOptions: basketRecipeView,
        mealPlannerRecapViewOptions: mealPlannerRecapView,
        mealPlannerRecipesListGridConfig: mealPlannerRecipesListGridConfig
    )
}
