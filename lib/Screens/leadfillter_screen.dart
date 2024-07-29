import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class LeadFilterScreen extends StatefulWidget {
  @override
  _LeadFilterScreenState createState() => _LeadFilterScreenState();
}

class _LeadFilterScreenState extends State<LeadFilterScreen> {
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

  void _selectDate(TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      controller.text = pickedDate.toLocal().toString().split(' ')[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController fromDateController = TextEditingController();
    TextEditingController toDateController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Lead Filter', style: TextStyle(color: Colors.black)),
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
                  FilterChip(label: 'New'),
                  FilterChip(label: 'Open'),
                  FilterChip(label: 'Unavailable'),
                  FilterChip(label: 'Closed'),
                  FilterChip(label: 'Walkin'),
                  FilterChip(label: 'Rejected'),
                  FilterChip(label: 'Paused'),
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
                  FilterChip(label: 'Hot'),
                  FilterChip(label: 'Warm'),
                  FilterChip(label: 'Cold'),
                ],
              ),
            ),
            SizedBox(height: 16),
            SectionTitle(title: 'Filter'),
            Container(
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
                      FilterChip(label: 'Today'),
                      FilterChip(label: 'Yesterday'),
                      Padding(
                        padding: const EdgeInsets.only(top: 30, right: 100),
                        child: Text(
                          'Assigned to',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(119, 119, 119, 1),
                          ),
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
                            controller: fromDateController,
                            decoration: InputDecoration(
                              fillColor: Color.fromRGBO(243, 243, 243, 1),
                              filled: true,
                              suffixIcon: IconButton(
                                onPressed: () =>
                                    _selectDate(fromDateController),
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
                            controller: toDateController,
                            decoration: InputDecoration(
                              fillColor: Color.fromRGBO(243, 243, 243, 1),
                              filled: true,
                              suffixIcon: IconButton(
                                onPressed: () => _selectDate(toDateController),
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

class FilterChip extends StatefulWidget {
  final String label;

  FilterChip({required this.label});

  @override
  _FilterChipState createState() => _FilterChipState();
}

class _FilterChipState extends State<FilterChip> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(widget.label),
      selected: _isSelected,
      selectedColor: Color.fromRGBO(82, 70, 158, 1),
      backgroundColor: Colors.grey[200],
      onSelected: (selected) {
        setState(() {
          _isSelected = selected;
        });
      },
    );
  }
}
