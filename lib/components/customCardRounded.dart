import 'package:jamur/fitness_app_theme.dart';
import 'package:jamur/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MediterranesnDietView extends StatefulWidget {
  final double humidity; // Add a humidity parameter
  final double temperature; // Add a temperature parameter

  const MediterranesnDietView({
    Key? key,
    required this.humidity, // Make humidity required
    required this.temperature, // Make temperature required
  }) : super(key: key);

  @override
  State<MediterranesnDietView> createState() => _MediterranesnDietViewState();
}

class _MediterranesnDietViewState extends State<MediterranesnDietView> {
  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.translationValues(0.0, 30 * 1.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5, top: 16, bottom: 18),
        child: Container(
          decoration: BoxDecoration(
            color: FitnessAppTheme.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
              topRight: Radius.circular(68.0),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: FitnessAppTheme.grey.withOpacity(0.2),
                offset: Offset(1.1, 1.1),
                blurRadius: 10.0,
              ),
            ],
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  height: 48,
                                  width: 2,
                                  decoration: BoxDecoration(
                                    color: HexColor('#87A0E5').withOpacity(0.5),
                                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4, bottom: 2),
                                        child: Text(
                                          'Kelembapan',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: FitnessAppTheme.fontName,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            letterSpacing: -0.1,
                                            color: FitnessAppTheme.grey.withOpacity(0.5),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: <Widget>[
                                          SizedBox(
                                            width: 28,
                                            height: 28,
                                            child: Icon(Icons.water_drop),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 4, bottom: 3),
                                            child: Text(
                                              '${widget.humidity}', // Use the humidity parameter
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: FitnessAppTheme.fontName,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                color: FitnessAppTheme.darkerText,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 4, bottom: 3),
                                            child: Text(
                                              '%',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: FitnessAppTheme.fontName,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                                letterSpacing: -0.2,
                                                color: FitnessAppTheme.grey.withOpacity(0.5),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: <Widget>[
                                Container(
                                  height: 48,
                                  width: 2,
                                  decoration: BoxDecoration(
                                    color: HexColor('#F56E98').withOpacity(0.5),
                                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4, bottom: 2),
                                        child: Text(
                                          'Suhu',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: FitnessAppTheme.fontName,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            letterSpacing: -0.1,
                                            color: FitnessAppTheme.grey.withOpacity(0.5),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: <Widget>[
                                          SizedBox(
                                            width: 28,
                                            height: 28,
                                            child: Icon(Icons.thermostat),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 4, bottom: 3),
                                            child: Text(
                                              '${widget.temperature}', // Use the temperature parameter
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: FitnessAppTheme.fontName,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                color: FitnessAppTheme.darkerText,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8, bottom: 3),
                                            child: Text(
                                              '°',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: FitnessAppTheme.fontName,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                                letterSpacing: -0.2,
                                                color: FitnessAppTheme.grey.withOpacity(0.5),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Center(
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: FitnessAppTheme.white,
                                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                                  border: Border.all(
                                    width: 4,
                                    color: FitnessAppTheme.nearlyDarkBlue.withOpacity(0.2),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      '${DateFormat('dd').format(DateTime.now())}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: FitnessAppTheme.fontName,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 24,
                                        letterSpacing: 0.0,
                                        color: FitnessAppTheme.nearlyDarkBlue,
                                      ),
                                    ),
                                    Text(
                                      '${DateFormat('MMMM').format(DateTime.now())}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: FitnessAppTheme.fontName,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        letterSpacing: 0.0,
                                        color: FitnessAppTheme.grey.withOpacity(0.5),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 8),
                child: Container(
                  height: 2,
                  decoration: BoxDecoration(
                    color: FitnessAppTheme.background,
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
