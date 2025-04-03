import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe/core/routing/routes.dart';
import 'package:recipe/features/recipe_create/managers/recipe_create_bloc.dart';
import 'package:recipe/features/recipe_create/pages/recipe_create_view.dart';
import 'package:recipe/features/reviews/managers/create_review/create_review_bloc.dart';
import 'package:recipe/features/reviews/managers/reviews/reviews_bloc.dart';
import 'package:recipe/features/reviews/pages/create_review_view.dart';
import 'package:recipe/features/reviews/pages/reviews_view.dart';
import 'package:recipe/features/top_chefs/managers/top_chefs_bloc.dart';
import 'package:recipe/features/top_chefs/pages/top_chefs_view.dart';

import '../../features/authentication/pages/complete_profile_view.dart';
import '../../features/authentication/pages/login_view.dart';
import '../../features/authentication/pages/sign_up_view.dart';
import '../../features/categories/managers/categories_cubit.dart';
import '../../features/categories/pages/categories_view.dart';
import '../../features/category_detail/manager/category_detail_view_model.dart';
import '../../features/category_detail/pages/category_detail_view.dart';
import '../../features/community/manager/community_cubit.dart';
import '../../features/community/pages/community_view.dart';
import '../../features/home/manager/home_view_model.dart';
import '../../features/home/pages/home_view.dart';
import '../../features/onboarding/managers/onboarding_view_model.dart';
import '../../features/onboarding/pages/onboarding_view.dart';
import '../../features/recipe_detail/manager/recipe_detail_view_model.dart';
import '../../features/recipe_detail/pages/recipe_detail_view.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: Routes.recipeCreate,
  routes: [
    GoRoute(
      path: Routes.login,
      builder: (context, state) {
        return LoginView();
      },
    ),
    GoRoute(
      path: Routes.signUp,
      builder: (context, state) => SignUpView(),
    ),
    GoRoute(
      path: Routes.complete,
      builder: (context, state) => CompleteProfileView(),
    ),
    GoRoute(
      path: Routes.onboarding,
      builder: (context, state) => OnboardingView(
        vm: OnboardingViewModel(
          repo: context.read(),
        ),
      ),
    ),
    GoRoute(
      path: Routes.home,
      pageBuilder: (context, state) => CustomTransitionPage(
        transitionDuration: Duration(milliseconds: 2000),
        child: BlocProvider(
          create: (context) => HomeBloc(
            catRepo: context.read(),
            recipeRepo: context.read(),
            chefRepo: context.read(),
          ),
          child: HomeView(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curve = CurvedAnimation(parent: animation, curve: Curves.easeInExpo);
          return RotationTransition(
            turns: Tween<double>(begin: 0.7, end: 1).animate(curve),
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      path: Routes.community,
      builder: (context, state) => BlocProvider(
        create: (context) => CommunityCubit(recipeRepo: context.read()),
        child: CommunityView(),
      ),
    ),
    GoRoute(
      path: Routes.categories,
      builder: (context, state) => BlocProvider(
        create: (context) => CategoriesBloc(catRepo: context.read()),
        child: CategoriesView(),
      ),
    ),
    GoRoute(
      path: Routes.categoryDetail,
      pageBuilder: (context, state) => CustomTransitionPage(
        child: BlocProvider(
          create: (context) => CategoryDetailBloc(
            catRepo: context.read(),
            recipeRepo: context.read(),
            selectedId: int.parse(state.pathParameters['categoryId']!),
          ),
          child: CategoryDetailView(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) => ScaleTransition(
          scale: Tween<double>(begin: 0, end: 1).animate(animation),
          child: child,
        ),
      ),
    ),
    GoRoute(
      path: Routes.recipeDetail,
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => RecipeDetailViewModel(
          recipeRepo: context.read(),
          recipeId: int.parse(state.pathParameters['recipeId']!),
        ),
        child: RecipeDetailView(),
      ),
    ),
    GoRoute(
      path: Routes.reviews,
      builder: (context, state) => BlocProvider(
        create: (context) => ReviewsBloc(
          recipeRepo: context.read(),
          reviewRepo: context.read(),
          recipeId: int.parse(state.pathParameters['recipeId']!),
        ),
        child: ReviewsView(),
      ),
    ),
    GoRoute(
      path: Routes.createReview,
      builder: (context, state) => BlocProvider(
        create: (context) => CreateReviewBloc(
          recipeRepo: context.read(),
          reviewRepo: context.read(),
        )..add(CreateReviewLoading(recipeId: int.parse(state.pathParameters['recipeId']!))),
        child: CreateReviewView(),
      ),
    ),
    GoRoute(
      path: Routes.topChefs,
      builder: (context, state) => BlocProvider(
        create: (context) => TopChefsBloc(
          chefRepo: context.read(),
        ),
        child: TopChefsView(),
      ),
    ),
    GoRoute(
      path: Routes.recipeCreate,
      builder: (context, state) => BlocProvider(
        create: (context) => RecipeCreateBloc(),
        child: RecipeCreateView(),
      ),
    )
  ],
);
