import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habeeb_portfolio/core/colors.dart';
import 'package:habeeb_portfolio/widgets/extension.dart';

import '../widgets/ui_helper.dart';

class WorkExperienceScreen extends StatelessWidget {
  const WorkExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.viewSize.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title with underline
         Align(alignment: AlignmentGeometry.center,
         child:  UIHelpers.sectionTitle(context, "Work Experience"),),

           SizedBox(height: context.viewSize.height*.1),

          Column(
            children: [
              _buildTimelineItem(
                context: context,
                company: 'OROKII INC',
                period: 'Jun 2022 - Dec 2022',
                role: 'Flutter Intern',
                description:
                'Gained hands-on experience with UI development, Firebase integration, and state management '
                    'while collaborating in an agile team environment',
                isFirst: true,
              ),

              _buildTimelineItem(
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

  Widget _buildTimelineItem({
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
        // Left side: Company & Period
        SizedBox(width: context.viewSize.width*.05,),
       SizedBox(
         width: context.viewSize.width*.30,
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
                 color: Color(0xFF98A2B3),
               ),
             ),
           ],
         ),
       ),


        // Center Timeline
        SizedBox(
          width: context.viewSize.width*.20,
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
                  color: isLast ? AppColors.buttonColorLight : AppColors.buttonColorLight.withOpacity(.50),
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
          width: context.viewSize.width*.30,
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
              // const SizedBox(height: 8),
              if (description.isNotEmpty)
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    // height: 1.4,
                    color: Color(0xFF98A2B3),
                  ),
                ),
            ],
          ),
        ),

        SizedBox(width: context.viewSize.width*.05,),

      ],
    ).withHorViewPadding;

}
}