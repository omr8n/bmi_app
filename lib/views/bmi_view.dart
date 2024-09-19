import 'dart:math';

import 'package:bmi_app/views/result_view.dart';
import 'package:bmi_app/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BmiView extends StatefulWidget {
  const BmiView({super.key});

  @override
  State<BmiView> createState() => _BmiViewState();
}

class _BmiViewState extends State<BmiView> {
  bool isMale = true;
  double heightValue = 172;
  double result = 0;
  int weight = 86;
  int age = 22;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    customExpanded(context, "Male"),
                    const SizedBox(
                      width: 10,
                    ),
                    customExpanded(context, "Female"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 91, 135, 211),

                      // color:
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Height",
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              "${heightValue.toStringAsFixed(2)} ",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const Text("cm"),
                          ],
                        ),
                        Slider(
                          value: heightValue,
                          min: 90,
                          max: 220,
                          onChanged: (value) {
                            setState(() {
                              heightValue = value;
                            });
                          },
                        )
                      ],
                    ),
                  )),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    customExpanded2(context, "Weight"),
                    const SizedBox(
                      width: 10,
                    ),
                    customExpanded2(context, "Age"),
                  ],
                ),
              ),
            ),
            CustomButton(
              title: "Calculate",
              backgourndColor: const Color.fromARGB(255, 91, 135, 211),
              onPressed: () {
                result = weight / pow(heightValue / 100, 2);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ResultView(age: age, isMale: isMale, result: result),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }

  Expanded customExpanded(BuildContext context, String title) {
    return Expanded(
      child: GestureDetector(
        // onTap: onTap,
        onTap: () {
          setState(() {
            isMale = title == "Male" ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: (isMale && title == "Male") ||
                    (isMale == false && title == "Female")
                ? const Color.fromARGB(255, 133, 96, 139)
                : const Color.fromARGB(255, 91, 135, 211),

            // color:
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                title == "Male" ? Icons.male : Icons.female,
                size: 80,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title == "Male" ? "Male" : "Female",
                style: Theme.of(context).textTheme.bodyLarge,
                // textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded customExpanded2(BuildContext context, String title) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 91, 135, 211),

          // color:
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title == "Age" ? "Age" : "Weight",
              style: Theme.of(context).textTheme.displayMedium,
              // textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title == "Age" ? "$age" : "$weight",
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: title == "Age" ? 'age++' : "weight++",
                  mini: false,
                  onPressed: () {
                    setState(() {
                      title == "Age" ? age++ : weight++;
                    });
                  },
                  child: const Icon(
                    Icons.add,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                FloatingActionButton(
                  heroTag: title == "Age" ? 'age--' : "weight--",
                  mini: false,
                  onPressed: () {
                    setState(() {
                      title == "Age" ? age-- : weight--;
                    });
                  },
                  child: const Icon(
                    Icons.remove,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
