import 'package:crm_project/Screens/drawer_page.dart';
import 'package:crm_project/Screens/nofound_page.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class FollowupfilterScreen extends StatefulWidget {
  @override
  _FollowupfilterScreenState createState() => _FollowupfilterScreenState();
}

class _FollowupfilterScreenState extends State<FollowupfilterScreen> {
  DateTime today = DateTime.now();
  DateTime? selectedDay;
  DateTime focusedDay = DateTime.now();
  String? assignedTo;

  List<DropdownMenuItem<String>> get items {
    return [
      DropdownMenuItem(value: 'John Doe', child: Text('John Doe')),
      DropdownMenuItem(value: 'Jane Smith', child: Text('Jane Smith')),
      DropdownMenuItem(value: 'Alice Johnson', child: Text('Alice Johnson')),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      this.selectedDay = selectedDay;
      this.focusedDay = focusedDay;
    });
  }

  void _onAssignedToChanged(String? newValue) {
    setState(() {
      assignedTo = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        title: Text('Followup Filter', style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SectionTitle(title: 'Status'),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
              padding: EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 25.0,
                runSpacing: 8.0,
                children: [
                  CustomFilterChip(label: 'New'),
                  CustomFilterChip(label: 'Open'),
                  CustomFilterChip(label: 'Unavailable'),
                  CustomFilterChip(label: 'Closed'),
                  CustomFilterChip(label: 'Walkin'),
                  CustomFilterChip(label: 'Rejected'),
                  CustomFilterChip(label: 'Paused'),
                ],
              ),
            ),
            SizedBox(height: 16),
            SectionTitle(title: 'Priority'),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
              padding: EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 30.0,
                runSpacing: 8.0,
                children: [
                  CustomFilterChip(label: 'Hot'),
                  CustomFilterChip(label: 'Warm'),
                  CustomFilterChip(label: 'Cold'),
                ],
              ),
            ),
            SizedBox(height: 16),
            SectionTitle(title: 'Filter'),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 30.0,
                      runSpacing: 8.0,
                      children: [
                        CustomFilterChip(label: 'Today'),
                        CustomFilterChip(label: 'Yesterday'),
                        Padding(
                          padding: const EdgeInsets.only(top: 30, right: 100),
                          child: Text(
                            'Assinged to',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(119, 119, 119, 1)),
                          ),
                        ),
                      ],
                    ),
                    TableCalendar(
                      calendarStyle: CalendarStyle(
                        outsideDaysVisible: false,
                        defaultTextStyle:
                            TextStyle(color: Color.fromRGBO(59, 51, 103, 1)),
                        weekendTextStyle:
                            TextStyle(color: Color.fromRGBO(59, 51, 103, 1)),
                        selectedTextStyle:
                            TextStyle(color: Color.fromRGBO(59, 51, 103, 1)),
                        todayTextStyle: TextStyle(color: Colors.white),
                        todayDecoration: BoxDecoration(
                          color: Color.fromRGBO(59, 51, 103, 1),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        selectedDecoration: BoxDecoration(
                          color: Color.fromRGBO(59, 51, 103, 1),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        markerDecoration: BoxDecoration(
                          color: Color.fromRGBO(59, 51, 103, 1),
                          shape: BoxShape.circle,
                        ),
                      ),
                      headerStyle: HeaderStyle(
                        titleTextStyle:
                            TextStyle(color: Colors.white, fontSize: 20),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                        ),
                        formatButtonTextStyle: TextStyle(color: Colors.white),
                        formatButtonDecoration: BoxDecoration(
                          color: Color.fromRGBO(59, 51, 103, 1),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        leftChevronIcon: Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                        ),
                        rightChevronIcon: Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                        ),
                        headerPadding: EdgeInsets.symmetric(vertical: 0.0),
                        formatButtonVisible: false,
                        titleCentered: true,
                      ),
                      availableGestures: AvailableGestures.all,
                      onDaySelected: _onDaySelected,
                      focusedDay: focusedDay,
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 12, 31),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Date Range",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'From',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Container(
                            height: 44,
                            child: TextFormField(
                              decoration: InputDecoration(
                                fillColor: Color.fromRGBO(243, 243, 243, 1),
                                filled: true,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                NofoundPage()));
                                  },
                                  icon: Icon(Icons.date_range,
                                      color: Color.fromRGBO(59, 51, 103, 1)),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'To',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        SizedBox(width: 40),
                        Expanded(
                          child: Container(
                            height: 44,
                            child: TextFormField(
                              decoration: InputDecoration(
                                fillColor: Color.fromRGBO(243, 243, 243, 1),
                                filled: true,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DrawerPage()));
                                  },
                                  icon: Icon(Icons.date_range,
                                      color: Color.fromRGBO(59, 51, 103, 1)),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Assigned to",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
              height: 70,
              child: Center(
                child: DropdownButtonFormField<String>(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  value: assignedTo,
                  items: items,
                  onChanged: _onAssignedToChanged,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    hintText: 'Select Staff',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(68, 68, 68, 1),
                    ),
                    fillColor: Color.fromRGBO(218, 218, 218, 1),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class CustomFilterChip extends StatelessWidget {
  final String label;

  CustomFilterChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      side: BorderSide(color: Color.fromRGBO(82, 70, 158, 1)),
      label: Text(
        label,
        style: TextStyle(color: Color.fromRGBO(82, 70, 158, 1)),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
