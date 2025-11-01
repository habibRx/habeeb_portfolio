import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habeeb_portfolio/core/colors.dart';
import 'package:habeeb_portfolio/widgets/extension.dart';


class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Divider(color: AppColors.background1,
            height: 700,),

            Text("About Me",
              style: context.textTheme.headlineMedium!.copyWith(
                  fontSize: context.viewSize.height*.05
              ),).withContentPadded,

            Divider()
          ],
        ),


        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.buttonColor),
              borderRadius: BorderRadius.circular(context.viewSize.height*.05)


          ),

          width: context.viewSize.width*.65,
          height: context.viewSize.height*.25,

          child: Text("I am a passionate Flutter developer with over 3 years of hands-on experience building high-quality, scalable, and user-friendly mobile applications. With a strong foundation in Dart, Firebase, REST APIs, GraphQL, and blockchain integrations, I specialize in creating seamless cross-platform solutions that combine performance with great design. I have contributed to diverse projects, from e-commerce platforms to Web3 integrations, always focusing on clean architecture, maintainable code, and intuitive user experiences. Beyond technical expertise, I bring strong problem-solving skills, adaptability, and a growth mindset that helps me deliver results in fast-paced environments. My goal is to build impactful applications that solve real-world problems while continuously learning and refining my craft as a developer.",
          style: context.textTheme.titleLarge!.copyWith(
            color: AppColors.buttonColorLight
          ),).withContentPadded,
        )
      ],
    );
  }
}
