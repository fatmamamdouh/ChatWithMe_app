import 'package:chats/screens/login_email_screen.dart';
import 'package:chats/style/colors.dart';
import 'package:chats/widgets/shadow_of_head_of_screens.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onBoardingModel
{
  String image;
  String title;
  String description;

  onBoardingModel({
    required this.image,
    required this.title,
    required this.description,
});
}
class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  List<onBoardingModel> onBoardingList =
  [
    onBoardingModel(
        image: "assets/images/onboarding1.png",
        title: "Group Chatting",
        description: "Connect with multiple members in groups.",
    ),
    onBoardingModel(
      image: "assets/images/onboarding2.png",
      title: "Message Encryption",
      description: "Ensure privacy with encrypted messages.",
    ),
    onBoardingModel(
      image: "assets/images/onboarding3.png",
      title: "Cross-Platform Compatibility",
      description: "Access chats on any device seamlessly.",
    ),
  ];

  var boardController = PageController();

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index)
                {
                  if(index == onBoardingList.length - 1)
                  {
                    print('last !!!!!!!');
                    isLast = true;
                  } else {
                    print('Not laast');
                    isLast = false;
                  }
                },
                controller: boardController,
                physics: BouncingScrollPhysics(),
                itemCount: onBoardingList.length,
                itemBuilder: (context, index) => onBoardingItemBuilder(onBoardingList[index]),
              ),
            ),
            ShadowOfHeadOfScreens(),
            Container(
              color: Color(0xff092A51),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  spacing: 50,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 60,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: ()
                          {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => LoginEmailScreen()),
                                  (route) => false,);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: secondaryColor,
                          ),
                          child: Text(
                            "Get started", style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                      ),)),
                    ),
                    Row(
                      children: [
                        TextButton(
                            onPressed: (){
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => LoginEmailScreen()),
                                    (route) => false,);
                            },
                            child: Text(
                              "Skip",
                              style: TextStyle(
                                fontSize: 18,
                                color: secondaryColor
                              ),
                            ),
                        ),
                        Spacer(flex: 1,),
                        SmoothPageIndicator(
                          controller: boardController,
                          count: onBoardingList.length,
                          axisDirection: Axis.horizontal,
                          effect:  WormEffect(
                            dotColor: Color(0xffA7E4FF),
                            activeDotColor: secondaryColor,
                            radius: 30,
                            dotHeight: 12,
                            dotWidth: 12,)
                        ),
                        Spacer(flex: 1,),
                        GestureDetector(
                          onTap: ()
                          {
                            if(isLast == true)
                            {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => LoginEmailScreen()),
                                    (route) => false,);
                            } else
                            {
                              boardController.nextPage(
                                  duration: Duration(
                                    milliseconds: 750,
                                  ),
                                  curve: Curves.fastLinearToSlowEaseIn);
                            }
                          },
                          child: CircleAvatar(
                            backgroundColor: Color(0xffA7E4FF),
                            radius: 30,
                            child: Text(
                              "Next",
                              style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff1B526B),
                            ),),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget onBoardingItemBuilder(onBoardingModel model) => Expanded(
    child: Column(
      children: [
        SizedBox(
          height: 70,
        ),
        Image.asset(
          "${model.image}",
          width: 450,
          height: 250,
        ),
        SizedBox(
          height: 50,
        ),
        Text(
          "${model.title}",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: secondaryColor,
          ),),
        SizedBox(
          height: 15,
        ),
        Expanded(
          child: Expanded(
            child: Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              "${model.description}",
              style: TextStyle(
                fontSize: 18,
                color: secondaryColor,
              ),),
          ),
        ),
      ],
    ),
  );
}
