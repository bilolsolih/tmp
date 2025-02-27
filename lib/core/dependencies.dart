import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../features/categories/data/repositories/category_repository.dart';
import '../features/category_detail/data/repositories/recipe_repository.dart';
import 'client.dart';

final List<SingleChildWidget> providers = [
  Provider(
    create: (context) => ApiClient(),
  ),
  Provider(
    create: (context) => CategoryRepository(client: context.read()),
  ),
  Provider(
    create: (context) => RecipeRepository(client: context.read()),
  ),
];
