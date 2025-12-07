import 'package:flutter/material.dart';
import 'package:habeeb_portfolio/widgets/extension.dart';
import 'package:habeeb_portfolio/widgets/utils.dart';
import 'package:url_launcher/url_launcher.dart';



class FeaturedProject extends StatelessWidget {
  final String projectName;
  final bool isMobile;
  final String projectDescription;
  final String projectImage;
  final String projectLink;

  const FeaturedProject({
    super.key,
    required this.projectName,
    required this.projectDescription,
    required this.projectImage,
    required this.projectLink,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    return !isMobile ?
    Container(
        height: context.viewSize.width*.5,
        alignment: AlignmentGeometry.center,
        margin: AppConstants.extraPadding,
        decoration: BoxDecoration(
          // color: AppColors.buttonColorLight.withOpacity(0.2),
          border: Border.all(color: Colors.amberAccent),
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      appCircleAvatar(context, context.viewSize.width*.035, context.viewSize.width*.035,
                          isImage: true, value: projectImage),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Featured Project',
                            style: TextStyle(
                              fontSize: context.viewSize.width*.01,
                              fontWeight: FontWeight.w600,
                              color: Colors.green,
                              letterSpacing: 1.2,
                            ),
                          ),

                          Text(
                            projectName,
                            style:  TextStyle(
                              fontSize: context.viewSize.width*.02,
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    projectDescription,
                    style: context.textTheme.titleLarge!.copyWith(
                      color: context.colorScheme.surface,
                      fontSize: context.viewSize.width*.02,
                      height: 1.3,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                        onPressed: () async{
                          final Uri url = Uri.parse(projectLink);
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url, mode: LaunchMode.externalApplication);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        icon: Icon(Icons.open_in_new_sharp, color: Colors.greenAccent,
                        )
                    ),
                  ),
                ],
              ),
            ),
          ],
        ).withContentPadded
    ).withExtraContextPadded


  :
     Container(
      height: context.viewSize.height*.55,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.amberAccent),
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Project Header
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                appCircleAvatar(
                  context,
                  context.viewSize.width * .075,
                  context.viewSize.width * .075,
                  isImage: true,
                  value: projectImage,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Featured Project',
                      style: TextStyle(
                        fontSize: context.viewSize.width * .04,
                        fontWeight: FontWeight.w600,
                        color: Colors.green,
                        letterSpacing: 1.2,
                      ),
                    ),
                    Text(
                      projectName,
                      style: TextStyle(
                        fontSize: context.viewSize.width * .05,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Divider
          Container(
            height: 1.5,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            color: Colors.white.withOpacity(0.2),
          ),

          // Description
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              projectDescription,
              style: context.textTheme.titleLarge!.copyWith(
                color: context.colorScheme.surface,
                fontSize: context.viewSize.width * .05,
                height: 1.3,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          Container(
            padding: const EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.center,
              child: IconButton(
                onPressed: () async {
                  final Uri url = Uri.parse(projectLink);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                icon: Icon(
                  Icons.open_in_new_sharp,
                  color: Colors.greenAccent,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    ).withContentPadded;
}
  }
