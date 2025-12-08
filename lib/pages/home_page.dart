import 'package:flutter/material.dart';
import 'package:habeeb_portfolio/pages/contact_page.dart';
import 'package:habeeb_portfolio/pages/experience.dart';
import 'package:habeeb_portfolio/pages/services.dart';
import 'package:habeeb_portfolio/widgets/extension.dart';
import 'package:habeeb_portfolio/widgets/project_card.dart';
import 'package:habeeb_portfolio/widgets/utils.dart';
import '../core/colors.dart';
import '../widgets/nav_bar.dart';
import '../widgets/animated_section.dart';
import '../widgets/ui_helper.dart';
import 'about_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _serviceKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Scaffold(
      backgroundColor: AppColors.background1,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            floating: true,
            backgroundColor: AppColors.background1,
            surfaceTintColor: Colors.transparent,
            pinned: true,
            elevation: 1,
            toolbarHeight: 80,

            title: NavBar(onSectionTap: _scrollToSection).withHorViewPadding,
          ),


          if (!isMobile)
            SliverToBoxAdapter(child: _buildHeroSection(isMobile, context)),



          if (isMobile) SliverToBoxAdapter(child: AnimatedHeroSection(isMobile: true,)),

          SliverToBoxAdapter(
            key: _serviceKey,
            child: ServicesSection(isMobile: isMobile,),
          ),
          // About Section
          SliverToBoxAdapter(
            key: _aboutKey,
            child: _buildAboutSection(isMobile, context),
          ),

          SliverToBoxAdapter(
            key: _experienceKey,
            child: WorkExperienceScreen(isMobile: isMobile,),
          ),
          // Projects Section
          SliverToBoxAdapter(
            key: _projectsKey,
            child: _buildProjectsSection(isMobile, context),
          ),
          // Contact Section
          SliverToBoxAdapter(
            key: _contactKey,
            child: _buildContactSection(isMobile, context),
          ),
        ],
      ),
    );
  }

  void _scrollToSection(String section) {
    GlobalKey? targetKey;

    switch (section) {
      case 'About':
        targetKey = _aboutKey;
        break;
      case 'Projects':
        targetKey = _projectsKey;
        break;
      case 'Contact':
        targetKey = _contactKey;
        break;
      case "Experience":
        targetKey = _experienceKey;
        break;
      case "Services":
        targetKey = _serviceKey;
        break;
    }

    if (targetKey?.currentContext != null) {
      Scrollable.ensureVisible(
        targetKey!.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else if (section == 'Home') {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  Widget _buildHeroSection(bool isMobile, BuildContext context) {
    return AnimatedHeroSection(isMobile: false,);
  }

  Widget _buildAboutSection(bool isMobile, BuildContext context) {
    return Container(
      padding: UIHelpers.sectionPadding(isMobile),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [


          AnimatedSection(
            delay: 200,
            child: !isMobile ?  UIHelpers.sectionTitle(context, "About Me") :             Align(
              alignment: Alignment.center,
              child: Text(
                "About Me",
                style: TextStyle(
                  fontSize: context.viewSize.width*0.1,
                  fontWeight: FontWeight.bold,
                  color: AppColors.titleColor,
                ),
              ),
            ),

          ),
           if (!isMobile)UIHelpers.verticalSpace(40),
          Text(
            "I am a passionate Flutter developer with expertise in building beautiful, high-performance cross-platform applications. I love creating intuitive user experiences and solving complex problems. With experience in various state management solutions and REST APIs, I deliver robust and scalable applications that provide excellent user experiences."
            "I am proficient in integrating third-party APIs, Firebase services, and local databases, ensuring seamless app functionality. I continuously explore new technologies, tools, and best practices to keep my applications modern and efficient."
            "I take pride in writing clean, maintainable code and following industry-standard architecture patterns. My focus is on delivering apps that not only meet business requirements but also delight users with smooth interactions and responsive design."
            "Collaboration is one of my strengths; I enjoy working closely with designers, backend developers, and stakeholders to bring ideas to life. My goal is to contribute to impactful projects while constantly learning and growing as a software developer.",
            style: isMobile
                ? context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.buttonColorLight,
                    fontSize: 16,
                  )
                : UIHelpers.titleLarge(context),
            textAlign: TextAlign.center,
          ),
          UIHelpers.verticalSpace(40),
          const Divider(color: Colors.white30),
          UIHelpers.verticalSpace(20),
          _buildSkillsRow(isMobile, context),
          UIHelpers.verticalSpace(20),
          const Divider(color: Colors.white30),
        ],
      ),
    );
  }

  Widget _buildSkillsRow(bool isMobile, BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: isMobile ? 8 : 16,
      runSpacing: 16,
      children: List.generate(avatarData.length, (index) {
        final item = avatarData[index];
        return appCircleAvatar(
          context,
          null,
          null,
          isImage: item['isImage'] as bool,
          value: item['value'] as String,
        );
      }),
    );
  }

  Widget _buildProjectsSection(bool isMobile, BuildContext context) {
    final pageController = PageController(viewportFraction: 1.0);
    final currentPage = ValueNotifier<int>(0);

    return Container(
      height: MediaQuery.of(context).size.height,
      padding: UIHelpers.sectionPadding(isMobile),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          !isMobile  ?
          UIHelpers.sectionTitle(context, "Projects") :

            Align(
            alignment: Alignment.center,
            child: Text(
              "Projects",
              style: TextStyle(
                fontSize: context.viewSize.width*0.1,
                fontWeight: FontWeight.bold,
                color: AppColors.titleColor,
              ),
            ),
          ),

         if (!isMobile) SizedBox(height: context.viewSize.height * .05),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                PageView.builder(
                  controller: pageController,
                  itemCount: projects.length,
                  onPageChanged: (index) => currentPage.value = index,
                  itemBuilder: (context, index) {
                    final project = projects[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Center(
                        child: FeaturedProject(
                          isMobile: isMobile,
                          projectName: project["name"] as String,
                          projectImage: project["image"] as String,
                          projectLink: project["link"] as String,
                          projectDescription: project["description"] as String,
                        ),
                      ),
                    );
                  },
                ),
                // Navigation Arrows
                if (projects.length > 1 && !isMobile) ...[
                  Positioned(
                    left: 0,
                    child: IconButton(
                      onPressed: () {
                        if (currentPage.value > 0) {
                          pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: IconButton(
                      onPressed: () {
                        if (currentPage.value < projects.length - 1) {
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (projects.length > 1)
            ValueListenableBuilder<int>(
              valueListenable: currentPage,
              builder: (context, pageIndex, child) {
                return SizedBox(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(projects.length, (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: pageIndex == index
                              ? Colors.green
                              : Colors.white.withOpacity(0.5),
                        ),
                      );
                    }),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }

  Widget _buildContactSection(bool isMobile, BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: UIHelpers.sectionPadding(isMobile),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          !isMobile ?
          AnimatedSection(
            delay: 200,
            child: UIHelpers.sectionTitle(context, "Contact"),
          )
          :             Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Contact",
              style: TextStyle(
                fontSize: context.viewSize.width*0.1,
                fontWeight: FontWeight.bold,
                color: AppColors.titleColor,
              ),
            ),
          ),

          if (!isMobile)UIHelpers.verticalSpace(40),
          ContactPage(isMobile: isMobile),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
