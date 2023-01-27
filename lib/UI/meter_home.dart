import 'package:flutter/material.dart';
import 'Operator/operator.dart';

//import 'converter_design.dart';
import 'field_name.dart';

class MeterApp extends StatefulWidget {
  const MeterApp({super.key});

  @override
  State<MeterApp> createState() => _MeterAppState();
}

//List of the operator options
List<String> operatorName = [
  'Meter to Inches',
  'Inches to Meter',
  'Feet to Meter',
  'Meters to Feet',
];
//Operator instance
Operator newOperator = Operator();

//Main class
class _MeterAppState extends State<MeterApp> {
  final TextEditingController _inputController = TextEditingController();
  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  // String name = "hello";
  List<Name> fieldName = Name.getName();

  // late int index;
  double output = 0;
  String nameHint1 = 'Meter';
  String nameHint2 = 'Inches';

  double input = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade900,
        title: const Text('Length Converter'),
      ),
      drawer: Drawer(
        backgroundColor: Colors.blueGrey.withOpacity(0.8),
        width: MediaQuery.of(context).size.width * 0.6,
        child: ListView.builder(
            itemCount: operatorName.length,
            itemBuilder: (BuildContext context, int index) {
              return operatorState(operatorName.elementAt(index), index);
            }),
      ),
      //Body of converter
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade900,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nameHint1,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      textBox(),
                      Text(
                        nameHint2,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Center(
                                  child: Text(
                                    output.toStringAsFixed(3),
                                    style: const TextStyle(fontSize: 40),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              converterBtn(context),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              // Clear button 2
              clearBtn(context),
            ],
          ),
        ],
      ),
    );
  }

  Container clearBtn(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.width * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blueGrey.shade900,
      ),
      child: MaterialButton(
        onPressed: () => clear(),
        child: Text(
          'Clear',
          style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.width * 0.07,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void clear() {
    return setState(() {
      output = 0.0;
      _inputController.text = "";
    });
  }

  Container converterBtn(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.width * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blueGrey.shade900,
      ),
      //Converter button1
      child: MaterialButton(
        onPressed: () => {
          if (nameHint1 == fieldName[0].fieldname_1)
            {
              newOperator.setMeter(input),
              setState(() {
                output = newOperator.meterToInches();
              }),
            }
          else if (nameHint1 == fieldName[1].fieldname_1)
            {
              newOperator.setInches(input),
              setState(() {
                output = newOperator.inchesToMeter();
              }),
            }
          else if (nameHint1 == fieldName[2].fieldname_1)
            {
              newOperator.setFeets(input),
              setState(() {
                output = newOperator.feetsToMeter();
              }),
            }
          else if (nameHint1 == fieldName[3].fieldname_1)
            {
              newOperator.setMeter(input),
              setState(() {
                output = newOperator.metersToFeet();
              }),
            }
        },
        child: Text(
          'Convert',
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.07,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget textBox() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: TextField(
            controller: _inputController,
            style: const TextStyle(fontSize: 40),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            cursorColor: Colors.black,
            cursorHeight: 40,
            onChanged: (String value) {
              try {
                input = double.parse(value);
              } catch (exception) {
                input = 0.0;
              }
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Enter $nameHint1 value",
              fillColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget operatorState(String name, int numIndex, Color btnCol) {
    bool _isClick = false;
    var btnColor = Colors.white;
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.07),
      child: TextButton(
        onPressed: () => {
          condition(numIndex),
          clear(),
          setState(() {
            _isClick = true;
            btnColor = _isClick ? Colors.blue : Colors.white;
          })
        },
        child: Text(
          name,
          style: TextStyle(
            color: btnColor,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Set<dynamic> condition(int index2) {
    switch (index2) {
      case 0:
        setState(() {
          nameHint1 = fieldName[index2].fieldname_1;
          nameHint2 = fieldName[index2].fieldname_2;
        });
        break;
      case 1:
        setState(() {
          nameHint1 = fieldName[index2].fieldname_1;
          nameHint2 = fieldName[index2].fieldname_2;
        });
        break;
      case 2:
        setState(() {
          nameHint1 = fieldName[index2].fieldname_1;
          nameHint2 = fieldName[index2].fieldname_2;
        });
        break;
      case 3:
        setState(() {
          nameHint1 = fieldName[index2].fieldname_1;
          nameHint2 = fieldName[index2].fieldname_2;
        });
        break;
    }
    return {nameHint1, nameHint2};
  } //OperatorState ends
} //Overrider widget class end
