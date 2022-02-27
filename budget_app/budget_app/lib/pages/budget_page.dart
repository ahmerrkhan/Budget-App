import 'package:budget_app/json/budget_json.dart';
import 'package:budget_app/theme/colors.dart';
import 'package:flutter/material.dart';

import '../json/day_month.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({Key? key}) : super(key: key);

  @override
  _BudgetPageState createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  int activeMonth = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.05),
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
                  blurRadius: 3.0),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 20.0, left: 20.0, bottom: 10.0, right: 10.0),
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
                  Row(
                    children: [
                      IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                      const SizedBox(
                        width: 10.0,
                      ),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.search))
                    ],
                  ),
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
                                    color: activeMonth == index ? white : black,
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
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Column(
          children: List.generate(budget_json.length, (index) {
            return Padding(
              padding:
                  const EdgeInsets.only(left: 30.0, right: 25.0, bottom: 20.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: white,
                    boxShadow: [
                      BoxShadow(
                        color: grey.withOpacity(0.01),
                        spreadRadius: 10.0,
                        blurRadius: 3.0,
                      ),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        budget_json[index]['name'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13.0,
                            color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                budget_json[index]["price"],
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: black),
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 3.0),
                                child: Text(
                                  budget_json[index]["label_percentage"],
                                  style: const TextStyle(
                                      fontSize: 15.0,
                                      // fontWeight: FontWeight.bold,
                                      color: black),
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 3.0),
                            child: Text(
                              "\$5000.00",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  // fontWeight: FontWeight.bold,
                                  color: black),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Stack(
                        children: [
                          Container(
                            width: size.width - 40,
                            height: 7.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: grey.withOpacity(0.2)),
                          ),
                          Container(
                            width: (size.width - 40) * 0.5,
                            height: 7.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: blue),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        )
      ]),
    );
  }
}
