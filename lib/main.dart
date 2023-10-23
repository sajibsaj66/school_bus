import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kumoh_school_bus/theme/themes.dart';
import 'view/views.dart';
import 'dart:html' as html;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: dotenv.load(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final jsCode = ''' {
              let googleMapScript = document.createElement('script');
              googleMapScript.src = `https://maps.googleapis.com/maps/api/js?key=${dotenv.env['GOOGLE_MAP_KEY']}&callback=console.log`;
              document.head.appendChild(googleMapScript);
            }
            ''';
            final script = html.ScriptElement()
              ..type = 'text/javascript'
              ..innerHtml = jsCode;
            html.querySelector('#dotenv')?.append(script);
            return MaterialApp(
              title: 'Flutter Demo',
              initialRoute: '/login',
              routes: {
                '/login': (context) => const LoginView(),
                '/signup/user': (context) => const MemberSignupView(),
                '/signup/driver': (context) => const DriverSignupView(),
                '/': (context) => const MainView(),
                '/reservation': (context) => const ReservationView(),
                '/reservation/check': (context) => const CheckReservationView(),
                '/user/info': (context) => const MemberInfoView(),
                '/driver': (context) => const DriverView(),
                '/driver/select' : (context) => const DriverSelectView(),
              },
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('ko', 'KR'),
              ],
              locale: const Locale('ko'),
            );
          }
          return const Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: ColorTheme.itemSubColor,
              ),
            ),
          );
        });
  }
}
