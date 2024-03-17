import 'package:flutter/material.dart';

class BabysittingService extends StatefulWidget {
  @override
  BabysittingServiceState createState() => BabysittingServiceState();
}

class BabysittingServiceState extends State<BabysittingService> {
  // Step 1
  DateTime selectedDate = DateTime.now();

  // Step 2
  TimeOfDay selectedTime = TimeOfDay.now();

  // Step 3
  int numberOfChildren = 1; // Default value

  // Step 4
  String selectedKind = 'Standard'; // Default value

  // Step 5
  String selectedBabysitter = 'Select a Babysitter'; // Default value

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: _currentStep,
      onStepContinue: () {
        if (_currentStep < 4) {
          setState(() {
            _currentStep += 1;
          });
        } else {
          // Handle confirmation logic here
          print('Booking confirmed for ${selectedDate.day}/${selectedDate.month}/${selectedDate.year} '
              'at ${selectedTime.format(context)} for $numberOfChildren '
              'children with $selectedKind service and babysitter: $selectedBabysitter');
        }
      },
      onStepCancel: () {
        if (_currentStep > 0) {
          setState(() {
            _currentStep -= 1;
          });
        }
      },
      steps: [
        Step(
          title: Text('Select Date'),
          content: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => _selectDate(context), // Invoke _selectDate when tapped
                    child: Text(
                      'Selected Date: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  // Remove the ElevatedButton
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        Step(
          title: Text('Select Time'),
          content: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Select Time: ${selectedTime.format(context)}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        Step(
          title: Text('Number of Children'),
          content: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Number of Children:',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  DropdownButton<int>(
                    value: numberOfChildren,
                    onChanged: (int? value) {
                      setState(() {
                        numberOfChildren = value!;
                      });
                    },
                    items: List.generate(
                      5,
                          (index) => DropdownMenuItem<int>(
                        value: index + 1,
                        child: Text(
                          (index + 1).toString(),
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        Step(
          title: Text('Kind of Service'),
          content: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Kind of Service:',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  DropdownButton<String>(
                    value: selectedKind,
                    onChanged: (String? value) {
                      setState(() {
                        selectedKind = value!;
                      });
                    },
                    items: ['Standard', 'Premium', 'Custom'].map((String kind) {
                      return DropdownMenuItem<String>(
                        value: kind,
                        child: Text(
                          kind,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        Step(
          title: Text('Select Babysitter'),
          content: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Select Babysitter:',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  DropdownButton<String>(
                    value: selectedBabysitter,
                    onChanged: (String? value) {
                      setState(() {
                        selectedBabysitter = value!;
                      });
                    },
                    items: [
                      'Select a Babysitter',
                      'Babysitter 1',
                      'Babysitter 2',
                      'Babysitter 3',
                    ].map((String babysitter) {
                      return DropdownMenuItem<String>(
                        value: babysitter,
                        child: Text(
                          babysitter,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }

  int _currentStep = 0;
}
