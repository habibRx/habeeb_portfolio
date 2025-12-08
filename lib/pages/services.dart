import 'package:flutter/material.dart';
import 'package:habeeb_portfolio/widgets/extension.dart';

import '../core/colors.dart';


class ServicesSection extends StatelessWidget {
  final bool isMobile;

  const ServicesSection({
    super.key,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return !isMobile ? _buildDesktopLayout(context) : _buildMobileLayout(context);
  }

  // DESKTOP LAYOUT
  Widget _buildDesktopLayout(BuildContext context) {
    return Container(
      height: context.viewSize.height,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
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
          SizedBox(height: context.viewSize.height * .025),

          // Description
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.viewSize.width * .20),
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

          SizedBox(height: context.viewSize.height * .05),

          // Services Cards - Horizontal Row for Desktop
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildServiceCard(
                context: context,
                title: "Full-Stack App Development (Firebase)",
                description: "From authentication to analytics, I can handle your complete app backend using Firebase — including Firestore, Cloud Functions, Storage, Notifications, and Hosting.",
                width: context.viewSize.width * .20,
                height: context.viewSize.height * .50,
              ),
              const SizedBox(width: 30),
              _buildServiceCard(
                context: context,
                title: "API Integration & Development",
                description: "Seamless integration with REST and GraphQL APIs — I ensure smooth communication between your app and backend systems.",
                width: context.viewSize.width * .20,
                height: context.viewSize.height * .50,
              ),
              const SizedBox(width: 30),
              _buildServiceCard(
                context: context,
                title: "Custom Features & App Maintenance",
                description: "I develop advanced, production-ready features like real-time updates, charts, authentication flows, payments, and admin dashboards — and provide continuous updates or optimizations.",
                width: context.viewSize.width * .20,
                height: context.viewSize.height * .50,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // MOBILE LAYOUT
  Widget _buildMobileLayout(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Title
          Text(
            "My Services",
            style: TextStyle(
              fontSize: context.viewSize.width*0.1,
              fontWeight: FontWeight.bold,
              color: AppColors.titleColor,
            ),
          ),
          const SizedBox(height: 16),

          // Description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "I build high-quality, cross-platform mobile applications for Android and iOS using Flutter — optimized for performance, scalability, and beautiful UI/UX.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.buttonColorLight,
                height: 1.5,
              ),
            ),
          ),

          const SizedBox(height: 32),

          // Services Cards - Vertical Column for Mobile
          Column(
            children: [
              _buildServiceCard(
                context: context,
                title: "Full-Stack App Development (Firebase)",
                description: "From authentication to analytics, I can handle your complete app backend using Firebase — including Firestore, Cloud Functions, Storage, Notifications, and Hosting.",
                width: double.infinity,
                height: null,
                isMobile: true,
              ),
              const SizedBox(height: 20),
              _buildServiceCard(
                context: context,
                title: "API Integration & Development",
                description: "Seamless integration with REST and GraphQL APIs — I ensure smooth communication between your app and backend systems.",
                width: double.infinity,
                height: null,
                isMobile: true,
              ),
              const SizedBox(height: 20),
              _buildServiceCard(
                context: context,
                title: "Custom Features & App Maintenance",
                description: "I develop advanced, production-ready features like real-time updates, charts, authentication flows, payments, and admin dashboards — and provide continuous updates or optimizations.",
                width: double.infinity,
                height: null,
                isMobile: true,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard({
    required BuildContext context,
    required String title,
    required String description,
    required double width,
    double? height,
    bool isMobile = false,
  }) {
    return Container(
      width: width,
      height: height,
      padding: isMobile ? const EdgeInsets.all(24) : const EdgeInsets.all(32),
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

          SizedBox(height: isMobile ? 16 : 20),

          // Title
          Text(
            title,
            style: TextStyle(
              fontSize: isMobile ? 18 : 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          SizedBox(height: isMobile ? 8 : 12),

          // Description
          Text(
            description,
            style: TextStyle(
              fontSize: isMobile ? 13 : 14,
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}