<p align="center">
<img src="http://motyliar.webd.pro/social/appLogo.png" alt="Logo" width="300" height="220">

</p>



## Tech Stack
The application is exclusively for the Android platform.<br><br>
**OS:** ![Static Badge](https://img.shields.io/badge/Android-green) ![Static Badge](https://img.shields.io/badge/29.0-white?label=AndroidSDK&labelColor=green)<br>
**Client:**     ![Static Badge](https://img.shields.io/badge/3.13.2-white?label=flutter&labelColor=blue&color=white) ![Static Badge](https://img.shields.io/badge/3.1.0-white?label=dart&labelColor=blue&color=white)<br>
**Server:** ![Static Badge](https://img.shields.io/badge/JavaScript-yellow) ![Static Badge](https://img.shields.io/badge/NODE.JS-green)![Static Badge](https://img.shields.io/badge/Express-grey)<br>
**DataBase:** ![Static Badge](https://img.shields.io/badge/MongoDB--Atlas-white?label=NoSQL&labelColor=yellow)<br>
## JoinMee - SocialApp
![Static Badge](https://img.shields.io/badge/Important-red)
App still in develop stage. <br><br>
### About
The project is a social media app designed for the sports community. Its main functionality is to help users find people to do sports together.
The app is based on sending sports notices to a global notice board and allows communication between users via an in-app messenger.
<br>Readme update from: 26.03.24

### Screenshots
<p align="center" >
  <span style="margin-right: 10px;">
    <img src="http://65.21.202.169:20119/folio/01.jpg" alt="Logo" width="90" height="170" >
    <img src="http://65.21.202.169:20119/folio/02.jpg" alt="Logo" width="90" height="170" >     
    <img src="http://65.21.202.169:20119/folio/03.jpg" alt="Logo" width="90" height="170" > 
    <img src="http://65.21.202.169:20119/folio/04.jpg" alt="Logo" width="90" height="170" > 
    <img src="http://65.21.202.169:20119/folio/05.jpg" alt="Logo" width="90" height="170" > 
    <img src="http://65.21.202.169:20119/folio/06.jpg" alt="Logo" width="90" height="170" > 
    <img src="http://65.21.202.169:20119/folio/07.jpg" alt="Logo" width="90" height="170" > 
    <img src="http://65.21.202.169:20119/folio/08.jpg" alt="Logo" width="90" height="170" > 
</p>

### Used Libraries
- **BLoC** - used for state management
- **Hive** - to storage local data
- **GetIt** - dependency app inject
- **Firebase** - user authorization
- **Freezed** - model generator
- **Http** - RESTApi

### Testing
For testing app use


| Login         | Password |
| :--------     | :------- | 
| test@test.com | !Aa12345 |
<br>

### Installation

```bash
git clone
https://github.com/motyliar/social_app.git
```

build app

```bash
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```
