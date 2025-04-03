
import '../../core/client.dart';
import '../models/onboarding_page_model.dart';

class OnboardingRepository {
  OnboardingRepository({required this.client});

  final ApiClient client;

  List<OnboardingPageModel> pages = [];

  Future<List<OnboardingPageModel>> fetchOnboardingPages() async {
    var rawPages = await client.genericGetRequest<List<dynamic>>("/onboarding/list");
    pages = rawPages.map((page) => OnboardingPageModel.fromJson(page)).toList();
    pages.sort(
      (a, b) {
        if (a.order < b.order) {
          return -1;
        } else if (a.order > b.order) {
          return 1;
        } else {
          return 0;
        }
      },
    );
    return pages;
  }


}
