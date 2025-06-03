import 'package:flutter/material.dart';
import 'package:food_recipes_afame/view/Authentication/role_choose_view.dart';
import 'package:food_recipes_afame/core/image_paths.dart';
import 'package:food_recipes_afame/shared/commonWidgets.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _controller = PageController();
  int currentPage = 0;
  final int totalPages = 3;
  final List<Map<String, String>> onboardingData = [
    {
      "image": ImagePaths.onboarding1,
      "title": "Explore Best and\nHealthy Food Recipe.",
      "subtitle":
          "Dive into a world of culinary delights with our extensive collection of nutritious and delicious recipes",
    },
    {
      "image": ImagePaths.onboarding2,
      "title": "Customize Your\nExperience.",
      "subtitle":
          "Tailor your app experience by selecting your dietary preferences and favorite cuisines for personalized recipe recommendations.",
    },
    {
      "image": ImagePaths.onboarding3,
      "title": "Get Started!",
      "subtitle":
          "To personalize your experience, we just need a few details. Sign up and let’s get cooking!\n\n\n",
    },
  ];

  void _goToNextPage() {
    if (currentPage < totalPages - 1) {
      _controller.animateToPage(
        currentPage + 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      navigateToPage(RoleChooseView());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: onboardingData.length,
        onPageChanged: (index) => setState(() => currentPage = index),
        itemBuilder: (context, index) {
          final data = onboardingData[index];
          return Stack(
            children: [
              SizedBox.expand(
                child: Image.asset(data["image"]!, fit: BoxFit.cover),
              ),
              Container(color: Colors.black.withOpacity(0.5)),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 60),
                      Image.asset(ImagePaths.logo),
                      const Spacer(),
                      Row(
                        children: List.generate(
                          onboardingData.length,
                          (i) => Container(
                            margin: const EdgeInsets.only(right: 6),
                            height: 6,
                            width: i == currentPage ? 24 : 8,
                            decoration: BoxDecoration(
                              color:
                                  i == currentPage
                                      ? Colors.orange
                                      : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: commonText(
                          data["title"]!,
                          size: 26,
                          isBold: true,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: commonText(
                          data["subtitle"]!,
                          size: 14,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                      const SizedBox(height: 24),
                      commonButton(
                        "Explore Recipe",

                        haveNextIcon: true,
                        onTap: _goToNextPage,
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
