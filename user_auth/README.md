# User Authentication

A new Flutter project with Firebase.

## Youtube Reference Link

https://youtube.com/playlist?list=PL4cUxeGkcC9j--TKIdkb3ISfRbJeJYQwC

https://www.youtube.com/watch?v=yj4vaz2rxC0

## Flutter package Source

Website : https://pub.dev

- `flutter pub add provider`

- `flutter pub add firebase_core`

- `flutter pub add firebase_auth`

- Loading Animations : `flutter pub add flutter_spinkit`

## Fix Firebase install error

Uncomment the below line and set version to 10.0 in PodFile file in iOS folder.

`# platform :ios, '9.0'` > `platform :ios, '10.0'`

Run the following command in terminal

`sudo arch -x86_64 gem install ffi`

Go to ios folder then run :-

`arch -x86_64 pod install`

Useful Links :-

- https://stackoverflow.com/questions/59921997/could-not-build-the-application-for-the-simulator-error-launching-application-o

- https://stackoverflow.com/questions/67443265/error-regarding-undefined-method-map-for-nilnilclass-for-flutter-app-cocoap

- https://velog.io/@killerj1/Flutter-CocoaPods-error

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
