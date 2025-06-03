// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:food_recipes_afame/view/Subscription/subscription_view.dart';
import 'package:food_recipes_afame/core/colors.dart';
import 'package:food_recipes_afame/shared/commonWidgets.dart';
import 'package:get/get.dart';

class QuestionnairePage extends StatefulWidget {
  final String title;
  final String subtitle;
  final List<String> options;
  final int currentStep; // zero based index
  final int totalSteps;
  final VoidCallback onNext;

  const QuestionnairePage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.options,
    required this.currentStep,
    required this.totalSteps,
    required this.onNext,
  });

  @override
  State<QuestionnairePage> createState() => _QuestionnairePageState();
}

class _QuestionnairePageState extends State<QuestionnairePage> {
  int? selectedOptionIndex;

  @override
  Widget build(BuildContext context) {
    double progress = (widget.currentStep + 1) / widget.totalSteps;

    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: authAppBar(""),

      bottomSheet: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              value: progress,
              borderRadius: BorderRadius.circular(8),
              backgroundColor: Colors.grey.shade400,
              color: AppColors.primary,
              minHeight: 8,
            ),
            const SizedBox(height: 8),
            commonText(widget.title, size: 18, isBold: true),
            const SizedBox(height: 8),
            commonText(widget.subtitle, size: 14, color: Colors.black87),
            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: widget.options.length,
                itemBuilder: (context, index) {
                  final selected = index == selectedOptionIndex;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOptionIndex = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Card(
                        elevation: 2,
                        shadowColor: AppColors.primary,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color:
                                selected
                                    ? AppColors.primary.withOpacity(0.3)
                                    : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: AppColors.primary,

                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: commonText(
                                  widget.options[index],
                                  size: 16,
                                  color: Colors.black87,
                                ),
                              ),
                              Radio<int>(
                                value: index,
                                groupValue: selectedOptionIndex,
                                onChanged: (val) {
                                  setState(() {
                                    selectedOptionIndex = val;
                                  });
                                },
                                activeColor: AppColors.primary,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            commonButton(
              widget.currentStep == widget.totalSteps - 1
                  ? "Complete"
                  : "Continue",
              haveNextIcon: true,
              onTap:
                  selectedOptionIndex == null
                      ? () {
                        Get.snackbar("Empty", "Please sellect an option");
                      }
                      : () {
                        selectedOptionIndex = null;
                        widget.onNext();
                      },
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionnaireFlow extends StatefulWidget {
  bool fromSignup;
  QuestionnaireFlow({super.key, this.fromSignup = false});

  @override
  State<QuestionnaireFlow> createState() => _QuestionnaireFlowState();
}

class _QuestionnaireFlowState extends State<QuestionnaireFlow> {
  int currentStep = 0;

  final questions = [
    {
      "title": "Where are your culinary roots from?",
      "subtitle": "Select the region that represents your cultural heritage.",
      "options": [
        "Africa",
        "North Africa",
        "Middle East",
        "Europe",
        "Asia",
        "Latin America",
        "Caribbean",
      ],
    },
    {
      "title": "What's your favorite dish?",
      "subtitle": "Pick the dish you enjoy the most.",
      "options": [
        "Mafé",
        "Poulet yassa",
        "Tajine",
        "Couscous",
        "Colombo de poulet",
        "Empanadas",
        "Autre",
      ],
    },
    {
      "title": "What's your goal with our app?",
      "subtitle": "Choose the main reason you want to use Roots & Recipes.",
      "options": [
        "Rediscover my culinary culture",
        "Learn how to cook new dishes",
        "Prepare menus for my family",
        "Cook more easily on a daily basis",
        "Eat healthier without losing my roots",
      ],
    },
    {
      "title": "How often do you cook?",
      "subtitle": "Select your cooking frequency.",
      "options": ["Every day", "A few times a week", "Occasionally"],
    },
  ];

  void nextStep() {
    if (currentStep < questions.length - 1) {
      setState(() {
        currentStep++;
      });
    } else {
      if (widget.fromSignup) {
        navigateToPage(SubscriptionView(fromSignup: widget.fromSignup));
      } else {
        Get.back();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final q = questions[currentStep];
    q['subtitle'] ??= "Please select an option";
    return QuestionnairePage(
      title: q['title']!.toString(),
      subtitle: q['subtitle']!.toString(),
      options: List<String>.from(q['options']! as List),
      currentStep: currentStep,
      totalSteps: questions.length,
      onNext: nextStep,
    );
  }
}
