import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes_afame/controller/create_recipe.dart';
import 'package:food_recipes_afame/utils/colors.dart';
import 'package:food_recipes_afame/utils/image_paths.dart';
import 'package:food_recipes_afame/view/shared/commonWidgets.dart';
import 'package:get/get.dart';

class CreateRecipeView extends StatefulWidget {
  const CreateRecipeView({super.key});

  @override
  State<CreateRecipeView> createState() => _CreateRecipeViewState();
}

class _CreateRecipeViewState extends State<CreateRecipeView> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController originController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController backgroundController = TextEditingController();

  int prepTime = 30;
  int cookTime = 30;

  String? selectedDifficulty = 'Medium';
  List<String> difficulties = ['Easy', 'Medium', 'Hard'];

  List<Map<String, TextEditingController>> ingredients = [];
  List<TextEditingController> instructions = [];

  TextEditingController prepTimeController = TextEditingController();
  TextEditingController cookTimeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    addIngredient();
    addInstruction();
  }

  void addIngredient() {
    ingredients.add({
      'name': TextEditingController(),
      'quantity': TextEditingController(),
    });
    setState(() {});
  }

  void addInstruction() {
    instructions.add(TextEditingController());
    setState(() {});
  }

  void removeIngredient(int index) {
    ingredients.removeAt(index);
    setState(() {});
  }

  void removeInstruction(int index) {
    instructions.removeAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: commonText("Create Recipe", size: 18, isBold: true),
        centerTitle: true,

        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Cover Image
            Align(
              alignment: Alignment.centerLeft,
              child: commonText(
                "Cover Image",
                fontWeight: FontWeight.w500,
                size: 16,
              ),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                // TODO: Upload image
              },
              child: DottedBorder(
                options: RoundedRectDottedBorderOptions(
                  radius: Radius.circular(16),
                  dashPattern: [5, 4],
                ),

                child: Container(
                  height: 120,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(ImagePaths.uploadIcon),
                      const SizedBox(height: 8),
                      commonText("Upload your image"),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Title
            commonTextfieldWithTitle(
              "Recipe Title*",
              titleController,
              textSize: 16.0,
              hintText: "Enter a catchy title for your recipe",
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: commonNumberInputField(
                    hintText: "Prep Time (mins)*",
                    value: int.tryParse(prepTimeController.text) ?? 0,
                    controller: prepTimeController,
                    onChanged: (val) => setState(() {}),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: commonNumberInputField(
                    hintText: "Cook Time (mins)*",
                    value: int.tryParse(cookTimeController.text) ?? 0,
                    controller: cookTimeController,
                    onChanged: (val) => setState(() {}),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                commonText(
                  "Difficulty Level*",
                  size: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            SizedBox(height: 4),
            commonDropdown<String>(
              value: selectedDifficulty,
              hint: "Difficulty Level*",
              items: difficulties,
              onChanged: (val) => setState(() => selectedDifficulty = val),
            ),

            const SizedBox(height: 12),

            // Cultural Origin
            commonTextfieldWithTitle(
              "Cultural Origin",
              originController,
              textSize: 16.0,
              hintText: "e.g., Italian, Mexican, Thai",
            ),

            const SizedBox(height: 12),

            // Description
            commonTextfieldWithTitle(
              "Description*",
              descriptionController,
              textSize: 16.0,
              hintText: "Tell us about this dish",
              maxLine: 4,
            ),

            const SizedBox(height: 20),

            // Ingredients
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                commonText(
                  "Ingredients",
                  size: 16,
                  fontWeight: FontWeight.w500,
                ),
                commonButton(
                  "Add",
                  iconWidget: Icon(Icons.add),
                  width: 80,
                  height: 30,
                  textColor: AppColors.black,
                  color: Colors.transparent,
                  boarder: Border.all(width: 1),
                  onTap: addIngredient,
                  boarderRadious: 6,
                ),
              ],
            ),
            const SizedBox(height: 8),
            for (int i = 0; i < ingredients.length; i++)
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 4),
                  ],
                ),

                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: commonTextfieldWithTitle(
                            "Name*",
                            ingredients[i]['name']!,
                            hintText: "e.g., Tomato",
                            borderWidth: 1.0,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: commonTextfieldWithTitle(
                            "Quantity*",
                            ingredients[i]['quantity']!,
                            borderWidth: 1.0,
                            hintText: "e.g., 2",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton.icon(
                        onPressed: () => removeIngredient(i),
                        icon: Icon(
                          Icons.delete_outline,
                          size: 24,
                          color: Colors.red.shade600,
                        ),
                        label: commonText(
                          "Remove",
                          size: 16,
                          color: Colors.red.shade600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 12),

            // Instructions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                commonText(
                  "Instructions",
                  size: 16,
                  fontWeight: FontWeight.w500,
                ),
                commonButton(
                  "Add",
                  iconWidget: Icon(Icons.add),
                  width: 80,
                  height: 30,
                  textColor: AppColors.black,
                  color: Colors.transparent,
                  boarder: Border.all(width: 1),
                  onTap: addInstruction,
                  boarderRadious: 6,
                ),
              ],
            ),
            const SizedBox(height: 8),
            for (int i = 0; i < instructions.length; i++)
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 4),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commonTextfieldWithTitle(
                      "Step ${i + 1}",
                      instructions[i],

                      hintText: "Describe what to do in this step...",
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton.icon(
                        onPressed: () => removeInstruction(i),
                        icon: Icon(
                          Icons.delete_outline,
                          size: 24,
                          color: Colors.red.shade600,
                        ),
                        label: commonText(
                          "Remove",
                          size: 16,
                          color: Colors.red.shade600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            // Cultural Background
            commonTextfieldWithTitle(
              "Cultural Background*",
              backgroundController,
              textSize: 16.0,
              hintText: "Tell us about this dish",
            ),

            const SizedBox(height: 20),

            // Submit Button
    commonButton(
  "Create Recipe",
  onTap: () {
    final controller = Get.put(CreateRecipeController());

    controller.createRecipe(
      title: titleController.text.trim(),
      origin: originController.text.trim(),
      description: descriptionController.text.trim(),
      background: backgroundController.text.trim(),
      difficulty: selectedDifficulty ?? 'Medium',
      prepTime: int.tryParse(prepTimeController.text.trim()) ?? 0,
      cookTime: int.tryParse(cookTimeController.text.trim()) ?? 0,
      ingredients: ingredients.map((e) => {
        'name': e['name']!.text,
        'quantity': e['quantity']!.text,
      }).toList(),
      instructions: instructions.map((e) => e.text).toList(),
    );
  },
),


            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
