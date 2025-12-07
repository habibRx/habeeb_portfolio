import 'package:flutter/material.dart';
import 'package:habeeb_portfolio/widgets/extension.dart';

import '../core/colors.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: context.viewSize.height,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      // color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title
          Text(
            "My Services",
            style: TextStyle(
              fontSize: context.viewSize.height * 0.08,
              fontWeight: FontWeight.bold,
              color: AppColors.titleColor,
            ),
          ),
          SizedBox(height: context.viewSize.height*.025,),

          // Description
           Padding(
            padding: EdgeInsets.symmetric(horizontal: context.viewSize.width*.20),
            child: Text(
              "I build high-quality, cross-platform mobile applications for Android and iOS using Flutter — optimized for performance, scalability, and beautiful UI/UX.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: context.viewSize.height * 0.02,
                color: AppColors.buttonColorLight,
                height: 1.5,
              ),
            ),
          ),

          SizedBox(height: context.viewSize.height*.05,),
          // Services Cards
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildServiceCard(
                context: context,
                title: "Full-Stack App Development (Firebase)",
                description: "From authentication to analytics, I can handle your complete app backend using Firebase — including Firestore, Cloud Functions, Storage, Notifications, and Hosting.",
              ),
              const SizedBox(width: 30),
              _buildServiceCard(
                context: context,
                title: "API Integration & Development",
                description: "Seamless integration with REST and GraphQL APIs — I ensure smooth communication between your app and backend systems.",
              ),
              const SizedBox(width: 30),
              _buildServiceCard(
                context: context,
                title: "Custom Features & App Maintenance",
                description: "I develop advanced, production-ready features like real-time updates, charts, authentication flows, payments, and admin dashboards — and provide continuous updates or optimizations.",
              ),
            ],
          ),


        ],
      ),
    );
  }

  Widget _buildServiceCard({required String title, required BuildContext context,  required String description}) {
    return Container(
      width: context.viewSize.width * .20,
      height: context.viewSize.height*.50,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        border: Border.all(
          color: Colors.grey.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.settings_suggest,
              size: 30,
              color: AppColors.titleColor,
            ),
          ),

          const SizedBox(height: 20),

          // Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 12),

          // Description
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

}