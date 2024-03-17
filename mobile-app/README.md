# Prerequisites
Before setting up the Flutter application for Android development, ensure you have the following installed:
- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Android Studio](https://developer.android.com/studio) (for Android development)
- [JDK (Java Development Kit)](https://www.oracle.com/java/technologies/javase-jdk11-downloads.html) (required by Android Studio)
- [Git](https://git-scm.com/) (for version control)

You also need an API key from OpenAI for accessing their services. You can obtain one from [here](https://openai.com/).

# Installation
Clone this repository to your local machine:

```bash
clone
cd my-app
```

Install dependencies:

```bash
flutter pub get
```

Create a `.env` file in the root directory of your Flutter project and add your OpenAI API key and Eleven Labs API key:

```
ELEVENLABS_API_KEY=YOUR_ELEVENLABS_API_KEY

```

# Development

To start developing your Flutter application, you can use either Android Studio or Visual Studio Code with the Flutter extension.

If you prefer Android Studio:
1. Open Android Studio.
2. Open the cloned Flutter project directory.
3. Follow the instructions to set up the Flutter SDK path if prompted.
4. Start coding your Flutter app.

If you prefer Visual Studio Code:
1. Open Visual Studio Code.
2. Open the cloned Flutter project directory.
3. Install the Flutter extension if you haven't already.
4. Start coding your Flutter app.

# Building and Running

Before building and running the Flutter app on an Android device or emulator, ensure that you have the necessary Android SDKs and platform tools installed. You can install them using the Android SDK Manager which is bundled with Android Studio.

Once everything is set up, you can build and run the app using the following command:

```bash
flutter run
```

This will build the Flutter app and deploy it to the connected Android device or emulator.

For releasing your Flutter app to the Google Play Store, you'll need to follow the official documentation provided by Flutter on [Publishing to Google Play Store](https://flutter.dev/docs/deployment/android).


