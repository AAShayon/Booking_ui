// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const BookingApp());
// }
//
// class BookingApp extends StatelessWidget {
//   const BookingApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Booking UI',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: BookingScreen(),
//     );
//   }
// }
//
// class BookingScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Book Your Seat'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: GridView.builder(
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 4,
//             crossAxisSpacing: 10,
//             mainAxisSpacing: 10,
//           ),
//           itemCount: 40,
//           itemBuilder: (BuildContext context, int index) {
//             int row = index ~/ 4 + 1;
//             int column = index % 4 + 1;
//             String seatNumber = String.fromCharCode(row + 64) + column.toString();
//             return SeatButton(seatNumber);
//           },
//         ),
//       ),
//     );
//   }
// }
//
// class SeatButton extends StatefulWidget {
//   final String seat;
//
//   SeatButton(this.seat);
//
//   @override
//   _SeatButtonState createState() => _SeatButtonState();
// }
//
// class _SeatButtonState extends State<SeatButton> {
//   bool _isSelected = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {
//         setState(() {
//           _isSelected = !_isSelected;
//         });
//       },
//       style: ElevatedButton.styleFrom(
//         backgroundColor: _isSelected ? Colors.green : Colors.grey,
//         padding: EdgeInsets.all(20),
//       ),
//       child: Text(
//         widget.seat,
//         style: TextStyle(fontSize: 20),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() {
  runApp(BookingApp());
}

class BookingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Booking UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BookingScreen(),
    );
  }
}

class BookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Your Seat'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: 40,
          itemBuilder: (BuildContext context, int index) {
            int row = index ~/ 4 + 1;
            int column = index % 4 + 1;
            String seatNumber = String.fromCharCode(row + 64) + column.toString();
            return SeatButton(seatNumber, (index + 1) % 2 == 0);
          },
        ),
      ),
    );
  }
}

class SeatButton extends StatefulWidget {
  final String seat;
  final bool addSpacer;

  SeatButton(this.seat, this.addSpacer);

  @override
  _SeatButtonState createState() => _SeatButtonState();
}

class _SeatButtonState extends State<SeatButton> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              _isSelected = !_isSelected;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: _isSelected ? Colors.green : Colors.grey,
            padding: EdgeInsets.all(20),
          ),
          child: Text(
            widget.seat,
            style: TextStyle(fontSize: 20),
          ),
        ),
        if (widget.addSpacer) SizedBox(height: 10),
      ],
    );
  }
}
