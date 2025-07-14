import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_recipes_afame/controller/blog/blog_controller.dart';
import 'package:food_recipes_afame/models/blog/blog_model.dart';
import 'package:food_recipes_afame/utils/colors.dart';
import 'package:food_recipes_afame/view/Blogs/blog_details_page.dart';
import 'package:food_recipes_afame/view/shared/commonWidgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BlogsView extends StatefulWidget {
  const BlogsView({super.key});

  @override
  State<BlogsView> createState() => _BlogsViewState();
}

class _BlogsViewState extends State<BlogsView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // final List<Map<String, String>> blogBanners = [
  //   {
  //     "image": "https://images.unsplash.com/photo-1600891964599-f61ba0e24092",
  //     "title": "Learn How to Become a Great Writer Right Now!",
  //     "description":
  //         "Explore the rich history and impact of spices on cuisines around the world.",
  //     "date": "Jan 27, 2025",
  //     "comments": "5 Comments",
  //   },
  //   {
  //     "image": "https://images.unsplash.com/photo-1600891964599-f61ba0e24092",
  //     "title": "Cooking Secrets From The Pros You Should Know",
  //     "description":
  //         "Explore the rich history and impact of spices on cuisines around the world.",
  //     "date": "Jan 27, 2025",
  //     "comments": "5 Comments",
  //   },
  //   {
  //     "image": "https://images.unsplash.com/photo-1600891964599-f61ba0e24092",
  //     "title": "Top 10 Healthy Recipes for Every Season",
  //     "description":
  //         "Explore the rich history and impact of spices on cuisines around the world.",
  //     "date": "Jan 27, 2025",
  //     "comments": "5 Comments",
  //   },
  //   {
  //     "image": "https://images.unsplash.com/photo-1600891964599-f61ba0e24092",
  //     "title": "Top 10 Healthy Recipes for Every Season",
  //     "description":
  //         "Explore the rich history and impact of spices on cuisines around the world.",
  //     "date": "Jan 27, 2025",
  //     "comments": "5 Comments",
  //   },
  // ];



final BlogController controller=Get.put(BlogController());


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildBanner() {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: max(controller.blogs.length,4),
            onPageChanged: (page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
           
              return Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(controller.blogs[index].image, fit: BoxFit.cover,  errorBuilder: (context, error, stackTrace) => commonImageErrorWidget(),),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.center,
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          commonText(
                            controller.blogs[index].headline,
                            size: 20,
                            maxline: 2,
                            isBold: true,
                            color: AppColors.white,
                          ),
                          const SizedBox(height: 8),
                          InkWell(
                            onTap: () {
                          navigateToPage(
                            BlogDetailsPage(title: controller.blogs[index].headline,
                            description:  controller.blogs[index].description,
                            image: controller.blogs[index].image,
                             date: DateFormat('MMMM d, y').format(DateTime.parse(controller.blogs[index].createdAt.toString()))
                            ),
                          );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 6,
                              ),
                              child: commonText(
                                "Read more",
                                size: 14,
                                color: AppColors.primary,
                                isBold: true,
                              ),
                            ),
                          ),
                          SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),

          Positioned(
            bottom: 12,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                max(controller.blogs.length,4),
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 20 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color:
                        _currentPage == index
                            ? AppColors.primary
                            : Colors.white70,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBlogCard(BlogModel blog) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(  errorBuilder: (context, error, stackTrace) => commonImageErrorWidget(),
                blog.image,

                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          commonText(
            blog.headline,
            size: 14,
            isBold: true,
            color: Colors.black87,
            maxline: 2,
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: commonText(
                   DateFormat('MMMM d, y').format(DateTime.parse(blog.createdAt.toString())), size: 12, color: Colors.black54,maxline: 1),
              ),
              SizedBox(width: 10,),
              Flexible(child: commonText(blog.description, size: 12, color: Colors.black54,maxline: 1)),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBanner(),
                const SizedBox(height: 24),
                commonText("Recent Blogs", size: 18, isBold: true),
                const SizedBox(height: 12),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.blogs.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder:
                      (context, index) => InkWell(
                        onTap: () {
                          navigateToPage(
                            BlogDetailsPage(title: controller.blogs[index].headline,
                            description:  controller.blogs[index].description,
                            image:  controller.blogs[index].image,
                             date:     DateFormat('MMMM d, y').format(DateTime.parse(controller.blogs[index].createdAt.toString()))
                            
                            ),
                          );
                        },
                        child: _buildBlogCard(controller.blogs[index]),
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
