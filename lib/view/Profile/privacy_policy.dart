import 'package:flutter/material.dart';
import 'package:food_recipes_afame/view/shared/commonWidgets.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: commonText("Privacy Policy", size: 16.0, isBold: true),
        centerTitle: true,
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonText(
                "Lorem ipsum dolor sit amet consectetur. . Convallis vel risus egestas ornare proin in. Arcu sodales tempus tellus mattis ac elit hendrerit sapien venenatis id gravida nisl.",
                size: 14.0,
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonText("• ", size: 20),
                  Expanded(
                    child: commonText(
                      "Lorem ipsum dolor sit amet eu aliquam lorem mi scelerisque sodales viverra. Convallis pretium consequat risus ut augue. Parturient at aliquam egestas diam sed. Sagittis et malesuada sem cras. Maecenas eu aliquam id feugiat gravida nisl ultricies. Integer dui odio nibh quis. Faucibus a luctus amet enim lobortis odio. In turpis sed quam sed etiam senectus bibendum in a. Sagittis dui fringilla morbi sit interdum netus. Lacinia nulla at fusce pellentesque elementum suscipit venenatis. Nisl id aliquet quis id sed cursus vel senectus risus. Neque donec aliquet urna dictumst. Tortor semper lorem lacus ipsum commodo. Eget amet urna montes libero enim in semper.",
                      size: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
