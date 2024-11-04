import 'package:flutter/material.dart';
import 'package:jamur/fitness_app_theme.dart'; // Sesuaikan dengan import tema atau file lain yang dibutuhkan.

class CustomAppBarNoAnimation2 extends StatelessWidget {
  final double topBarOpacity;

  const CustomAppBarNoAnimation2({
    Key? key,
    required this.topBarOpacity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: FitnessAppTheme.white.withOpacity(topBarOpacity),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(32.0),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: FitnessAppTheme.grey.withOpacity(0.4 * topBarOpacity),
                offset: const Offset(1.1, 1.1),
                blurRadius: 10.0,
              ),
            ],
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16 - 8.0 * topBarOpacity,
                  bottom: 12 - 8.0 * topBarOpacity,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'My Diary',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: FitnessAppTheme.fontName,
                            fontWeight: FontWeight.w700,
                            fontSize: 22,
                            letterSpacing: 1.2,
                            color: FitnessAppTheme.darkerText,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 38,
                      width: 38,
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(32.0),
                        ),
                        onTap: () {},
                        child: Center(
                          child: Icon(
                            Icons.keyboard_arrow_left,
                            color: FitnessAppTheme.grey,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Icon(
                              Icons.calendar_today,
                              color: FitnessAppTheme.grey,
                              size: 18,
                            ),
                          ),
                          Text(
                            '15 May',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: FitnessAppTheme.fontName,
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              letterSpacing: -0.2,
                              color: FitnessAppTheme.darkerText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 38,
                      width: 38,
                      child: InkWell(
                        highlightColor: Colors.transparent,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(32.0),
                        ),
                        onTap: () {},
                        child: Center(
                          child: Icon(
                            Icons.keyboard_arrow_right,
                            color: FitnessAppTheme.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
