import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habeeb_portfolio/widgets/downlaod.dart';
import 'package:habeeb_portfolio/widgets/extension.dart';
import 'package:habeeb_portfolio/widgets/utils.dart';

import '../core/colors.dart';

class NavBar extends StatelessWidget {
  final Function(String) onSectionTap;

  const NavBar({
    super.key, required this.onSectionTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      // alignment: AlignmentGeometry.center,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color:  AppColors.background1
      ),
      child:  (!isMobile) ?
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        Row(

          children: [
            _NavItem(title: 'Home', onTap: () => onSectionTap('Home')),
            _NavItem(title: 'Services', onTap: () => onSectionTap('Services')),
            _NavItem(title: 'About', onTap: () => onSectionTap('About')),



          ],
        ),


DownloadResumeButton()     ,    // appCircleAvatar
         //   (context,
         //     15,
         //     20,
         //     isImage: true,
         //     value: "assets/images/header.jpg"),
         Row(
           children: [
             _NavItem(title: 'Experience', onTap: () => onSectionTap('Experience')),
             _NavItem(title: 'Projects', onTap: () => onSectionTap('Projects')),
             _NavItem(title: 'Contact', onTap: () => onSectionTap('Contact')),
           ],
         )
        ],
      )
    :
      IconButton(
        icon: const Icon(Icons.menu, color: Colors.white),
        onPressed: () {
          _showMobileMenu(context);
        },
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF120627),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _MobileNavItem(title: 'Home', onTap: () {
                Navigator.pop(context);
                onSectionTap('Home');
              }),
              _MobileNavItem(title: 'About', onTap: () {
                Navigator.pop(context);
                onSectionTap('About');
              }),
              _MobileNavItem(title: 'Projects', onTap: () {
                Navigator.pop(context);
                onSectionTap('Projects');
              }),
              _MobileNavItem(title: 'Contact', onTap: () {
                Navigator.pop(context);
                onSectionTap('Contact');
              }),
            ],
          ),
        );
      },
    );
  }

}

class _NavItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _NavItem({required this.title, required this.onTap});


  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            // color: AppColors.titleColor,

            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            title,
            style: GoogleFonts.mulishTextTheme().titleLarge!.copyWith(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ).withContentPadded,
        ),
      ),
    );
  }
}

class _MobileNavItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _MobileNavItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 18),
        textAlign: TextAlign.center,
      ),
      onTap: onTap,
    );
  }
}