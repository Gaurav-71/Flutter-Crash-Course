# Flutter-Crash-Course

A quick crash course to learn flutter

## Installation & Setup

Video Reference : <https://youtu.be/1gDhl4leEzA>

1. Download SDK

   Download Flutter SDK, extract the "Flutter" folder and put somewhere on your machine
   <https://flutter.dev/docs/get-started/install>

2. Add path

   Add path for 'location/flutter/bin'

3. Check dependencies

   ```
   flutter doctor
   ```

4. Install Xcode (Mac)

   <https://developer.apple.com/xcode/>

5. Configure Xcode command line tools (Mac)

   ```
   sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
   sudo xcodebuild -runFirstLaunch
   ```

6. Test iOS Simulator (Mac)

   ```
   open -a Simulator
   ```

7. Install Android Studio

   <https://developer.android.com/studio>

8. Install Flutter plugin

9. Create virtual device from AVD manager

10. Install VSCode Flutter extension

## Create flutter app

```
flutter create my_app
```

## Package Installation Source

<https://pub.dev>

## Run flutter apps on iOS

- https://www.youtube.com/watch?v=AYNhO9dcbBI

- https://docs.flutter.dev/get-started/install/macos#deploy-to-ios-devices

## Documentation

- <https://docs.flutter.dev>

- <https://dart.dev/guides>

## M1 Errors

Uncomment the below line and set version to 10.0 in PodFile file in iOS folder.

`# platform :ios, '9.0'` > `platform :ios, '10.0'`

Run the following command in terminal

`sudo arch -x86_64 gem install ffi`

Go to ios folder then run :-

`arch -x86_64 pod install`

Useful Links :-

- <https://stackoverflow.com/questions/59921997/could-not-build-the-application-for-the-simulator-error-launching-application-o>

- <https://stackoverflow.com/questions/67443265/error-regarding-undefined-method-map-for-nilnilclass-for-flutter-app-cocoap>

- <https://velog.io/@killerj1/Flutter-CocoaPods-error>
