import 'package:eb_hy/pages/panel_widget.dart';
import 'package:eb_hy/pages/taik_page.dart';
import 'package:eb_hy/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:eb_hy/components/app_bar_component.dart';
import 'package:solana_web3/solana_web3.dart' as web3;
import 'package:solana_web3/programs.dart' show SystemProgram;
import 'package:solana_web3/solana_web3.dart';

import '../utils/web3_solana.dart';


class NftMarketplacePage extends StatefulWidget {
  const NftMarketplacePage({Key? key}) : super(key: key);

  @override
  _NftMarketplacePageState createState() => _NftMarketplacePageState();
}

class _NftMarketplacePageState extends State<NftMarketplacePage> {
  late VideoPlayerController _controller;
  late VideoPlayerController controller2;
  late VideoPlayerController controller3;
  late VideoPlayerController controller4;
    bool isPanelVisible = false;

  @override
  void initState() {
    super.initState();
    // _controller = VideoPlayerController.asset('assets/svg/video1.mp4')
    //   ..addListener(() {})
    //   ..setLooping(true)
    //   ..initialize().then((_) {
    //     _controller.play();
    //   });

    // controller2 = VideoPlayerController.asset('assets/svg/video2.mp4')
    //   ..addListener(() {})
    //   ..setLooping(true)
    //   ..initialize().then((_) {
    //   });

    // controller3 = VideoPlayerController.asset('assets/svg/video3.mp4')
    //   ..addListener(() {})
    //   ..setLooping(true)
    //   ..initialize().then((_) {
    //   });

    // controller4 = VideoPlayerController.asset('assets/svg/video4.mp4')
    //   ..addListener(() {})
    //   ..setLooping(true)
    //   ..initialize().then((_) {
    //   });


  }


