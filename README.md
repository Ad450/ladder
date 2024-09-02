# Ladder

To run

Environment requirement

Flutter version : 3.19.5

android minSdkVersion 23
ios version 13

Build Instructions

To build apk for android: flutter run apk --release

To build an ipa

- enable automatic signing capabilities in xcode
- should have an apple developer account or team
- should select a deployment target

commmand : flutter run ipa

Side notes on important project dependencies

State management - flutter bloc
Local storage - hive flutter
Code generation tools - json serializable, freezed

Note:
Even though project dependencies captures firebase core and auth, it's not being used
and would not affect project subsequent builds
