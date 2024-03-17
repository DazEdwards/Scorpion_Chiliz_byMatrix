import 'package:eb_hy/utils/web3_solana.dart';
import 'package:flutter/material.dart';
import 'package:solana_web3/solana_web3.dart' as web3;
import 'package:solana_web3/programs.dart' show SystemProgram;
import 'package:solana_web3/solana_web3.dart';


class SocialFeedPage extends StatefulWidget {
  const SocialFeedPage({super.key});

  @override
  SocialFeedPageState createState() => SocialFeedPageState();
}

class SocialFeedPageState extends State<SocialFeedPage> {
  bool isPanelVisible = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.only(left: 5, top: 0, bottom:10),
      child: Column(
        children: [
          buildstoriesrow(),
          buildShortsSection(),
          buildTweetSection(),
          buildPostsSection()
        ],
      ),
    ));
  }

  Widget buildstoriesrow() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red, 
                      offset: Offset(1, 2), // Set X and Y offsets to 0
                      blurRadius: 4,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  radius: 35.0,
                  backgroundImage: AssetImage('assets/svg/Los_Angeles_Lakers_logo.png'),
                  backgroundColor: Colors.transparent,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red, 
                      offset: Offset(1, 2), // Set X and Y offsets to 0
                      blurRadius: 4,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  radius: 35.0,
                  backgroundImage: AssetImage('assets/svg/nike_logo.webp'),
                  backgroundColor: Colors.transparent,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red, 
                      offset: Offset(1, 2), // Set X and Y offsets to 0
                      blurRadius: 4,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  radius: 35.0,
                  backgroundImage: AssetImage('assets/svg/bbc_sport_logo.jpg'),
                  backgroundColor: Colors.transparent,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 5),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red, // Use the specified color
                      offset: Offset(1, 2), // Set X and Y offsets to 0
                      blurRadius: 4,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  radius: 35.0,
                  backgroundImage: AssetImage('assets/svg/manchester-united-logo-png-transparent.png'),
                  backgroundColor: Colors.transparent,
                ),
              )
            ],
          ),
        ));
  }

  Widget buildActionButtons() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10, top: 5, bottom: 10),
            height: 35,
            width: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF020041),
              borderRadius: BorderRadius.circular(3.0),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFF98FDEE), // Use the specified color
                  blurRadius: 6,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Image.asset('assets/svg/action_button_1.webp'),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, top: 5, bottom: 10),
            height: 35,
            width: 100,
            decoration: BoxDecoration(
              color: const Color(0xFF00F7EC),
              borderRadius: BorderRadius.circular(3.0),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFF98FDEE), // Use the specified color
                  blurRadius: 6,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: const Padding(
              padding: EdgeInsets.only(left: 2, right: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 14,
                    backgroundImage:
                        AssetImage('assets/svg/action_button_3.webp'),
                    backgroundColor: Colors.transparent,
                  ),
                  CircleAvatar(
                    radius: 14,
                    backgroundImage:
                        AssetImage('assets/svg/action_button_2.webp'),
                    backgroundColor: Colors.transparent,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, top: 5, bottom: 10),
            height: 35,
            width: 100,
            decoration: BoxDecoration(
              color: const Color(0xFFFE0151),
              borderRadius: BorderRadius.circular(3.0),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFF98FDEE), // Use the specified color
                  blurRadius: 6,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: const Padding(
              padding: EdgeInsets.only(left: 2, right: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 14,
                    backgroundImage:
                        AssetImage('assets/svg/action_button_4.webp'),
                    backgroundColor: Colors.transparent,
                  ),
                  CircleAvatar(
                    radius: 14,
                    backgroundImage:
                        AssetImage('assets/svg/action_button_2.webp'),
                    backgroundColor: Colors.transparent,
                  ),
                ],
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(left: 10, top: 5, bottom: 10),
              height: 35,
              width: 100,
              decoration: BoxDecoration(
                color: const Color(0xFFFDCC63),
                borderRadius: BorderRadius.circular(3.0),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFF98FDEE), // Use the specified color
                    blurRadius: 6,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 2, right: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 14,
                      backgroundImage:
                          AssetImage('assets/svg/action_button_3.webp'),
                      backgroundColor: Colors.transparent,
                    ),
                    CircleAvatar(
                      radius: 14,
                      backgroundImage:
                          AssetImage('assets/svg/action_button_2.webp'),
                      backgroundColor: Colors.transparent,
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget buildShortsSection() {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(top: 12),
      width: MediaQuery.of(context).size.width * 0.93,
      decoration: BoxDecoration(
        color: const Color(0xFF030b1d),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.red, // Use the specified color
            offset: Offset(0, 1), // Set X and Y offsets to 0
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 5, top: 5, bottom:5),
        child: Row(
          children: [
            Image.asset('assets/svg/short_1.png', width:150, height:250),
            SizedBox(width:10,),
            Image.asset('assets/svg/short_2.png', width:150, height:250),
            SizedBox(width:10,),
            Image.asset('assets/svg/short_3.png', width:150, height:250),
            SizedBox(width:10,)
          ],
        ),
      ),
    );
  }

  Widget buildTweetSection() {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(top: 12),
      width: MediaQuery.of(context).size.width * 0.93,
      decoration: BoxDecoration(
        color: const Color(0xFF030b1d),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.red, // Use the specified color
            offset: Offset(0, 1), // Set X and Y offsets to 0
            blurRadius: 6,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    child: const CircleAvatar(
                      radius: 13.0,
                      backgroundImage: AssetImage(
                          'assets/svg/5005673.png'),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 5, top: 7),
                    child: Text(
                      'Micah_Richards',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              Container(
                child: const CircleAvatar(
                  radius: 15.0,
                  backgroundImage:
                      AssetImage('assets/svg/social_feed_talk_ai.webp'),
                  backgroundColor: Colors.transparent,
                ),
              )
            ],
          ),
          const Row(
            children: [
              Expanded(
                  child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'It’s great that we can post different types of content in the same app... about time! And I’m Verified for free...',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
              ))
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Column(
                children: [
                  Row(
                    children: [
                      const Row(
                        children: [
                          CircleAvatar(
                            radius: 15.0,
                            backgroundImage:
                            AssetImage('assets/svg/feed_comment.webp'),
                            backgroundColor: Colors.transparent,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left:0, top:4, right: 10),
                            child: Text(
                              '7',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        ],
                      ),
                      const Row(
                        children: [
                          CircleAvatar(
                            radius: 15.0,
                            backgroundImage:
                            AssetImage('assets/svg/feed_like.webp'),
                            backgroundColor: Colors.transparent,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left:0, top:4, right: 10),
                            child: Text(
                              '12',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        ],
                      ),
                      const Row(
                        children: [
                          CircleAvatar(
                            radius: 15.0,
                            backgroundImage:
                            AssetImage('assets/svg/feed_share.webp'),
                            backgroundColor: Colors.transparent,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left:0, top:4, right: 10),
                            child: Text(
                              '2',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 5, right: 10, bottom: 4),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.red, // Use the specified color
                              offset: Offset(1, 2), // Set X and Y offsets to 0
                              blurRadius: 4,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: const CircleAvatar(
                          radius: 15.0,
                          backgroundImage:
                          AssetImage('assets/svg/coin.png'),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }

  Widget buildPostsSection(){
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(top: 12),
      width: MediaQuery.of(context).size.width * 0.92,
      decoration: BoxDecoration(
        color: const Color(0xFF030b1d),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.red, // Use the specified color
            offset: Offset(0, 1), // Set X and Y offsets to 0
            blurRadius: 6,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    child: const CircleAvatar(
                      radius: 13.0,
                      backgroundImage: AssetImage(
                          'assets/svg/lebron-james-lakers.jpg'),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 5, top: 7),
                    child: Text(
                      'Lebron James',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),

            ],
          ),
          const SizedBox(height: 10),
          Stack(
            alignment: Alignment.topRight,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset('assets/svg/lebron_1.jpeg',
                  fit: BoxFit.cover,
                ),
              ),
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
                  child: const CircleAvatar(
                    radius: 15.0,
                    backgroundImage:
                    AssetImage('assets/svg/social_feed_talk_ai.webp'),
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'We own this city!',
                style: TextStyle(
                    fontSize: 8,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              ),
              Row(
                children: [
                  const Row(
                    children: [
                      CircleAvatar(
                        radius: 15.0,
                        backgroundImage:
                        AssetImage('assets/svg/feed_comment.webp'),
                        backgroundColor: Colors.transparent,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left:0, top:4, right: 10),
                        child: Text(
                          '7',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                    ],
                  ),
                  const Row(
                    children: [
                      CircleAvatar(
                        radius: 15.0,
                        backgroundImage:
                        AssetImage('assets/svg/feed_like.webp'),
                        backgroundColor: Colors.transparent,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left:0, top:4, right: 10),
                        child: Text(
                          '12',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                    ],
                  ),
                  const Row(
                    children: [
                      CircleAvatar(
                        radius: 15.0,
                        backgroundImage:
                        AssetImage('assets/svg/feed_share.webp'),
                        backgroundColor: Colors.transparent,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left:0, top:4, right: 10),
                        child: Text(
                          '2',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                    ],
                  ),
                  GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.only(left: 5, right: 10, bottom: 4),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red, // Use the specified color
                            offset: Offset(1, 2), // Set X and Y offsets to 0
                            blurRadius: 4,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: const CircleAvatar(
                        radius: 15.0,
                        backgroundImage:
                        AssetImage('assets/svg/coin.png'),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    onTap: (){
                      // print('Donation button has been tapped');
                      _showDonationDialog(context);
                    },

                  )

                ],
              ),

            ],
          ),
        ],
      ),
    );
  }

  void _showDonationDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          color: const Color(0xFF061437),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Tip this post',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 5.0),
              _buildDonationButton(context, 0.001),
              _buildDonationButton(context, 0.002),
              _buildDonationButton(context, 0.003),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDonationButton(BuildContext context, double amount) {
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
        solana.makeTransaction(senderPrivateKey, toPubKey, amount);

        // _showThankYouMessage(context);


      },
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(top: 10),
        width: 150,
        decoration: BoxDecoration(
          color: const Color(0xFF061437),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.red,// Use the specified color
              offset: Offset(1, 2), // Set X and Y offsets to 0
              blurRadius: 4,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$amount',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(width: 5),
            const CircleAvatar(
              radius: 15.0,
              backgroundImage:
              AssetImage('assets/svg/coin.png'),
              backgroundColor: Colors.transparent,
            )
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
              'Thanks',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
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
