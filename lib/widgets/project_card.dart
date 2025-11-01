import 'package:flutter/material.dart';
import 'package:habeeb_portfolio/core/colors.dart';
import 'package:habeeb_portfolio/widgets/extension.dart';
import 'package:habeeb_portfolio/widgets/utils.dart';



class FeaturedProject extends StatelessWidget {
  final String projectName;
  final String projectDescription;
  final String projectImage;

  const FeaturedProject({
    super.key,
    required this.projectName,
    required this.projectDescription,
    required this.projectImage,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    return Container(
      height: 200,
      alignment: AlignmentGeometry.center,
      margin: AppConstants.extraPadding,
      decoration: BoxDecoration(
        // color: AppColors.buttonColorLight.withOpacity(0.2),
        border: Border.all(color: Colors.amberAccent),
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      ),
      child: isMobile ? appCircleAvatar(context, 35, 30, isImage: true, value: projectImage,)
          : Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    appCircleAvatar(context, 35, 35,
                        isImage: true, value: projectImage),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Featured Project',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.green,
                            letterSpacing: 1.2,
                          ),
                        ),

                        Text(
                          projectName,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),


                      ],
                    )
                  ],
                ),
              ],
            ),
          ),

          Container(
            width: 1.5,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            color: Colors.white.withOpacity(0.2),
          ),


          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  projectDescription,
                  style: context.textTheme.titleLarge!.copyWith(
                    color: context.colorScheme.surface,
                    height: 1.4,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Updates",
                      style: TextStyle(color: AppColors.redirectColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ).withContentPadded
    ).withExtraContextPadded;
  }
}
