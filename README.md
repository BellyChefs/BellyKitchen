# Belly Kitchen App - Web & IOS & Android

> ⚠ Web App hosted on Firebase 
>
>  Follow link 👉 https://bellykitchen-619a4.web.app/#/

<p align="center"><img src="https://github.com/BellyChefs/BellyKitchen/blob/main/shots.jpeg" alt="General image"></p>


   <a href="https://twitter.com/flutterfiredev">
    <img src="https://img.shields.io/badge/awesome-Flutter-1da1f2.svg?style=plastic" alt="Awesome Flutter" />
  </a>
  <a href="https://github.com/felangel/bloc">
    <img src="https://img.shields.io/badge/maintained%20with-Riverpod-f700ff.svg?style=plastic" alt="Maintained with Riverpod" />
  </a>
  
![Hits-of-Code](https://hitsofcode.com/github/BellyChefs/BellyKitchen?branch=main)
![Firebase](https://img.shields.io/badge/Firebase-039BE5?style=for-the-badge&logo=Firebase&logoColor=white)
![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Android Studio](https://img.shields.io/badge/Android%20Studio-3DDC84.svg?style=for-the-badge&logo=android-studio&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white)

## Features supported
### :compass: General stuff

* [x] Some fancy animations
* [x] Builds successfully for iOS
* [x] Builds successfully for Web
* [x] Builds successfully for Android
* [x] Dark theme
* [x] App works and it is stable — no crashes or broken behaviour (at least)
* [x] App is fully completed and has at least two reasonable screens (About or Settings are not counted)
* [x] Custom app icon
* [ ] Localisation is implemented

### :compass: Firebase artifacts

* [x] Unhandled exceptions handling with Crashlytics
* [x] Firebase SDK Authentication
* [x] Via Google account Authentication
* [x] Firebase Hosting Deploy
* [x] Firebase Deploy trigger CI&CD pipeline

### :compass: Architecture points

* [x] Handles missing network errors
* [x] Shared Preferences service support
* [x] An entire project follows a certain architecture and state-management
* [ ] Some DI or ServiceLocator library is used

### :compass: CI&CD part

* [x] Github Actions: formatting
* [x] Github Actions: lint
* [x] Github Actions: testing
* [ ] Github Actions: build Android APK
* [x] Github Actions: build Web with web-renderer html
* [x] Github Actions: deploy Web to Firebase Hosting

### Tests 
* [x] Reasonable widget-tests
* [ ] Reasonable integration-tests
* [ ] Reasonable unit-tests for some domain logic entities

## Setup 
```@bash
➜  folder ✗ git clone https://github.com/BellyChefs/BellyKitchen.git
➜  belly git:(main) ✗  flutter pub get

# in case there are conflicts in generatet files
➜  belly git:(main) ✗  flutter pub run build_runner build --delete-conflicting-outputs
➜  belly git:(main) ✗  flutter pub run easy_localization:generate --source-dir ./assets/translations -f keys -o locale_keys.g.dart

➜  belly git:(main) ✗  flutter run
# or for web
➜  belly git:(main) ✗  flutter run -d chrome --web-renderer html  
```
## Test Coverage
```
➜  belly git:(main) ✗ flutter test                   
00:02 +12: All tests passed! 
       
```
- Unit Testing (`flutter_test`)
- Bloc Testing (`bloc_test`)
- Using Mock Data (`mocktail`)
- Github Actions (iOS & Android Testing)


