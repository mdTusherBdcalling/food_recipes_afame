import 'package:flutter/material.dart';
import 'package:food_recipes_afame/utils/colors.dart';

import 'package:food_recipes_afame/view/shared/commonWidgets.dart';

class BlogDetailsPage extends StatefulWidget {
  final Map<String, String> blog;

  const BlogDetailsPage({super.key, required this.blog});

  @override
  State<BlogDetailsPage> createState() => _BlogDetailsPageState();
}

class _BlogDetailsPageState extends State<BlogDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(backgroundColor: AppColors.background),
      body: Container(
        padding: EdgeInsets.all(16),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(
                  minHeight: 350,
                  maxHeight: MediaQuery.sizeOf(context).width * 0.9,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(widget.blog["image"]!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16),
              commonText(widget.blog["title"]!, size: 18, isBold: true),

              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.calendar_month),
                  Flexible(
                    child: commonText(
                      widget.blog["date"]!,
                      size: 14,
                      isBold: true,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              commonText(widget.blog["description"]!, size: 16, isBold: true),
            ],
          ),
        ),
      ),
    );
  }
}
