import 'package:flutter/material.dart';
import 'package:habeeb_portfolio/widgets/extension.dart';

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
      alignment: AlignmentGeometry.center,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 100, vertical: 20),
      child:  (!isMobile) ?
      Row(
        children: [
          _NavItem(title: 'Home', onTap: () => onSectionTap('Home')),
          _NavItem(title: 'About', onTap: () => onSectionTap('About')),
          _NavItem(title: 'Projects', onTap: () => onSectionTap('Projects')),
          _NavItem(title: 'Contact', onTap: () => onSectionTap('Contact')),
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: onTap,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
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