import 'dart:ui';

import 'package:budget_app/json/profil_json.dart';
import 'package:budget_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _emial = TextEditingController(text: email);
  TextEditingController _dob = TextEditingController(text: dateOfBirth);
  TextEditingController _pass = TextEditingController(text: password);

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
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: size.width,
          decoration: BoxDecoration(color: white, boxShadow: [
            BoxShadow(
              color: grey.withOpacity(0.01),
              spreadRadius: 10.0,
              blurRadius: 3.0,
            ),
          ]),
          child: Padding(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Profile",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: black),
                    ),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.settings))
                  ],
                ),
                const SizedBox(
                  height: 2.0,
                ),
                Row(
                  children: [
                    Container(
                      width: (size.width - 60) * 0.6,
                      child: Container(
                        child: Stack(
                          children: [
                            RotatedBox(
                              quarterTurns: -2,
                              child: CircularPercentIndicator(
                                circularStrokeCap: CircularStrokeCap.round,
                                backgroundColor: grey.withOpacity(0.3),
                                radius: 110,
                                lineWidth: 6.0,
                                percent: 0.53,
                                progressColor: primary,
                              ),
                            ),
                            Positioned(
                              top: 16.0,
                              left: 13.0,
                              bottom: 13.0,
                              right: 13.0,
                              child: Container(
                                width: 80.0,
                                height: 80.0,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blueGrey),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: primary,
                      boxShadow: [
                        BoxShadow(
                          color: grey.withOpacity(0.01),
                          spreadRadius: 10.0,
                          blurRadius: 3.0,
                        ),
                      ]),
                  child: Padding(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: const [
                              Text(
                                "United Bank Asia",
                                style: TextStyle(
                                    color: white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                name,
                                style: TextStyle(
                                    color: white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0),
                              ),
                            ],
                          ),
                          Container(
                            child: const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                "Update",
                                style: TextStyle(color: white),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(color: white),
                            ),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 25.0, bottom: 25.0)),
                ),
              ],
            ),
            padding: const EdgeInsets.only(
                top: 20.0, right: 20.0, left: 20.0, bottom: 25.0),
          ),
        ),
        const SizedBox(
          height: 50.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Email",
                style: TextStyle(
                  fontSize: 13.0,
                  color: grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextField(
                controller: _emial,
                cursorColor: black,
                style: const TextStyle(
                    color: black, fontWeight: FontWeight.bold, fontSize: 17.0),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                "Date Of Birth",
                style: TextStyle(
                  fontSize: 13.0,
                  color: grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextField(
                controller: _dob,
                cursorColor: black,
                style: const TextStyle(
                    color: black, fontWeight: FontWeight.bold, fontSize: 20.0),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                "Password",
                style: TextStyle(
                  fontSize: 13.0,
                  color: grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextField(
                controller: _pass,
                cursorColor: black,
                style: const TextStyle(
                    color: black, fontWeight: FontWeight.bold, fontSize: 17.0),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
