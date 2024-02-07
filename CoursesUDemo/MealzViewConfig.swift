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
    static let recipeDetailsViews = RecipeDetailsViewOptions(
        footer: TypeSafeRecipeDetailsFooter(CoursesURecipeDetailsFooterView())
    )
    static let recipeDetailsConfig = RecipeDetailsFeatureConstructor(
        baseViews: recipeDetailsBaseViews,
        recipeDetailsViewOptions: recipeDetailsViews
    )
    
    // -------------------------------- CATALOG ----------------------------------
    
    static let catalogView = CatalogViewOptions(
        catalogToolbar: TypeSafeCatalogToolbar(CoursesUCatalogToolbar()),
        resultsToolbar: TypeSafeCatalogToolbar(CoursesUCatalogResultsToolbar())
    )
    
    static let catalogPackageView = CatalogPackageRowViewOptions(
        callToAction: TypeSafeCatalogPackageCTA(CoursesUCatalogPackageCTA())
//        ,recipeCard: TypeSafeCatalogRecipeCard(CoursesURecipeCard())
    )
    
    static let recipesListView = CatalogRecipesListViewOptions(
//        recipeCard: TypeSafeCatalogRecipeCard(CoursesURecipeCard())
    )
    
    static let catalogConfig = CatalogFeatureConstructor(
        usesPreferences: false,
        catalogViewOptions: catalogView,
        recipesListViewOptions: recipesListView,
        packageRowViewOptions: catalogPackageView
//        catalogSearchViewOptions: catalogSearchView,
//        catalogViewGridConfig: catalogViewGridConfig,
//        catalogResultsGridConfig: catalogResultsGridConfig
    )
    
    // -------------------------------- FAVORITES ----------------------------------
    
    /* pass in your nav to the catalog here! */
    static let showCatalog = {}
    
    static let favoritesView = FavoritesViewOptions(
//        recipeCard: TypeSafeCatalogRecipeCard(CoursesURecipeCard())
    )
    
    static let favoritesConfig = FavoritesFeatureConstructor(
        favoritesViewOptions: favoritesView,
        navigateToCatalog: showCatalog
    )
    
    // ---------------------------------- MY MEALS ----------------------------------
    
    static let myMealsView = MyMealsViewOptions(
//        recipeCard: TypeSafeMyMealRecipeCard(CoursesUMyMealRecipeCard()),
//        recipeCardLoading: TypeSafeRecipeCardLoading(FranprixRecipeCardLoading())
    )
    
    static let myMealsConfig = MyMealsFeatureConstructor(
        myMealsViewOptions: myMealsView,
//        catalogRecipesListGridConfig: myMealsGridConfig,
        navigateToCatalog: showCatalog
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
        recipeCardLoading: TypeSafeRecipeCardLoading(CoursesUMealPlannerRecipeCardLoading()),
        placeholder: TypeSafeMealPlannerRecipePlaceholder(CoursesUMealPlannerRecipePlaceholder())
    )
    static let mealPlannerReplaceRecipeView = MealPlannerRecipePickerViewOptions(
        search: TypeSafeSearch(CoursesUMealPlannerSearch()),
        noResults: TypeSafeCatalogRecipesListNoResults(CoursesUMealPlannerRecipePickerNoResults()),
        recipeCard: TypeSafeCatalogRecipeCard(CoursesURecipePickerRecipeCard())
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
