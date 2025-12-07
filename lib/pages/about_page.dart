import 'package:flutter/material.dart';
import '../core/colors.dart';
import '../widgets/ui_helper.dart';

class AnimatedHeroSection extends StatefulWidget {
 final bool isMobile;
  const AnimatedHeroSection({super.key,  this.isMobile = false});

  @override
  State<AnimatedHeroSection> createState() => _AnimatedHeroSectionState();
}

class _AnimatedHeroSectionState extends State<AnimatedHeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _leftStatsAnimation;
  late Animation<double> _centerBubbleAnimation;
  late Animation<double> _centerTextAnimation;
  late Animation<double> _centerImageAnimation;
  late Animation<double> _rightStatsAnimation;
  late Animation<double> _orangeCircleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _leftStatsAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.3, curve: Curves.easeOut),
      ),
    );

    _orangeCircleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.5, curve: Curves.easeOut),
      ),
    );

    _centerBubbleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.6, curve: Curves.easeOutBack),
      ),
    );

    _centerTextAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 0.8, curve: Curves.easeOut),
      ),
    );

    _centerImageAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        // Avoid overshoot to prevent overflow
        curve: const Interval(0.5, 0.9, curve: Curves.easeOutCubic),
      ),
    );

    _rightStatsAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 1.0, curve: Curves.easeOut),
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final double headingSizeMobile = size.height * 0.05;
    final double subHeadingMobile = size.height * 0.04;
    final double mobileLabel = size.height * 0.01;
    final double headingSize = size.height * 0.1;
    final double subHeadingSize = size.height * 0.08;
    final double statValueSizeMobile = size.height * 0.04;
    final double statValueSize = size.height * 0.06;
    final double statLabelSize = size.height * 0.02;
    final double imageHeight = size.height * 0.5;
    final double mobileImage = size.height * 0.25;
    final double orangeCircleHeight = size.height * 0.35;
    final double orangeCircleMobile = size.height * 0.175;


    return Container(
      height: size.height,
      width: size.width,
      padding: UIHelpers.sectionPadding(true),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// LEFT STATS
                  Flexible(
                    child: Transform.translate(
                      offset: Offset(-50 * (1 - _leftStatsAnimation.value), 0),
                      child: Opacity(
                        opacity: _leftStatsAnimation.value,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "5+",
                              style: TextStyle(
                                fontSize: !widget.isMobile ? statValueSize : statValueSizeMobile,
                                fontWeight: FontWeight.bold,
                                color: AppColors.titleColor,
                              ),
                            ),
                            Text(
                              "Projects Completed",
                              style: TextStyle(
                                fontSize: !widget.isMobile ? statLabelSize : mobileLabel,
                                color: AppColors.buttonColorLight,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  /// CENTER SECTION
                  Flexible(
                    flex: 2,
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          bottom: 0,
                          child: Transform.scale(
                            scale: _orangeCircleAnimation.value,
                            child: Container(
                              width: !widget.isMobile ? orangeCircleHeight*2 : orangeCircleMobile*2,
                              height: !widget.isMobile ?  orangeCircleHeight : orangeCircleMobile,
                              decoration: const BoxDecoration(
                                color: AppColors.buttonColorLight,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(500),
                                  topRight: Radius.circular(500),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: size.height * 0.1,
                          child: Transform.translate(
                            offset: Offset(0, 30 * (1 - _centerTextAnimation.value)),
                            child: Opacity(
                              opacity: _centerTextAnimation.value,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Bubble
                                  ScaleTransition(
                                    scale: _centerBubbleAnimation,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.03,
                                        vertical: size.height * 0.01,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.grey[100],
                                        border: Border.all(color: Colors.black12),
                                      ),
                                      child: Text(
                                        "Hello! 👋",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: size.height * 0.02,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: size.height * 0.03),
                                  Column(
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                          text: "I'm ",
                                          style: TextStyle(
                                            fontSize: !widget.isMobile ? headingSize : headingSizeMobile,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.buttonColorLight,
                                            height: 0.9,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: "Habeeb",
                                              style: TextStyle(
                                                fontSize: !widget.isMobile ? headingSize : headingSizeMobile,
                                                color: AppColors.titleColor,
                                                fontWeight: FontWeight.w800,
                                                height: 0.9,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: size.height * 0.01),
                                      Text(
                                        "Flutter Developer",
                                        style: TextStyle(
                                          fontSize: !widget.isMobile ? subHeadingSize : subHeadingMobile,
                                          fontWeight: FontWeight.w800,
                                          color: AppColors.buttonColorLight,
                                          height: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          bottom: 0,
                          child: Transform.translate(
                            offset: Offset(0, 60 * (1 - _centerImageAnimation.value)),
                            child: Opacity(
                              opacity: _centerImageAnimation.value,
                              child: Image.asset(
                                'assets/images/header2.png',
                                height: !widget.isMobile ? imageHeight : mobileImage,
                                width: !widget.isMobile ? imageHeight : mobileImage,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// RIGHT STATS
                  Flexible(
                    child: Transform.translate(
                      offset: Offset(50 * (1 - _rightStatsAnimation.value), 0),
                      child: Opacity(
                        opacity: _rightStatsAnimation.value,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "3.5+",
                              style: TextStyle(
                                fontSize: !widget.isMobile ? statValueSize : statValueSizeMobile,
                                fontWeight: FontWeight.bold,
                                color: AppColors.titleColor,
                              ),
                            ),
                            Text(
                              "Years Experience",
                              style: TextStyle(
                                fontSize: !widget.isMobile  ? statLabelSize : mobileLabel,
                                color: AppColors.buttonColorLight,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class MobileHeroSection extends StatefulWidget {
  const MobileHeroSection({super.key});

  @override
  State<MobileHeroSection> createState() => _MobileHeroSectionState();
}

class _MobileHeroSectionState extends State<MobileHeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideUpAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );

    _slideUpAnimation = Tween<double>(begin: 30, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.7, curve: Curves.easeOut),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 1.0, curve: Curves.easeOutBack),
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallMobile = size.height < 700;

    return Container(
      height: size.height,
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: size.height * 0.1,
                child: Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Container(
                    width: size.width * 0.8,
                    height: size.height * 0.3,
                    decoration: BoxDecoration(
                      color: AppColors.buttonColorLight,
                      borderRadius: BorderRadius.circular(200),
                    ),
                  ),
                ),
              ),

              // Main content
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Bubble
                  Transform.translate(
                    offset: Offset(0, _slideUpAnimation.value),
                    child: Opacity(
                      opacity: _fadeAnimation.value,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey[100],
                          border: Border.all(color: Colors.black12),
                        ),
                        child: Text(
                          "Hello! 👋",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: isSmallMobile ? 14 : 16,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: size.height * 0.03),

                  // Name
                  Transform.translate(
                    offset: Offset(0, _slideUpAnimation.value),
                    child: Opacity(
                      opacity: _fadeAnimation.value,
                      child: Text.rich(
                        TextSpan(
                          text: "I'm ",
                          style: TextStyle(
                            fontSize: isSmallMobile ? size.height * 0.05 : size.height * 0.06,
                            fontWeight: FontWeight.w700,
                            color: AppColors.buttonColorLight,
                            height: 0.9,
                          ),
                          children: [
                            TextSpan(
                              text: "Habeeb",
                              style: TextStyle(
                                fontSize: isSmallMobile ? size.height * 0.05 : size.height * 0.06,
                                color: AppColors.titleColor,
                                fontWeight: FontWeight.w800,
                                height: 0.9,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                  SizedBox(height: size.height * 0.01),

                  // Title
                  Transform.translate(
                    offset: Offset(0, _slideUpAnimation.value),
                    child: Opacity(
                      opacity: _fadeAnimation.value,
                      child: Text(
                        "Flutter Developer",
                        style: TextStyle(
                          fontSize: isSmallMobile ? size.height * 0.04 : size.height * 0.05,
                          fontWeight: FontWeight.w800,
                          color: AppColors.buttonColorLight,
                          height: 1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                  SizedBox(height: size.height * 0.04),

                  // Stats Row
                  Opacity(
                    opacity: _fadeAnimation.value,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatItem(
                          value: "5+",
                          label: "Projects\nCompleted",
                          size: size,
                          isSmallMobile: isSmallMobile,
                        ),
                        _buildStatItem(
                          value: "3.5+",
                          label: "Years\nExperience",
                          size: size,
                          isSmallMobile: isSmallMobile,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: size.height * 0.04),

                  // Image
                ],
              ),
              
              Positioned(
                bottom: size.height * 0.1,
                child: Transform.translate(
                offset: Offset(0, _slideUpAnimation.value * 2),
                child: Opacity(
                  opacity: _fadeAnimation.value,
                  child: Image.asset(
                    'assets/images/header2.png',
                    height: isSmallMobile ? size.height * 0.3 : size.height * 0.3,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget _buildStatItem({
    required String value,
    required String label,
    required Size size,
    required bool isSmallMobile,
  }) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: isSmallMobile ? size.height * 0.05 : size.height * 0.06,
            fontWeight: FontWeight.bold,
            color: AppColors.titleColor,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: isSmallMobile ? 12 : 14,
            color: AppColors.buttonColorLight,
            fontWeight: FontWeight.w500,
            height: 1.2,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}