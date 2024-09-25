import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle buttonTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: const Color.fromARGB(255, 11, 11, 11),
    );

    final TextStyle screenTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.black,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingSlider(
        headerBackgroundColor: Colors.white,
        finishButtonText: 'Registrar',
        finishButtonStyle: FinishButtonStyle(
          backgroundColor: Colors.black,
        ),
        skipTextButton: Text(
          'Saltar',
          style: buttonTextStyle,
        ),
        trailing: Text(
          'Inicio',
          style: buttonTextStyle,
        ),
        totalPage: 3,
        speed: 1.8,
        centerBackground: true,
        background: [
          SvgPicture.asset(
            'assets/images/presentacion.svg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SvgPicture.asset(
            'assets/images/recuerdo.svg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SvgPicture.asset(
            'assets/images/playlists.svg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ],
        pageBodies: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: SvgPicture.asset(
                  'assets/images/presentacion.svg',
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 60),
                alignment: Alignment.center,
                child: Text(
                  'Bienvenido',
                  style: screenTextStyle,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: SvgPicture.asset(
                  'assets/images/recuerdo.svg',
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 60),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Reconstruyendo recuerdos con musica',
                      style: screenTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: SvgPicture.asset(
                  'assets/images/playlists.svg',
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 60),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '',
                      style: screenTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
