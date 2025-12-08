import 'package:flutter/material.dart';
import 'package:habeeb_portfolio/core/colors.dart';
import 'package:habeeb_portfolio/widgets/extension.dart';
import '../widgets/ui_helper.dart';

class WorkExperienceScreen extends StatelessWidget {
  final bool isMobile;

  const WorkExperienceScreen({
    super.key,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return !isMobile ? _buildDesktopLayout(context) : _buildMobileLayout(context);
  }

  // DESKTOP LAYOUT
  Widget _buildDesktopLayout(BuildContext context) {
    return SizedBox(
      height: context.viewSize.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title with underline
          Align(
            alignment: Alignment.center,
            child: UIHelpers.sectionTitle(context, "Work Experience"),
          ),

          SizedBox(height: context.viewSize.height * .1),

          Column(
            children: [
              _buildTimelineItemDesktop(
                context: context,
                company: 'OROKII INC',
                period: 'Jun 2022 - Dec 2022',
                role: 'Flutter Intern',
                description:
                'Gained hands-on experience with UI development, Firebase integration, and state management '
                    'while collaborating in an agile team environment',
                isFirst: true,
              ),

              _buildTimelineItemDesktop(
                context: context,
                company: 'ECOMOTO LLC',
                period: 'Jan 2023 - Aug 2025',
                role: 'Software Engineer - Flutter',
                isLast: true,
                description: 'Developed and maintained EV rental marketplace application. '
                    'Focused on building clean UIs, integrating REST APIs, GraphQL and Firebase, and optimizing app performance for smooth user experience. Collaborated closely with designers and backend teams to deliver scalable and production-ready mobile solutions.',
              ),
            ],
          ),
        ],
      ).withContentPadded,
    );
  }

  // MOBILE LAYOUT
  Widget _buildMobileLayout(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Align(
            alignment: Alignment.center,
            child: Text(
              "Work Experience",
              style: TextStyle(
                fontSize: context.viewSize.width*0.1,
                fontWeight: FontWeight.bold,
                color: AppColors.titleColor,
              ),
            ),
          ),

          const SizedBox(height: 40),

          // Timeline Items
          Column(
            children: [
              _buildTimelineItemMobile(
                context: context,
                company: 'OROKII INC',
                period: 'Jun 2022 - Dec 2022',
                role: 'Flutter Intern',
                description:
                'Gained hands-on experience with UI development, Firebase integration, and state management '
                    'while collaborating in an agile team environment',
                isFirst: true,
              ),


              _buildTimelineItemMobile(
                context: context,
                company: 'ECOMOTO LLC',
                period: 'Jan 2023 - Aug 2025',
                role: 'Software Engineer - Flutter',
                isLast: true,
                description: 'Developed and maintained EV rental marketplace application. '
                    'Focused on building clean UIs, integrating REST APIs, GraphQL and Firebase, and optimizing app performance for smooth user experience. Collaborated closely with designers and backend teams to deliver scalable and production-ready mobile solutions.',
              ),
            ],
          ),
        ],
      ),
    );
  }

  // DESKTOP TIMELINE ITEM
  Widget _buildTimelineItemDesktop({
    required String company,
    required String period,
    required String role,
    required String description,
    required BuildContext context,
    bool isFirst = false,
    bool isLast = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: context.viewSize.width * .05),

        // Left side: Company & Period
        SizedBox(
          width: context.viewSize.width * .30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                company,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.buttonColorLight,
                ),
              ),
              Text(
                period,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF98A2B3),
                ),
              ),
            ],
          ),
        ),

        // Center Timeline
        SizedBox(
          width: context.viewSize.width * .20,
          child: Column(
            children: [
              if (!isFirst)
                Container(
                  width: 2,
                  height: 30,
                  color: Colors.grey[300],
                ),
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: isLast
                      ? AppColors.buttonColorLight
                      : AppColors.buttonColorLight.withOpacity(.50),
                  shape: BoxShape.circle,
                ),
              ),
              if (!isLast)
                Container(
                  width: 2,
                  height: description.isNotEmpty ? 120 : 80,
                  color: Colors.grey[300],
                ),
            ],
          ),
        ),

        // Right side: Role & Description
        SizedBox(
          width: context.viewSize.width * .30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                role,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.buttonColorLight,
                ),
              ),
              if (description.isNotEmpty)
                const SizedBox(height: 8),
              if (description.isNotEmpty)
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF98A2B3),
                  ),
                ),
            ],
          ),
        ),

        SizedBox(width: context.viewSize.width * .05),
      ],
    ).withHorViewPadding;
  }

  // MOBILE TIMELINE ITEM
  Widget _buildTimelineItemMobile({
    required String company,
    required String period,
    required String role,
    required String description,
    required BuildContext context,
    bool isFirst = false,
    bool isLast = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline Column
        Column(
          children: [
            if (!isFirst)
              Container(
                width: 2,
                height: 20,
                color: Colors.grey[300],
              ),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: isLast
                    ? AppColors.buttonColorLight
                    : AppColors.buttonColorLight.withOpacity(.50),
                shape: BoxShape.circle,
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: description.isNotEmpty ? 150 : 100,
                color: Colors.grey[300],
              ),
          ],
        ),

        const SizedBox(width: 16),

        // Content Column
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    company,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.buttonColorLight,
                    ),
                  ),
                  Text(
                    period,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF98A2B3),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              Text(
                role,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              if (description.isNotEmpty) const SizedBox(height: 8),

              if (description.isNotEmpty)
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF98A2B3),
                    height: 1.4,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }}
