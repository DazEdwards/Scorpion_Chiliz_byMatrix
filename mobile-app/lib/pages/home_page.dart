import 'package:eb_hy/pages/panel_widget.dart';
import 'package:eb_hy/pages/social_feed_page.dart';
import 'package:eb_hy/pages/taik_page.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eb_hy/pages/nft_marketplace_page.dart';
import 'dart:developer';

import '../components/app_bar_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 2;

  final List<Widget> _pages = [
    TaikPage(),
    const HomePageContent(),
    const SocialFeedPage(),
    const NftMarketplacePage(),
    const HomePageContent(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF030b1d),
        selectedItemColor: Colors.white60,
        unselectedItemColor: Colors.white38,
        selectedFontSize: 12,
        showUnselectedLabels: false,
        elevation: 0,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF98FDEE), // Use the specified color
                    offset: Offset(1, 0), // Set X and Y offsets to 0
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 18.0,
                backgroundImage: AssetImage('assets/svg/taik_logo.webp'),
                backgroundColor: Colors.transparent,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF98FDEE), // Use the specified color
                    offset: Offset(1, 0), // Set X and Y offsets to 0
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 18.0,
                backgroundImage: AssetImage('assets/svg/1UP_gigs.webp'),
                backgroundColor: Colors.transparent,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/svg/scorpion_text_logo.png'),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF98FDEE), // Use the specified color
                    offset: Offset(1, 0), // Set X and Y offsets to 0
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 18.0,
                backgroundImage: AssetImage('assets/svg/1UP_shop.webp'),
                backgroundColor: Colors.transparent,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF98FDEE), // Use the specified color
                    offset: Offset(1, 0), // Set X and Y offsets to 0
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 18.0,
                backgroundImage: AssetImage(
                    'assets/svg/student_support_service_profile_image_2.webp'),
                backgroundColor: Colors.transparent,
              ),
            ),
            label: '',
          ),
        ],
      ),
      appBar: MyAppBar(),
    );
  }
}

class ImageData {
  final String imagePath;
  final String description;

  ImageData({required this.imagePath, required this.description});
}

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  HomePageContentState createState() => HomePageContentState();
}

class HomePageContentState extends State<HomePageContent> {
  bool isPanelVisible = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.only(left: 18, right: 18, top:10),
      child: Column(
        children: [
          _contentOverView(context),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Featured Stories',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
          _contentFeaturedStories(),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'For you',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          _contentSendMoney(context),
        ],
      ),
    ));
  }

  Widget _contentHeader(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 5),
              child: const Column(
                children: [
                  CircleAvatar(
                    radius: 20.0,
                    backgroundImage: AssetImage('assets/svg/taik_logo.webp'),
                    backgroundColor: Colors.transparent,
                  ),
                  Text('')
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF98FDEE), // Use the specified color
                            offset: Offset(1, 0), // Set X and Y offsets to 0
                            blurRadius: 4,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: const CircleAvatar(
                        radius: 18.0,
                        backgroundImage:
                            AssetImage('assets/svg/1UP_search.webp'),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF98FDEE), // Use the specified color
                            offset: Offset(1, 0), // Set X and Y offsets to 0
                            blurRadius: 4,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: const CircleAvatar(
                        radius: 18.0,
                        backgroundImage: AssetImage('assets/svg/1UP_AR.webp'),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
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
                        radius: 18.0,
                        backgroundImage:
                            AssetImage('assets/svg/1UP_incoming_messages.webp'),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5, right: 10, bottom: 4),
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
                        radius: 22.0,
                        backgroundImage:
                            AssetImage('assets/svg/1UP_token.webp'),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ],
                ),
                const Text(
                  '',
                  style: TextStyle(color: Colors.white38, fontSize: 8),
                )
              ],
            ),
          ],
        ));
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
            'assets/svg/home_main_talk.png',
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          top: 5.0, // Adjust the positioning as needed
          left: 100.0,
          child: GestureDetector(
            child: const BouncingCircleAvatar(),
            onTap: () {
              setState(() {
                isPanelVisible = !isPanelVisible;
              });
            },
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

  Widget _contentFeaturedStories() {
    List<ImageData> images = [
      ImageData(
          imagePath: 'assets/svg/home_uni_grad_image.png',
          description:
              'Surrey University makes breakthrough AI discovery that enhances human cognition'),
      ImageData(
          imagePath: 'assets/svg/home_uni_grad_image.png',
          description:
              'Surrey University makes breakthrough AI discovery that enhances human cognition'),
      ImageData(
          imagePath: 'assets/svg/home_uni_grad_image.png',
          description:
              'Surrey University makes breakthrough AI discovery that enhances human cognition'),
      // Add more images and descriptions as needed
    ];

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: const Color(0xffF1F3F6),
      ),
      child: Column(
        children: [
          _buildCarousel(images),
        ],
      ),
    );
  }

  Widget _buildCarousel(List<ImageData> images) {
    return CarouselSlider(
      options: CarouselOptions(
          height: 286.0, // Adjust the height as needed
          enlargeCenterPage: true,
          autoPlay: false),
      items: images.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Card(
              color: const Color.fromRGBO(33, 52, 91, 100),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          item.imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Positioned(
                        top: 5.0, // Adjust the positioning as needed
                        right: 5.0, // Adjust the positioning as needed
                        child: CircleAvatar(
                          radius: 20.0,
                          backgroundImage:
                              AssetImage('assets/svg/taik_logo.webp'),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'GROUNDBREAKING DISCOVERIES IN AI',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(bottom: 0, left: 10, right: 10),
                    child: Text(
                      item.description,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 5.0, left: 4, right: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildProfileWidget(), // Circle with image and text on the left
                        _buildActionIcons(
                            context), // Like, share, settings icons on the right
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildProfileWidget() {
    return const Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/svg/uni_logo_stories.png'),
          radius: 14.0,
        ),
        SizedBox(width: 8.0),
        Text(
          'Uni of Surrey',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildActionIcons(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 5),
              child: const CircleAvatar(
                radius: 12.0,
                backgroundImage: AssetImage('assets/svg/share.webp'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 1, right: 10),
              child: Text(
                '100',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 5),
              child: const CircleAvatar(
                radius: 12.0,
                backgroundImage: AssetImage('assets/svg/like.webp'),
              ),
            ),
            const Padding(
                padding: EdgeInsets.only(top: 1),
                child: Text(
                  '100',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ))
          ],
        ),
      ],
    );
  }

  Widget _contentSendMoney(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 10),
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).cardColor,
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/svg/for_you_3.webp',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).cardColor,
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/svg/for_you_grad.webp',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).cardColor,
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/svg/for_you_amazon.webp',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BouncingCircleAvatar extends StatefulWidget {
  const BouncingCircleAvatar({super.key});

  @override
  _BouncingCircleAvatarState createState() => _BouncingCircleAvatarState();
}

class _BouncingCircleAvatarState extends State<BouncingCircleAvatar>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isPanelVisible = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1700),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    ));

    // Start the animation
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return // Adjust the positioning as needed
        ScaleTransition(
      scale: _animation,
      child: const CircleAvatar(
        radius: 50.0,
        backgroundImage: AssetImage('assets/svg/taik_logo.webp'),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
