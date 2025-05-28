import 'package:flutter/material.dart';
import 'package:food_recipes_afame/core/colors.dart';
import 'package:food_recipes_afame/shared/commonWidgets.dart';

class BlogsView extends StatefulWidget {
  const BlogsView({super.key});

  @override
  State<BlogsView> createState() => _BlogsViewState();
}

class _BlogsViewState extends State<BlogsView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> blogBanners = [
    {
      "image": "https://images.unsplash.com/photo-1600891964599-f61ba0e24092",
      "title": "Learn How to Become a Great Writer Right Now!",
    },
    {
      "image": "https://images.unsplash.com/photo-1600891964599-f61ba0e24092",
      "title": "Cooking Secrets From The Pros You Should Know",
    },
    {
      "image": "https://images.unsplash.com/photo-1600891964599-f61ba0e24092",
      "title": "Top 10 Healthy Recipes for Every Season",
    },
    {
      "image": "https://images.unsplash.com/photo-1600891964599-f61ba0e24092",
      "title": "Top 10 Healthy Recipes for Every Season",
    },
  ];

  final List<Map<String, String>> recentBlogs = List.generate(
    5,
    (index) => {
      "image": "https://images.unsplash.com/photo-1600891964599-f61ba0e24092",
      "title": "The History of Spices and Their Cultural Significance.",
      "date": "January 27, 2025",
      "comments": "5 Comments",
    },
  );

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
            itemCount: blogBanners.length,
            onPageChanged: (page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              final banner = blogBanners[index];
              return Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(banner["image"]!, fit: BoxFit.cover),
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
                            banner["title"]!,
                            size: 20,
                            maxline: 2,
                            isBold: true,
                            color: AppColors.white,
                          ),
                          const SizedBox(height: 8),
                          Container(
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
                blogBanners.length,
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

  Widget _buildBlogCard(Map<String, String> blog) {
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
              child: Image.network(
                blog["image"]!,

                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          commonText(
            blog["title"]!,
            size: 14,
            isBold: true,
            color: Colors.black87,
            maxline: 2,
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              commonText(blog["date"]!, size: 12, color: Colors.black54),
              commonText(blog["comments"]!, size: 12, color: Colors.black54),
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
                commonText(
                  "Recent Blogs",
                  size: 18,
                  isBold: true,
                  color: Colors.black87,
                ),
                const SizedBox(height: 12),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: recentBlogs.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder:
                      (context, index) => _buildBlogCard(recentBlogs[index]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
