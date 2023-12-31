import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'container_box.dart';
import 'data_container.dart';


const activeColor = Color(0xffd9b711);
const inActiveColor = Color(0xFF212121);

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  Color maleBoxColor = activeColor;
  Color femaleBoxColor = inActiveColor;
  int height = 180;
  int weight = 50;
  int age = 25;
  String result = "";
  String resultDetail = "Result here";
  double bmi = 0;

  void updateBoxColor(int gender) {
    if (gender == 1) {
      if (maleBoxColor == inActiveColor) {
        maleBoxColor = activeColor;
        femaleBoxColor = inActiveColor;
      } else {
        maleBoxColor = inActiveColor;
        femaleBoxColor = activeColor;
      }
    } else {
      if (femaleBoxColor == inActiveColor) {
        femaleBoxColor = activeColor;
        maleBoxColor = inActiveColor;
      } else {
        femaleBoxColor = inActiveColor;
        maleBoxColor = activeColor;
      }
    }
  }

  String calculateBmi(int weight, int height) {
    double bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

   String getInterpretation(double bmi) {
    if (bmi >= 25.0) {
      return 'You have higher than normal body weight. Try to exercise more.';
    } 
    else if (bmi > 18.5) {
      return 'You have a normal body weight. Good Job!';
    } 
    else {
      return 'You have lower than normal body weight. You can eat a bit more.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI CalC"),centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          // male/female section
          // Expanded(
          //     child: Row(
          //   children: <Widget>[
          //     Expanded(
          //       child: GestureDetector(
          //         onTap: () {
          //           setState(() {
          //             updateBoxColor(1);
          //           });
          //         },
          //         child: ContainerBox(
          //           boxColor: maleBoxColor,
          //           childWidget: DataContainer(
          //               icon: FontAwesomeIcons.male, title: 'MALE'),
          //         ),
          //       ),
          //     ),
          //     Expanded(
          //       child: GestureDetector(
          //         onTap: () {
          //           setState(() {
          //             updateBoxColor(2);
          //           });
          //         },
          //         child: ContainerBox(
          //           boxColor: femaleBoxColor,
          //           childWidget: DataContainer(
          //               icon: FontAwesomeIcons.female, title: 'FEMALE'),
          //         ),
          //       ),
          //     ),
          //   ],
          // )),
          // height section
          Expanded(
            child: ContainerBox(
              boxColor: inActiveColor,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'HEIGHT',
                    style: textStyle1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: textStyle2,
                      ),
                      const Text(
                        'cm',
                        style: textStyle1,
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 10,
                    max: 300,
                    activeColor: activeColor,
                    inactiveColor: inActiveColor,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          // weight section
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ContainerBox(
                  boxColor: inActiveColor,
                  childWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'WEIGHT',
                        style: textStyle1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            weight.toString(),
                            style: textStyle2,
                          ),
                          const Text(
                            'kg',
                            style: textStyle1,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            backgroundColor: activeColor,
                            child: const Icon(FontAwesomeIcons.plus,
                                color: Colors.white),
                          ),
                          const SizedBox(width: 10.0,),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (weight > 0) {
                                  weight--;
                                }
                              });
                            },
                            backgroundColor: activeColor,
                            child: const Icon(FontAwesomeIcons.minus,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // age section
              // Expanded(
              //   child: ContainerBox(
              //     boxColor: inActiveColor,
              //     childWidget: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: <Widget>[
              //         Text(
              //           'AGE',
              //           style: textStyle1,
              //         ),
              //         Text(
              //           age.toString(),
              //           style: textStyle2,
              //         ),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: <Widget>[
              //             FloatingActionButton(
              //               onPressed: () {
              //                 setState(() {
              //                   if (age < 100) {
              //                     age++;
              //                   }
              //                 });
              //               },
              //               backgroundColor: activeColor,
              //               child: Icon(FontAwesomeIcons.plus,
              //                   color: Colors.white),
              //             ),
              //             SizedBox(
              //               width: 10.0,
              //             ),
              //             FloatingActionButton(
              //               onPressed: () {
              //                 setState(() {
              //                   if (age > 0) {
              //                     age--;
              //                   }
              //                 });
              //               },
              //               backgroundColor: activeColor,
              //               child: Icon(FontAwesomeIcons.minus,
              //                   color: Colors.white),
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ],
          )),

          GestureDetector(
              onTap: () {
                setState(() {
                  result = calculateBmi(weight, height);
                  resultDetail = getInterpretation(bmi);
                  showDialog(
                      context: context,
                      builder: (BuildContext contest) {
                        return Dialog(
                            backgroundColor: inActiveColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Container(
                              color: inActiveColor,
                              height: 200.0,
                              margin: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const Text(
                                    'Your BMI',
                                    style: textStyle1,
                                  ),
                                  Text(
                                    result.toString(),
                                    style: textStyle2,
                                  ),
                                  /*Text(
                                    resultDetail,
                                    style: textStyle1,
                                  ),*/
                                ],
                              ),
                            ));
                      });
                });
              },
              child: Container(
                width: double.infinity,
                height: 80.0,
                color: activeColor,
                margin: const EdgeInsets.only(top: 10.0),
                child: const Center(
                  child: Text( 'Calculate', style: textStyle3)),
              ))
        ],
      ),
    );
  }
}
