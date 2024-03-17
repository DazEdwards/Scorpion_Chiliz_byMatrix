import 'package:eb_hy/components/app_bar_component.dart';
import 'package:eb_hy/pages/home_page.dart';
import 'package:eb_hy/pages/social_feed_page.dart';
import 'package:eb_hy/pages/nft_marketplace_page.dart';
import 'package:flutter/material.dart';


class BotPageSettingsDefault extends StatefulWidget {
  const BotPageSettingsDefault({Key? key}) : super(key: key);

  @override
  BotPageSettingsDefaultState createState() => BotPageSettingsDefaultState();
}

class BotPageSettingsDefaultState extends State<BotPageSettingsDefault> {
  int _currentIndex = 0;

  String language = "English";

  final List<Widget> _pages = [
    const BotPageSettings(),
    HomePageContent(),
    HomePageContent(),
    const SocialFeedPage(),
    HomePageContent()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E204B),
      body: _pages[_currentIndex],
      appBar: MyAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF0E204B),
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
    );
  }
}

class BotPageSettings extends StatefulWidget {
  const BotPageSettings({super.key});

  @override
  BotPageSettingsState createState() => BotPageSettingsState();
}

class BotPageSettingsState extends State<BotPageSettings> {
  bool isPanelVisible = false;
  String language = "English";
  String language2 = "English";

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        generalCard(context),
        settingPersonality(context),
        settingAccent(context),
        settingSpeakingStyle(context),
        const SizedBox(height: 15),
        applyChanges(context),
        const SizedBox(height: 10),
      ],
    );
  }
  Widget _contentHeader(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(right: 5),
              child: Column(
                children: [Image.asset('assets/svg/scorpion_text_logo.png'), const Text('')],
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

  Widget generalCard(BuildContext context) {
    return  Column(
        children:[
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 12),
            width: MediaQuery.of(context).size.width * 0.89,
            decoration: BoxDecoration(
              color: const Color(0xFF061437),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: const [
                BoxShadow(
                  color:
                  Color.fromRGBO(152, 253, 238, 50), // Use the specified color
                  offset: Offset(0, 0), // Set X and Y offsets to 0
                  blurRadius: 1,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 10),
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
                          radius: 50.0,
                          backgroundImage: AssetImage(
                              'assets/svg/student_support_service_profile_image.webp'),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 5, left:10),
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              "STUDENT SUPPORT",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ),
                          ),
                          Center(
                            child: Text(
                              "University of Surrey",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8),
                            ),
                          )
                        ],
                      ),
                    )

                  ],
                ),
                const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              "NAME: Studentface",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11),
                            ),
                            CircleAvatar(
                              radius: 20.0,
                              backgroundImage: AssetImage(
                                  'assets/svg/edit_bot_info.webp'),
                              backgroundColor: Colors.transparent,
                            ),

                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top:2, right: 10),
                              child: Column(
                                  children: [
                                    Text(
                                      "P : ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                    Text(
                                      "",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ]),
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Very Cool",
                                      style: TextStyle(
                                          color: Colors.white60,
                                          fontSize: 11),
                                    ),
                                  ],

                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Moderate Emphatic",
                                      style: TextStyle(
                                          color: Colors.white60,
                                          fontSize: 11),
                                    ),
                                  ],

                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top:2, right: 10),
                              child: Column(
                                  children: [
                                    Text(
                                      "A : ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                    Text(
                                      "",
                                      style: TextStyle(
                                          color: Colors.white60,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ]),
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Indian 30%",
                                      style: TextStyle(
                                          color: Colors.white60,
                                          fontSize: 11),
                                    ),
                                  ],

                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Scottish 70%",
                                      style: TextStyle(
                                          color: Colors.white60,
                                          fontSize: 11),
                                    ),
                                  ],

                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top:2, right: 10),
                              child: Column(
                                  children: [
                                    Text(
                                      "SS:",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                    Text(
                                      "",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ]),
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Slightly Relaxed",
                                      style: TextStyle(
                                          color: Colors.white60,
                                          fontSize: 11),
                                    ),
                                  ],

                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Highly Professional",
                                      style: TextStyle(
                                          color: Colors.white60,
                                          fontSize: 11),
                                    ),
                                  ],

                                )
                              ],
                            )
                          ],
                        )

                      ],
                    ))
              ],
            ),
          ),
        ],
    );

  }

  Widget settingPersonality(BuildContext context) {
    return  Column(
      children:[
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(top: 12),
          width: MediaQuery.of(context).size.width * 0.89,
          decoration: BoxDecoration(
            color: const Color(0xFF061437),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color:
                Color.fromRGBO(152, 253, 238, 50), // Use the specified color
                offset: Offset(0, 1), // Set X and Y offsets to 0
                blurRadius: 4,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "PERSONALITY",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13),
                  ),
                  Icon(
                    size: 15,
                    Icons.info_outline,
                    color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text(
                    "INTENSITY",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10),
                  ),
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.white,
                        trackHeight: 1.0, // Adjust the thickness of the slider track
                        thumbColor: const Color(0xFF9BE2E6),
                        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8.0),
                        overlayShape: const RoundSliderOverlayShape(overlayRadius: 16.0),
                      ),
                      child: Slider(
                        value: 0.5, // Set the initial value as needed
                        onChanged: (double value) {
                          // Handle the value change
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.white,
                        trackHeight: 1.0, // Adjust the thickness of the slider track
                        thumbColor: const Color(0xFF9BE2E6),
                        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8.0),
                        overlayShape: const RoundSliderOverlayShape(overlayRadius: 16.0),
                      ),
                      child: Slider(
                        value: 0.5, // Set the initial value as needed
                        onChanged: (double value) {
                          // Handle the value change
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height:10),
              Row
                (
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "TYPE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                  // Add some spacing between text and dropdowns
                  Container(
                    height: 25,
                    padding: const EdgeInsets.only(left: 4.0, right: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), // Set the border radius
                      color: const Color(0xFF14254A), // Set the background color
                    ),
                    child: DropdownButton<String>(
                      value: 'Emphatic', // Set the initial value
                      onChanged: (String? value) {
                        // Handle dropdown value change
                      },
                      items: const [
                        DropdownMenuItem<String>(
                          value: 'Emphatic',
                          child: Text('Emphatic',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              )
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Option 2',
                          child: Text('Option 2'),
                        ),
                        // Add more dropdown items as needed
                      ],
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      icon: const Icon(
                        size: 15,
                          Icons.keyboard_arrow_down,
                          color: Colors.white),
                      underline: Container(), // Remove the default underline
                    ),
                  ), // Add some spacing between dropdowns
                  Container(
                    height: 25,
                    padding: const EdgeInsets.only(left: 4.0, right: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), // Set the border radius
                      color: const Color(0xFF14254A), // Set the background color
                    ),
                    child: DropdownButton<String>(
                      value: 'Cool', // Set the initial value
                      onChanged: (String? value) {
                        // Handle dropdown value change
                      },
                      items: const [
                        DropdownMenuItem<String>(
                          value: 'Cool',
                          child: Text('Cool',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              )
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Option 2',
                          child: Text('Option 2'),
                        ),
                        // Add more dropdown items as needed
                      ],
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      icon: const Icon(
                          size: 15,
                          Icons.keyboard_arrow_down,
                          color: Colors.white),
                      underline: Container(), // Remove the default underline
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );

  }

  Widget settingAccent(BuildContext context) {
    return  Column(
      children:[
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(top: 12),
          width: MediaQuery.of(context).size.width * 0.89,
          decoration: BoxDecoration(
            color: const Color(0xFF061437),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFFFE0151),// Use the specified color
                offset: Offset(0, 1), // Set X and Y offsets to 0
                blurRadius: 4,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "ACCENT",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13),
                  ),
                  Icon(
                    size: 15,
                    Icons.info_outline,
                    color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text(
                    "INTENSITY",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10),
                  ),
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.white,
                        trackHeight: 1.0, // Adjust the thickness of the slider track
                        thumbColor: const Color(0xFF9BE2E6),
                        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8.0),
                        overlayShape: const RoundSliderOverlayShape(overlayRadius: 16.0),
                      ),
                      child: Slider(
                        value: 0.5, // Set the initial value as needed
                        onChanged: (double value) {
                          // Handle the value change
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.white,
                        trackHeight: 1.0, // Adjust the thickness of the slider track
                        thumbColor: const Color(0xFF9BE2E6),
                        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8.0),
                        overlayShape: const RoundSliderOverlayShape(overlayRadius: 16.0),
                      ),
                      child: Slider(
                        value: 0.5, // Set the initial value as needed
                        onChanged: (double value) {
                          // Handle the value change
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height:10),
              Row
                (
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "TYPE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                  // Add some spacing between text and dropdowns
                  Container(
                    height: 25,
                    padding: const EdgeInsets.only(left: 4.0, right: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), // Set the border radius
                      color: const Color(0xFF14254A), // Set the background color
                    ),
                    child: DropdownButton<String>(
                      value: language, // Set the initial value
                      onChanged: (String? value) {
                        setState(() {
                          language = value ?? "English";
                          language2 = value ?? "English";
                        });
                      },
                      items: const [
                        DropdownMenuItem<String>(
                          value: 'English',
                          child: Text('English',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              )
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Irish',
                          child: Text(
                              'Irish',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              )
                          ),
                        ),
                        // Add more dropdown items as needed
                      ],
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      icon: const Icon(
                          size: 15,
                          Icons.keyboard_arrow_down,
                          color: Colors.white),
                      underline: Container(), // Remove the default underline
                    ),
                  ), // Add some spacing between dropdowns
                  Container(
                    height: 25,
                    padding: const EdgeInsets.only(left: 4.0, right: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), // Set the border radius
                      color: const Color(0xFF14254A), // Set the background color
                    ),
                    child: DropdownButton<String>(
                      value: language2, // Set the initial value
                      onChanged: (String? value) {
                      },
                      items: const [
                        DropdownMenuItem<String>(
                          value: 'English',
                          child: Text('English',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              )
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Irish',
                          child: Text('Irish', style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          )),
                        ),
                        // Add more dropdown items as needed
                      ],
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      icon: const Icon(
                          size: 15,
                          Icons.keyboard_arrow_down,
                          color: Colors.white),
                      underline: Container(), // Remove the default underline
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );

  }

  Widget settingSpeakingStyle(BuildContext context) {
    return  Column(
      children:[
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(top: 12),
          width: MediaQuery.of(context).size.width * 0.89,
          decoration: BoxDecoration(
            color: const Color(0xFF061437),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFFFDCC63),// Use the specified color
                offset: Offset(0, 1), // Set X and Y offsets to 0
                blurRadius: 4,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "SPEAKING STYLE",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13),
                  ),
                  Icon(
                    size: 15,
                    Icons.info_outline,
                    color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text(
                    "INTENSITY",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10),
                  ),
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.white,
                        trackHeight: 1.0, // Adjust the thickness of the slider track
                        thumbColor: const Color(0xFF9BE2E6),
                        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8.0),
                        overlayShape: const RoundSliderOverlayShape(overlayRadius: 16.0),
                      ),
                      child: Slider(
                        value: 0.5, // Set the initial value as needed
                        onChanged: (double value) {
                          // Handle the value change
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Colors.white,
                        trackHeight: 1.0, // Adjust the thickness of the slider track
                        thumbColor: const Color(0xFF9BE2E6),
                        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8.0),
                        overlayShape: const RoundSliderOverlayShape(overlayRadius: 16.0),
                      ),
                      child: Slider(
                        value: 0.5, // Set the initial value as needed
                        onChanged: (double value) {
                          // Handle the value change
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height:10),
              Row
                (
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "TYPE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                  // Add some spacing between text and dropdowns
                  Container(
                    height: 25,
                    padding: const EdgeInsets.only(left: 4.0, right: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), // Set the border radius
                      color: const Color(0xFF14254A), // Set the background color
                    ),
                    child: DropdownButton<String>(
                      value: 'Relaxed', // Set the initial value
                      onChanged: (String? value) {
                        // Handle dropdown value change
                      },
                      items: const [
                        DropdownMenuItem<String>(
                          value: 'Relaxed',
                          child: Text('Relaxed',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              )
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Option 2',
                          child: Text('Option 2'),
                        ),
                        // Add more dropdown items as needed
                      ],
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      icon: const Icon(
                          size: 15,
                          Icons.keyboard_arrow_down,
                          color: Colors.white),
                      underline: Container(), // Remove the default underline
                    ),
                  ), // Add some spacing between dropdowns
                  Container(
                    height: 25,
                    padding: const EdgeInsets.only(left: 4.0, right: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), // Set the border radius
                      color: const Color(0xFF14254A), // Set the background color
                    ),
                    child: DropdownButton<String>(
                      value: 'Professional', // Set the initial value
                      onChanged: (String? value) {
                        // Handle dropdown value change
                      },
                      items: const [
                        DropdownMenuItem<String>(
                          value: 'Professional',
                          child: Text('Professional',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              )
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Option 2',
                          child: Text('Option 2'),
                        ),
                        // Add more dropdown items as needed
                      ],
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      icon: const Icon(
                          size: 15,
                          Icons.keyboard_arrow_down,
                          color: Colors.white),
                      underline: Container(), // Remove the default underline
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );

  }

  Widget applyChanges(BuildContext context) {
    return  Column(
      children:[
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(top: 12),
          width: MediaQuery.of(context).size.width * 0.89,
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
          child: const Column(
            children: [
              Text(
                'APPLY CHANGES',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              )
          ]),
        ),
      ],
    );

  }
}
