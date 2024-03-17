import 'package:flutter/material.dart';
import 'package:eb_hy/pages/drawer_page.dart';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart';
import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auth0_flutter/auth0_flutter_web.dart';
import 'package:uni_links/uni_links.dart';
import 'dart:async';


import 'package:flutter_dotenv/flutter_dotenv.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  Credentials? _credentials;

  late Auth0 auth0;
  late Auth0Web auth0Web;
  
  static DateTime now = DateTime.now();
  String formattedTime = DateFormat.jm().format(now);
  String formattedDate = DateFormat('MMM d, yyyy | EEEEEE').format(now);

  @override
  void initState() {
    super.initState();
    auth0 =  Auth0(dotenv.env['AUTH0_DOMAIN']!, dotenv.env['AUTH0_CLIENT_ID']!);
    auth0Web =
        Auth0Web(dotenv.env['AUTH0_DOMAIN']!, dotenv.env['AUTH0_CLIENT_ID']!);

    if (kIsWeb) {
      auth0Web.onLoad().then((final credentials) => setState(() {
        _credentials = credentials;
        
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    // if (_credentials != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DrawerPage()),
        );
      });
    // }

    return Material(
      color: const Color(0xFF030b1d),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _topContent(),
                    _bottomContent(),
                    _centerContent()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _topContent() {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(top: 20), // Adjust the top padding as needed
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/svg/scorpion_text_logo.png', width: 200, height: 200), // Set your image size as needed
            SizedBox(height: 20), // Space between logo and email input
            Text(
              'Email',
              style: TextStyle(color: Colors.red, fontSize: 16), // Adjust the text style as needed
            ),
            SizedBox(height: 8), // Space between label and input box
            Container(
              width: 250, // Set your width or use MediaQuery for responsive width
              height: 40,
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: '',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16), // Space between email input and password label
            Text(
              'Password',
              style: TextStyle(color: Colors.red, fontSize: 16), // Adjust the text style as needed
            ),
            SizedBox(height: 8), // Space between label and input box
            Container(
              width: 250, // Set your width or use MediaQuery for responsive width
              height: 40,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _centerContent() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 55.0,
                backgroundImage:
                AssetImage('assets/svg/taik_logo.webp'),
                backgroundColor: Colors.transparent,
              ),
              CircleAvatar(
                radius: 55.0,
                backgroundImage:
                AssetImage('assets/svg/chiliz_logo.png'),
                backgroundColor: Colors.transparent,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _bottomContent() {
    return Column(
      children: <Widget>[
            ElevatedButton(
              onPressed: () {
              },
              child: Text("Log In"),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.grey,
                backgroundColor: Colors.white, 
              ),
            ),
            // Second Button: Log In with WorldCoin (Executes auth logic)
            const SizedBox(
              height: 12,
            ),
            _credentials == null
              ? ElevatedButton(
                  onPressed: () async {
                    final credentials = await auth0
                      .webAuthentication(scheme: dotenv.env['AUTH0_CUSTOM_SCHEME'])
                      .login();
                    print(credentials);
                    setState(() {
                      _credentials = credentials;
                    });
                  },
                  child: const Text("Log In with WorldCoin"),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.blue, // Adjust color to match your app's theme
                    backgroundColor: Colors.white,
                  ),
                )
              : Container(
                  child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Logged In',
                    style: TextStyle(
                      color: Colors.white,
                    )
                  ),
                  const SizedBox(width: 3),
                  CircleAvatar(
                    radius: 18.0,
                    backgroundImage: AssetImage('assets/svg/chiliz_logo.png'),
                    backgroundColor: Colors.transparent,
                  ),
                ],
              ),
                ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Create New Account',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Forgot Password',
          style: Theme.of(context).textTheme.bodyText2,
        )
      ]
    );
  }

  // Widget _bottomContent() {
  //   return Column(
  //     children: <Widget>[
  //       _credentials == null
  //         ? ElevatedButton(
  //             onPressed: () async {
  //               final credentials = await auth0
  //                 .webAuthentication(scheme: dotenv.env['AUTH0_CUSTOM_SCHEME'])
  //                 .login();
  //               print(credentials);
  //               setState(() {
  //                 _credentials = credentials;
  //               });
  //             },
  //             child: const Text("Log in"),
  //           )
  //         : Container(
  //             padding: const EdgeInsets.all(5),
  //             margin: const EdgeInsets.only(top: 10),
  //             width: 150,
  //             decoration: BoxDecoration(
  //               color: const Color(0xFF21345B),
  //               borderRadius: BorderRadius.circular(10.0),
  //               boxShadow: const [
  //                 BoxShadow(
  //                   color: Color(0xFF98FDEE),
  //                   offset: Offset(1, 2),
  //                   blurRadius: 4,
  //                   spreadRadius: 0,
  //                 ),
  //               ],
  //             ),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 const Text(
  //                   'Logged In',
  //                   style: TextStyle(
  //                     color: Colors.white,
  //                   )
  //                 ),
  //                 const SizedBox(width: 3),
  //                 CircleAvatar(
  //                   radius: 18.0,
  //                   backgroundImage: AssetImage('assets/svg/chiliz_logo.png'),
  //                   backgroundColor: Colors.transparent,
  //                 ),
  //               ],
  //             ),
  //           ),
  //       const SizedBox(
  //         height: 20,
  //       ),
  //       Text(
  //         'Create New Account',
  //         style: Theme.of(context).textTheme.bodyText2,
  //       ),
  //       const SizedBox(
  //         height: 10,
  //       ),
  //       Text(
  //         'Forgot Password',
  //         style: Theme.of(context).textTheme.bodyText2,
  //       ),
  //     ],
  //   );
  // }

}
