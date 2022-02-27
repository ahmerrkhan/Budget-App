import 'package:budget_app/json/daily_json.dart';
import 'package:budget_app/json/day_month.dart';
import 'package:budget_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'root_app.dart';

class DailyPage extends StatefulWidget {
  const DailyPage({Key? key}) : super(key: key);

  @override
  _DailyPageState createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  int activePage = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.25),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(children: [
        Container(
          decoration: BoxDecoration(
            color: white,
            boxShadow: [
              BoxShadow(
                color: grey.withOpacity(0.01),
                spreadRadius: 10.0,
                blurRadius: 3.0,
              )
            ],
          ),
          child: Padding(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Daily Transactions",
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
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
                      days.length,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            activePage = index;
                          });
                        },
                        child: Container(
                          width: (size.width - 40) / 7,
                          child: Column(
                            children: [
                              Text(
                                days[index]['label'],
                                style: const TextStyle(fontSize: 10.0),
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              Container(
                                child: Center(
                                  child: Text(
                                    days[index]['day'],
                                    style: TextStyle(
                                        color:
                                            activePage == index ? white : black,
                                        fontSize: 10.0),
                                  ),
                                ),
                                height: 30.0,
                                width: 30.0,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: activePage == index
                                            ? primary
                                            : black.withOpacity(0.1)),
                                    color: activePage == index
                                        ? primary
                                        : Colors.transparent,
                                    shape: BoxShape.circle),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              padding: const EdgeInsets.only(
                  bottom: 60.0, top: 25.0, right: 20.0, left: 20.0)),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 10.0),
          child: Column(
            children: List.generate(daily.length, (index) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: (size.width - 40) * 0.7,
                        child: Row(
                          children: [
                            Container(
                              decoration:
                                  BoxDecoration(color: grey.withOpacity(0.1)),
                              height: 50.0,
                              width: 50.0,
                              child: Center(
                                  child: Image.asset(
                                daily[index]['icon'],
                                width: 30.0,
                                height: 30.0,
                              )),
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            Container(
                              width: (size.width - 90) * 0.5,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      daily[index]['name'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: black,
                                          fontSize: 15.0),
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      daily[index]['date'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: black,
                                          fontSize: 15.0),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: (size.width - 40) * 0.3,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                daily[index]['price'],
                                style: const TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w900,
                                    color: green),
                              ),
                            ]),
                      ),
                    ],
                  ),
                  const Padding(
                      child: Divider(thickness: 1.5),
                      padding: EdgeInsets.only(
                        left: 65.0,
                        top: 8.0,
                      ))
                ],
              );
            }),
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: Row(children: [
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 80),
              child: Text(
                "Total",
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: black.withOpacity(0.4)),
              ),
            ),
            Spacer(),
            const Text(
              "\$1780",
              style: TextStyle(
                  fontSize: 20.0, fontWeight: FontWeight.w600, color: black),
            )
          ]),
        )
      ]),
    );
  }
}
