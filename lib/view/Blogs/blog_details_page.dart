// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:food_recipes_afame/utils/colors.dart';

import 'package:food_recipes_afame/view/shared/commonWidgets.dart';

class BlogDetailsPage extends StatefulWidget {
  String description;
  
  String title;
  
  String image;
  
  String date;



   BlogDetailsPage({super.key,required this.title,required this.description,required this.image,required this.date});

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
                    image: NetworkImage(widget.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16),
              commonText(widget.title, size: 18, isBold: true),

              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.calendar_month),
                  Flexible(
                    child: commonText(
                      widget.date,
                      size: 14,
                      isBold: true,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              commonText(widget.description, size: 16, isBold: true),
            ],
          ),
        ),
      ),
    );
  }
}
