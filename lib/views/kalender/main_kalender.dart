import 'package:flutter/material.dart';
import 'package:frontend/resources/theme/app_colors.dart';
import 'package:frontend/widgets/custom_top_navbar_fitur.dart';

class KalenderCutiPage extends StatefulWidget {
  @override
  _KalenderCutiPageState createState() => _KalenderCutiPageState();
}

class _KalenderCutiPageState extends State<KalenderCutiPage> {
  DateTime _focusedDay = DateTime.now();
  late DateTime _firstDayOfMonth;
  late DateTime _lastDayOfMonth;
  DateTime? _selectedDate;

  // Contoh data cuti yang dilaksanakan dan dilanggar
  final List<Map<String, dynamic>> _leaveDays = [
    {'date': DateTime(2024, 8, 1), 'type': 'Cuti Dilaksanakan'},
    {'date': DateTime(2024, 8, 5), 'type': 'Cuti Dilanggar'},
    {'date': DateTime(2024, 8, 7), 'type': 'Cuti Dilaksanakan'},
  ];

  @override
  void initState() {
    super.initState();
    _firstDayOfMonth = DateTime(_focusedDay.year, _focusedDay.month, 1);
    _lastDayOfMonth = DateTime(_focusedDay.year, _focusedDay.month + 1, 0);
  }

  void _showAddLeaveDialog() {
    showDialog(
      context: context,
      builder: (context) {
        DateTime selectedDate = _focusedDay;
        String leaveType = 'Cuti Dilaksanakan';
        return AlertDialog(
          title: Text('Tambah Cuti'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Tanggal: ${formatDate(selectedDate)}'),
              SizedBox(height: 10),
              DropdownButton<String>(
                value: leaveType,
                items: <String>['Cuti Dilaksanakan', 'Cuti Dilanggar']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    leaveType = newValue!;
                  });
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _leaveDays.add({'date': selectedDate, 'type': leaveType});
                });
                Navigator.of(context).pop();
              },
              child: Text('Simpan'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopNavbarFitur(
        appPage: 'Kalender Cuti',
        leading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildCalendarHeader(),
            _buildCalendar(),
            SizedBox(height: 20),
            _buildLeaveList(),
            SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: _showAddLeaveDialog,
            //   child: Text('Tambah Cuti'),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarHeader() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.contentColorBlue, Colors.blueAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.calendar_today, color: Colors.white, size: 28),
              SizedBox(width: 10),
              Text(
                '${_focusedDay.month}-${_focusedDay.year}',
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_left, color: Colors.white),
                onPressed: () {
                  setState(() {
                    _focusedDay =
                        DateTime(_focusedDay.year, _focusedDay.month - 1);
                    _firstDayOfMonth =
                        DateTime(_focusedDay.year, _focusedDay.month, 1);
                    _lastDayOfMonth =
                        DateTime(_focusedDay.year, _focusedDay.month + 1, 0);
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.arrow_right, color: Colors.white),
                onPressed: () {
                  setState(() {
                    _focusedDay =
                        DateTime(_focusedDay.year, _focusedDay.month + 1);
                    _firstDayOfMonth =
                        DateTime(_focusedDay.year, _focusedDay.month, 1);
                    _lastDayOfMonth =
                        DateTime(_focusedDay.year, _focusedDay.month + 1, 0);
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCalendar() {
    int daysInMonth = _lastDayOfMonth.day;
    int firstWeekday = _firstDayOfMonth.weekday;

    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: daysInMonth + (firstWeekday - 1),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemBuilder: (context, index) {
          if (index < firstWeekday - 1) {
            return Container(); // Empty container for days from the previous month
          } else {
            int day = index - (firstWeekday - 1) + 1;
            return _buildCalendarDay(day);
          }
        },
      ),
    );
  }

  Widget _buildCalendarDay(int day) {
    DateTime date = DateTime(_focusedDay.year, _focusedDay.month, day);
    bool hasEvent =
        _leaveDays.any((leaveDay) => isSameDay(leaveDay['date'], date));
    String eventType = hasEvent
        ? _leaveDays
            .firstWhere((leaveDay) => isSameDay(leaveDay['date'], date))['type']
        : '';

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedDate = date;
        });
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: hasEvent
              ? (eventType == 'Cuti Dilaksanakan'
                  ? LinearGradient(colors: [Colors.greenAccent, Colors.green])
                  : LinearGradient(colors: [Colors.redAccent, Colors.red]))
              : null,
          color: hasEvent ? Colors.transparent : Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          '$day',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: hasEvent ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildLeaveList() {
    final leaveForSelectedDate = _selectedDate == null
        ? []
        : _leaveDays
            .where((leaveDay) => isSameDay(leaveDay['date'], _selectedDate!))
            .toList();

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8.0,
              offset: Offset(0, -4),
            ),
          ],
        ),
        child: _selectedDate == null
            ? Center(child: Text('Pilih tanggal untuk melihat detail cuti'))
            : leaveForSelectedDate.isEmpty
                ? Center(child: Text('Tidak ada cuti pada tanggal ini'))
                : ListView.builder(
                    itemCount: leaveForSelectedDate.length,
                    itemBuilder: (context, index) {
                      final item = leaveForSelectedDate[index];
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 4.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4.0,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(12.0),
                          title: Text(
                            formatDate(item['date']),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(item['type']),
                        ),
                      );
                    },
                  ),
      ),
    );
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  String formatDate(DateTime date) {
    String day = date.day < 10 ? '0${date.day}' : '${date.day}';
    String month = date.month < 10 ? '0${date.month}' : '${date.month}';
    String year = '${date.year}';
    return '$day-$month-$year';
  }
}
