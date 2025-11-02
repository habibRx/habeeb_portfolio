import 'package:flutter/material.dart';
import 'package:habeeb_portfolio/pages/contact_page.dart';
import 'package:habeeb_portfolio/widgets/extension.dart';
import 'package:habeeb_portfolio/widgets/project_card.dart';
import 'package:habeeb_portfolio/widgets/utils.dart';
import '../widgets/nav_bar.dart';
import '../widgets/animated_section.dart';
// import '../helpers/ui_helpers.dart';
import '../widgets/ui_helper.dart';

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

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Scaffold(
      backgroundColor: const Color(0xFF120627),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            backgroundColor: const Color(0xFF120627),
            floating: true,
            pinned: true,
            snap: false,
            elevation: 0,
            title: NavBar(
              onSectionTap: (section) {
                _scrollToSection(section);
              },
            ),
          ),

          // Hero Section
          if (!isMobile)
          SliverToBoxAdapter(
            child: _buildHeroSection(isMobile, context),
          ),

          if (isMobile)
            SliverToBoxAdapter(
              child: _buildMobileHero( context),
            ),
          // About Section
          SliverToBoxAdapter(
            key: _aboutKey,
            child: _buildAboutSection(isMobile, context),
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
    final context = _aboutKey.currentContext;
    if (context == null) return;

    switch (section) {
      case 'About':
        Scrollable.ensureVisible(_aboutKey.currentContext!,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
        break;
      case 'Projects':
        Scrollable.ensureVisible(_projectsKey.currentContext!,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
        break;
      case 'Contact':
        Scrollable.ensureVisible(_contactKey.currentContext!,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
        break;
      default:
        _scrollController.animateTo(0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
    }
  }

  final List<Map<String, dynamic>> _avatarData = [
    {"isImage": true, "value": "assets/images/flutter.png"},
    {"isImage": true, "value": "assets/images/firebase.png"},
    {"isImage": true, "value": "assets/images/graphql.png"},
    {"isImage": true, "value": "assets/images/rest.jpg"},
    {"isImage": false, "value": "OpenAI"},
    {"isImage": true, "value": "assets/images/mvvm.png"},
    {"isImage": true, "value": "assets/images/github.jpg"},
    {"isImage": false, "value": "Web3"},
    {"isImage": false, "value": "Wallet"},
  ];

  Widget _buildHeroSection(bool isMobile, BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: UIHelpers.sectionPadding(isMobile),
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: AnimatedSection(
                delay: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, I\'m Habeeb',
                      style: UIHelpers.displayLarge(context, isMobile: isMobile),
                    ),
                    UIHelpers.verticalSpace(context.viewSize.height*.01),
                    appShaderMask(context, "Front-End Developer"),
                    UIHelpers.verticalSpace(context.viewSize.height*.01),
                    SizedBox(
                      width: isMobile ? context.viewSize.width : context.viewSize.width*.5,
                      child: Text(
                        'I create elegant, responsive cross-platform applications '
                            'using Flutter with focus on performance and user experience.',
                        style: UIHelpers.bodyLarge(context, isMobile: isMobile),
                        textAlign: isMobile ? TextAlign.center : TextAlign.left,
                      ),
                    ),
                    UIHelpers.verticalSpace(context.viewSize.height*.05),
                    if(!isMobile)
                      ElevatedButton(
                        onPressed: () => _scrollToSection('About'),
                        style: UIHelpers.elevatedButtonStyle(),
                        child: const Text('About Me'),
                      ),
                  ],
                ),
              ),
            ),
            if (!isMobile)
              Expanded(child: AnimatedSection(
                delay: 400,
                child: Container(
                  margin:  EdgeInsets.only(right: context.viewSize.height*.01),
                  child: CircleAvatar(
                    radius: context.viewSize.width*.12,
                    backgroundColor: Colors.blue.shade100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(context.viewSize.width*.12,),
                      child: Image.asset('assets/images/header.jpg'),
                    ),
                  ),
                ),
              ),)
          ],
        ),
      ),
    );
  }

  Widget _buildMobileHero( BuildContext context) {
    return SizedBox(
      height: context.viewSize.height,
      child: SingleChildScrollView(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSection(
                delay: 400,
                child: Container(
                  margin:  EdgeInsets.only(right: context.viewSize.height*.01),
                  child: CircleAvatar(
                    radius: context.viewSize.width*.12,
                    backgroundColor: Colors.blue.shade100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(context.viewSize.width*.12,),
                      child: Image.asset('assets/images/header.jpg'),
                    ),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: AnimatedSection(
                      delay: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, I\'m Habeeb',
                            style: context.textTheme.titleLarge!.copyWith(
color: Colors.white
                            ),
                          ),
                          UIHelpers.verticalSpace(context.viewSize.height*.01),
                          appShaderMask(context, "Front-End Developer"),
                          UIHelpers.verticalSpace(context.viewSize.height*.01),
                          SizedBox(
                            width: context.viewSize.width,
                            child: Text(
                              'I create elegant, responsive cross-platform applications '
                                  'using Flutter with focus on performance and user experience.',
                              style: context.textTheme.bodyMedium!.copyWith(
                                  color: Colors.white

                              ),
                              // textAlign: isMobile ? TextAlign.center : TextAlign.left,
                            ),
                          ),
                          UIHelpers.verticalSpace(context.viewSize.height*.05),
                          // if(!isMobile)
                          ElevatedButton(
                            onPressed: () => _scrollToSection('About'),
                            style: UIHelpers.elevatedButtonStyle(),
                            child: const Text('About Me'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ]
        ),
      ),
    );
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
            child: Align(
              alignment: Alignment.center,
              child: UIHelpers.sectionTitle(context, "About Me"),
            ),
          ),
          UIHelpers.verticalSpace(40),
          Text(
            "I am a passionate Flutter developer with expertise in building beautiful, high-performance cross-platform applications. I love creating intuitive user experiences and solving complex problems. With experience in various state management solutions and REST APIs, I deliver robust and scalable applications that provide excellent user experiences."
                "I am proficient in integrating third-party APIs, Firebase services, and local databases, ensuring seamless app functionality. I continuously explore new technologies, tools, and best practices to keep my applications modern and efficient."
                "I take pride in writing clean, maintainable code and following industry-standard architecture patterns. My focus is on delivering apps that not only meet business requirements but also delight users with smooth interactions and responsive design."
                "Collaboration is one of my strengths; I enjoy working closely with designers, backend developers, and stakeholders to bring ideas to life. My goal is to contribute to impactful projects while constantly learning and growing as a software developer.",
            style: UIHelpers.titleLarge(context),
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
      children: List.generate(
        _avatarData.length,
            (index) {
          final item = _avatarData[index];
          return appCircleAvatar(
            context,
            null,
            null,
            isImage: item['isImage'] as bool,
            value: item['value'] as String,
          );
        },
      ),
    );
  }

  Widget _buildProjectsSection(
      bool isMobile,
      BuildContext context,
      ) {
    final List<Map<String, String>> projects = [
      {
        "link" : "https://ecomoto-mu.vercel.app",
        "name": "ECOMOTO",
        "image": "assets/images/ecomoto.png",
        "description":
        "A peer-to-peer EV rental marketplace with integrated social features, enabling users to rent electric vehicles, connect with owners, and engage through real-time chat and community interactions.",
      },
      {
        "link" : "https://play.google.com/store/apps/details?id=com.orokii.app&hl=en&gl=US",
        "name": "OROKII",
        "image": "assets/images/orokii.png",
        "description":
        "A decentralized finance platform focused on enabling fast, secure, and borderless crypto transactions with minimal fees.",
      },
      {
        "link" : "https://ecomoto-mu.vercel.app",
        "name": "ECOBOOK",
        "image": "assets/images/ecomoto.png",
        "description":
        "A social platform built to connect eco-conscious individuals and businesses through blogs, events, and community discussions.",
      },

      {
        "link" : "",
        "name": "What's My PNL",
        "image": "assets/images/whatpnl.jpg",
        "description":
        "A comprehensive trading journal that helps traders record, analyze, and optimize their performance with built-in brokerage and gain calculators, insightful reports, and smart trade tracking tools.",
      },
    ];

    final PageController pageController = PageController(viewportFraction: 1.0);
    ValueNotifier<int> currentPage = ValueNotifier<int>(0);

    return Container(
      height: MediaQuery.of(context).size.height,
      padding: UIHelpers.sectionPadding(isMobile),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedSection(
            delay: 200,
            child: Align(
              alignment: Alignment.center,
              child: appShaderMask(context, "Projects"),
            ),
          ),

           SizedBox(height: context.viewSize.height*.05),

          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                PageView.builder(
                  controller: pageController,
                  itemCount: projects.length,
                  onPageChanged: (index) {
                    currentPage.value = index;
                  },
                  itemBuilder: (context, index) {
                    final project = projects[index];
                    return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Center (child : FeaturedProject(
                          projectName: project["name"]!,
                          projectImage: project["image"]!,
                          projectLink: project["link"] ?? "",
                          projectDescription: project["description"]!,
                        )
                        ));
                  },
                ),

                // Left Navigation Arrow
                if (projects.length > 1 && !isMobile)
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

                if (projects.length > 1 && !isMobile)
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
            ),
          ),

          if (projects.length > 1)
            ValueListenableBuilder<int>(
              valueListenable: currentPage,
              builder: (context, pageIndex, child) {
                return SizedBox(
                  height: 40,
                  child: Center(
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
          AnimatedSection(
            delay: 200,
            child: Align(
              alignment: Alignment.center,
              child: UIHelpers.sectionTitle(context, "Contact"),
            ),
          ),
          UIHelpers.verticalSpace(40),
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