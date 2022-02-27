import 'package:budget_app/json/create_budget_json.dart';
import 'package:budget_app/theme/colors.dart';
import 'package:flutter/material.dart';

class CreateBudget extends StatefulWidget {
  const CreateBudget({Key? key}) : super(key: key);

  @override
  _CreateBudgetState createState() => _CreateBudgetState();
}

class _CreateBudgetState extends State<CreateBudget> {
  TextEditingController _budgetName = TextEditingController(text: "Shopping");
  TextEditingController _budgetCost = TextEditingController(text: "Cost");

  int activeCategory = 0;
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: white,
              boxShadow: [
                BoxShadow(
                  color: grey.withOpacity(0.01),
                  blurRadius: 3.0,
                  spreadRadius: 10.0,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 60.0, bottom: 25.0, left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Create Budget",
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search))
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Text(
              "Choose Category",
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: black.withOpacity(0.5)),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(
              categories.length,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    activeCategory = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 10.0),
                  child: Container(
                    margin: EdgeInsets.only(left: 10.0),
                    width: 170.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: activeCategory == index
                              ? primary
                              : Colors.transparent,
                          width: activeCategory == index ? 2.0 : 0.0),
                      borderRadius: BorderRadius.circular(12.0),
                      color: white,
                      boxShadow: [
                        BoxShadow(
                          color: grey.withOpacity(0.01),
                          blurRadius: 3.0,
                          spreadRadius: 10.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, bottom: 20.0, right: 25.0, left: 25.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Center(
                                child: Image.asset(
                              categories[index]['icon'],
                              width: 30.0,
                              fit: BoxFit.cover,
                            )),
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(shape: BoxShape.circle,
                                //color: white,
                                boxShadow: [
                                  BoxShadow(color: grey.withOpacity(0.15)),
                                ]),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            categories[index]['name'],
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: black.withOpacity(0.5)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )),
          ),
          const SizedBox(
            height: 50.0,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Budget Name",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: black.withOpacity(0.5)),
              ),
              TextField(
                controller: _budgetName,
                style: const TextStyle(
                    fontSize: 17.0, fontWeight: FontWeight.bold),
                cursorColor: black,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: "Enter Budget name"),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    //decoration: BoxDecoration(color: primary),
                    width: size.width - 140,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Enter Budget",
                            style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w500,
                                color: black.withOpacity(0.6)),
                          ),
                          TextField(
                            controller: _budgetCost,
                            style: const TextStyle(
                                fontSize: 17.0, fontWeight: FontWeight.bold),
                            cursorColor: black,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enter Budget cost"),
                          ),
                        ]),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: white,
                    ),
                  ),
                ],
              ),
            ]),
          )
        ],
      ),
    );
  }
}