  @override
  void dispose() {
    super.dispose(); 
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.only(left: 18, right: 18, top:10),
      child: Column(
        children: [

          const SizedBox(height: 20,),
          _singleSection(context, 'CLUBS',
            [
              buildPostsSection(context, 'assets/svg/manchester-united-logo-png-transparent.png', 'Manchester Utd', 'assets/svg/social_feed_talk_ai.webp'),
              buildPostsSection(context, 'assets/svg/chelsea_logo.jpg', 'Chelsea FC', 'assets/svg/social_feed_talk_ai.webp'),
              buildPostsSection(context, 'assets/svg/liverpool_fc_logo.jpg', 'Liverpool FC', 'assets/svg/social_feed_talk_ai.webp'),
              buildPostsSection(context, 'assets/svg/man_city_logo.jpg', 'Manchester City', 'assets/svg/social_feed_talk_ai.webp'),
            ]
            // [
            //   buildPostsSectionVideo(context, 'assets/svg/post_image_profile.png', 'WS Ashika animated 350sol', 'assets/svg/social_feed_talk_ai.webp', _controller),
            //   buildPostsSectionVideo(context, 'assets/svg/post_image_profile.png', 'WS Sumi animated 350sol', 'assets/svg/social_feed_talk_ai.webp', controller2),
            //   buildPostsSectionVideo(context, 'assets/svg/post_image_profile.png', 'WS Serafin animated 350sol', 'assets/svg/social_feed_talk_ai.webp', controller3),
            //   buildPostsSectionVideo(context, 'assets/svg/post_image_profile.png', 'WS Sara animated 350sol', 'assets/svg/social_feed_talk_ai.webp', controller4),
            // ]
          ),
          const SizedBox(height: 10),
          _singleSection(context, 'NEWS AGENCIES',
              [
                buildPostsSection(context, 'assets/svg/bbc_sport_logo.jpg', 'BBC Sport', 'assets/svg/social_feed_talk_ai.webp'),
                buildPostsSection(context, 'assets/svg/espnlogo.png', 'ESPN', 'assets/svg/social_feed_talk_ai.webp'),
                buildPostsSection(context, 'assets/svg/SPORTbible_logo.jpg', 'Sport Bible', 'assets/svg/social_feed_talk_ai.webp'),
                buildPostsSection(context, 'assets/svg/sky-sports-news logo.png', 'Sky Sports', 'assets/svg/social_feed_talk_ai.webp'),
              ]),
          const SizedBox(height: 10),
          _singleSection(context, 'PLAYERS', [
                buildPostsSection(context, 'assets/svg/lebron-james-lakers.jpg', 'Lebron', 'assets/svg/social_feed_talk_ai.webp'),
                buildPostsSection(context, 'assets/svg/rory-mcilroy.jpg', 'Rory McIlroy', 'assets/svg/social_feed_talk_ai.webp'),
                buildPostsSection(context, 'assets/svg/caitlyn_clark.jpeg', 'Caitlyin Clark', 'assets/svg/social_feed_talk_ai.webp'),
              ]),
            const SizedBox(height: 10),
          _singleSection(context, 'JOURNALISTS', [
                buildPostsSection(context, 'assets/svg/gary-lineker.jpg', 'Gary Lineker', 'assets/svg/social_feed_talk_ai.webp'),
                buildPostsSection(context, 'assets/svg/Gabby-Logan.jpg', 'Gabby Logan', 'assets/svg/social_feed_talk_ai.webp'),
                buildPostsSection(context, 'assets/svg/jamiecarragher.jpg', 'Jamie Carrangher', 'assets/svg/social_feed_talk_ai.webp'),
                buildPostsSection(context, 'assets/svg/5005673.png', 'Micah Richards', 'assets/svg/social_feed_talk_ai.webp'),
              ]),
        ],
      ),
    ));
  }

  Widget _singleSection(BuildContext context, String title, List<Widget> images) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 4),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        _contentSendMoney(context, images),
      ],
    );
  }

  Widget _contentOverView(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).cardColor,
            // color: const Color(0xffF1F3F6),
          ),
          child: Image.asset(
            'assets/svg/lego.png',
            fit: BoxFit.contain,
          ),
        ),


        AnimatedOpacity(
          opacity: isPanelVisible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: isPanelVisible
              ? PanelWidget(
                  onClose: () {
                    setState(() {
                      isPanelVisible = !isPanelVisible;
                    });
                  },
                )
              : const SizedBox.shrink(), // Hidden when not visible
        ),
      ],
    );
  }

  Widget _contentSendMoney(BuildContext context, List<Widget> images) {
    return SizedBox(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: images
      ),
    );
  }

  Widget buildPostsSection(BuildContext context, String imagePath, String title, String badgeImagePath){
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(top: 12, left: 10, right: 10, bottom: 10),
      width: 200,
      decoration: BoxDecoration(
        color: const Color(0xFF030b1d),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFFE0151), // Use the specified color
            offset: Offset(0, 1), // Set X and Y offsets to 0
            blurRadius: 6,
            spreadRadius: 1,
          ),
        ],
      ),
      child:
      Stack(
        alignment: Alignment.topRight,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              bottom: 1, // Adjust the positioning as needed
              left: 1,// Adjust the positioning as needed
              child: Text(
                  style: const TextStyle(
                      color: Colors.white
                  ),
                  title)
          ),
        ],
      ),
    );
  }

  Widget buildPostsSectionVideo(BuildContext context, String imagePath, String title, String badgeImagePath, VideoPlayerController controller){

      return GestureDetector(
        onTap: (){
          controller.play();
        },
        onLongPress: () {
        _showDonationDialog(context);
      }
        ,
        child: Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(top: 12, left: 10, right: 10, bottom: 10),
          width: 200,
          decoration: BoxDecoration(
            color: const Color(0xFF061437),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFFFE0151), // Use the specified color
                offset: Offset(0, 1), // Set X and Y offsets to 0
                blurRadius: 6,
                spreadRadius: 1,
              ),
            ],
          ),
          child:
          Stack(
            alignment: Alignment.topRight,
            children: [
              VideoPlayer(controller),
              Positioned(
                top: 5.0, // Adjust the positioning as needed
                right: 5.0, // Adjust the positioning as needed
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF98FDEE), // Use the specified color
                        offset: Offset(1, 2), // Set X and Y offsets to 0
                        blurRadius: 4,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 15.0,
                    backgroundImage:
                    AssetImage(badgeImagePath),
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
              Positioned(
                  bottom: 1, // Adjust the positioning as needed
                  left: 1,// Adjust the positioning as needed
                  child: Text(
                      style: const TextStyle(
                          color: Colors.white
                      ),
                      title)
              ),
            ],
          ),
        ),
      );

    }

  _showDonationDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          color: const Color(0xFF061437),
          width: MediaQuery.of(context).size.width ,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Super Waifu #Serafin ',
                style: TextStyle(
                    color: Colors.white,
                ),
              ),
              const SizedBox(height: 5.0),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 10.0,
                    backgroundImage: AssetImage('assets/svg/chiliz_logo.png'),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(width: 4),
                  Text(
                    '350 SOL',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 5.0),
              _buildDonationButton(context),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDonationButton(BuildContext context) {
      return GestureDetector(
        onTap: (){
          Navigator.pop(context);

          final Solana solana = Solana(); // Instantiate ApiService

          List<int> senderPrivateKey = [
            172,
            143,
            173,
            149,
            133,
            7,
            121,
            35,
            19,
            52,
            64,
            116,
            129,
            248,
            18,
            151,
            222,
            116,
            159,
            201,
            107,
            198,
            198,
            69,
            212,
            182,
            137,
            99,
            0,
            252,
            7,
            155,
            162,
            162,
            120,
            31,
            235,
            24,
            89,
            86,
            198,
            232,
            76,
            147,
            17,
            86,
            86,
            145,
            115,
            252,
            222,
            216,
            227,
            245,
            178,
            249,
            143,
            36,
            88,
            23,
            175,
            127,
            159,
            246
          ];
          String toPubKey = '3Ripm28E1HFMz1LstRtibsvoHmznPPxAAiBXiQ7sSSwW';
          double amount = 2.5;
          solana.makeTransaction(senderPrivateKey, toPubKey, amount);

          _showThankYouMessage(context);
        },
        child: Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(top: 10),

          decoration: BoxDecoration(
            color: const Color(0xFF061437),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFF98FDEE),// Use the specified color
                offset: Offset(1, 2), // Set X and Y offsets to 0
                blurRadius: 4,
                spreadRadius: 0,
              ),
            ],
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                'Buy Now',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                ),
              ),

            ],
          ),
        ),
      );
    }

    void _showThankYouMessage(BuildContext context) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color(0xFF061437),
          content: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Super Waifu Serafin added to wallet.',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold
                ),
              ),
              CircleAvatar(
                radius: 15.0,
                backgroundImage:
                AssetImage('assets/svg/heart_like.png'),
                backgroundColor: Colors.transparent,
              )
            ],
          ),
          duration: const Duration(seconds: 5),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      );
    }




}

