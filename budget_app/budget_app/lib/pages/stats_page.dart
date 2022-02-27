import 'package:budget_app/theme/colors.dart';
import 'package:budget_app/widgets/charts.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../json/day_month.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  @override
  int activeMonth = 4;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.05),
      body: getBody(),
    );
  }

  Widget getBody() {
    List expenses = [
      {
        "icon": Icons.arrow_back,
        "color": blue,
        "label": "Income",
        "cost": "\$345.3",
      },
      {
        "icon": Icons.arrow_forward,
        "color": red,
        "label": "Expenses",
        "cost": "\$805.3",
      },
    ];

    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: white,
              boxShadow: [
                BoxShadow(
                    color: grey.withOpacity(0.01),
                    spreadRadius: 10.0,
                    blurRadius: 3.0),
              ],
            ),
            child: Padding(
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "STATS",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: black),
                      ),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.search))
                    ],
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      months.length,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            activeMonth = index;
                          });
                        },
                        child: Container(
                          width: (size.width - 40) / 7,
                          child: Column(
                            children: [
                              Text(
                                months[index]['label'],
                                style: const TextStyle(fontSize: 10.0),
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 7.0,
                                      bottom: 7.0,
                                      right: 12.0,
                                      left: 12.0),
                                  child: Text(
                                    months[index]['day'],
                                    style: TextStyle(
                                        color: activeMonth == index
                                            ? white
                                            : black,
                                        fontSize: 10.0),
                                  ),
                                ),
                                //height: 30.0,
                                //width: 30.0,

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.0),
                                  border: Border.all(
                                      color: activeMonth == index
                                          ? primary
                                          : black.withOpacity(0.1)),
                                  color: activeMonth == index
                                      ? primary
                                      : Colors.transparent,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
                padding: const EdgeInsets.only(
                    top: 60.0, left: 20.0, right: 20.0, bottom: 25.0)),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Net Balance",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15.0,
                                color: black.withOpacity(0.7)),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "\$2446.99",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0,
                                color: black.withOpacity(0.7)),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      child: Container(
                        width: size.width - 20,
                        height: 150.0,
                        child: LineChart(mainData()),
                      ),
                    ),
                  ],
                ),
              ),
              width: double.infinity,
              height: 250.0,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                      color: grey.withOpacity(0.01),
                      spreadRadius: 10.0,
                      blurRadius: 3.0),
                ],
              ),
            ),
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          ),
          const SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: () {
              print("Ok");
            },
            child: Wrap(
              spacing: 20.0,
              children: List.generate(
                expenses.length,
                (index) => Container(
                  width: (size.width - 60) / 2,
                  height: 170,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: grey.withOpacity(0.01),
                        spreadRadius: 10.0,
                        blurRadius: 3.0),
                  ], borderRadius: BorderRadius.circular(12.0), color: white),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 25.0, top: 20.0, bottom: 20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Center(
                                child: Icon(
                              expenses[index]['icon'],
                              color: white,
                            )),
                            height: 30.0,
                            width: 30.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: expenses[index]['color'],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                expenses[index]['label'],
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0,
                                    color: black.withOpacity(0.7)),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                expenses[index]['cost'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0,
                                    color: black.withOpacity(0.7)),
                              ),
                            ],
                          ),
                        ]),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
