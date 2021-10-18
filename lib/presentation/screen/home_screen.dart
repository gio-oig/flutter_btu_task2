import 'package:flutter/material.dart';
import 'package:giorgi_arakhamia_task2/logic/metric_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _fromMetric;
  String? _toMetric;
  double _enteredAmount = 0;
  double _result = 0;

  FocusNode _focusNode = FocusNode();
  TextEditingController _textEditingController = TextEditingController();

  final List<String> _metrics = [
    'CM',
    'M',
    'KM',
  ];

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Listener(
      onPointerDown: (_) => {_focusNode.unfocus()},
      child: Scaffold(
          appBar: AppBar(
            actions: [],
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: const Text(
              "Metrics Converter",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 27,
                  fontWeight: FontWeight.bold),
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 35),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Number:",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 40,
                          width: 120,
                          child: Center(
                            child: TextField(
                                focusNode: _focusNode,
                                controller: _textEditingController,
                                keyboardType: TextInputType.number,
                                cursorColor: Colors.white,
                                style: TextStyle(color: Colors.white),
                                onChanged: (e) {
                                  setState(() {
                                    var value = double.tryParse(e);
                                    if (value != null) {
                                      _enteredAmount = value;
                                    }
                                  });
                                },
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.blue,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(50)))),
                          ),
                        )
                      ],
                    ),
                    Stack(
                      children: [
                        Container(
                            height: deviceSize.height / 2.2,
                            decoration: BoxDecoration(
                                color: Colors.blue[200],
                                shape: BoxShape.circle)),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 75),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text(
                                    'From:',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(35),
                                    ),
                                    width: 100,
                                    height: 60,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        selectedItemBuilder: (_) => _metrics
                                            .map((e) => Center(child: Text(e)))
                                            .toList(),
                                        value: _fromMetric,
                                        iconEnabledColor: Colors.blue,
                                        borderRadius: BorderRadius.circular(35),
                                        style: const TextStyle(
                                            color: Colors.blue,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                        items: _metrics
                                            .map(
                                              (mertic) =>
                                                  DropdownMenuItem<String>(
                                                value: mertic,
                                                child: Text(
                                                  mertic,
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                        onChanged: (dynamic value) {
                                          setState(() {
                                            _fromMetric = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text(
                                    'To:',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(35),
                                    ),
                                    width: 100,
                                    height: 60,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        selectedItemBuilder: (_) => _metrics
                                            .map((e) => Center(child: Text(e)))
                                            .toList(),
                                        value: _toMetric,
                                        iconEnabledColor: Colors.blue,
                                        borderRadius: BorderRadius.circular(35),
                                        style: const TextStyle(
                                            color: Colors.blue,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                        items: _metrics
                                            .map(
                                              (mertic) =>
                                                  DropdownMenuItem<String>(
                                                value: mertic,
                                                child: Text(
                                                  mertic,
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                        onChanged: (dynamic value) {
                                          setState(() {
                                            _toMetric = value;
                                          });
                                        },
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Result:",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            width: 120,
                            decoration: const BoxDecoration(color: Colors.blue),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "${_result}",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: Container(
                        decoration: const BoxDecoration(color: Colors.blue),
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                          ),
                          onPressed: () {
                            if (_fromMetric == null ||
                                _toMetric == null ||
                                _enteredAmount == 0) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please select everything!'),
                                ),
                              );
                            } else {
                              setState(() {
                                _result = MetricHelper().convert(
                                    _fromMetric, _toMetric, _enteredAmount);
                              });
                            }
                          },
                          child: Text(
                            "CONVERSION",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: Container(
                        decoration: const BoxDecoration(color: Colors.blue),
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent,
                          ),
                          onPressed: () {
                            setState(() {
                              _focusNode.unfocus();
                              _textEditingController.clear();
                              _enteredAmount = 0;
                              _result = 0;
                              _fromMetric = null;
                              _toMetric = null;
                            });
                          },
                          child: Text(
                            "RESET",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
