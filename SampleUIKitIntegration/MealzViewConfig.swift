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
    
    // ------------------------------- BASE VIEWS  -------------------------------
    
    static let baseViews = BasePageViewParameters(
        loading: TypeSafeLoading(CoursesUMealPlannerLoading())
//        ,
//        background: TypeSafeBackground(CoursesUBackground())
    )
    
    // ----------------------------- RECIPE DETAILS ------------------------------
    
    
    static let recipeDetailsConfig = RecipeDetailsFeatureConstructor()
    
    // ------------------------------- MEAL PLANNER ------------------------------
    
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
    static let basketProducts = BasketRecipeViewOptions(
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
    
    static let mealPlannerConfig = MealPlannerFeatureConstructor(
        mealPlannerFormViewOptions: mealPlannerFormView
    )
}
