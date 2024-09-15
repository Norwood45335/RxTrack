import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:rx_track/medications/camera.dart';

class Medications extends StatefulWidget {
  final CameraDescription camera;

  const Medications({super.key, required this.camera});

  @override
  State<Medications> createState() => _MedicationsState();
}

class _MedicationsState extends State<Medications> {
  Map<String, int> medications = {
    'Adderall 20mg': 3,
    // 'Lexapro 10mg': 1,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Camera(
                camera: widget.camera,
              ),
            ),
          );
        },
        child: Icon(Icons.camera_alt),
      ),
      body: ListView(
        children: medications.entries
            .map((entry) => MedicationCard(
                  medName: entry.key,
                  doseCap: entry.value,
                ))
            .toList(),
      ),
    );
  }
}

class MedicationCard extends StatefulWidget {
  final String medName;
  final int doseCap;

  const MedicationCard({
    Key? key,
    required this.medName,
    required this.doseCap,
  }) : super(key: key);

  @override
  _MedicationCardState createState() => _MedicationCardState();
}

class _MedicationCardState extends State<MedicationCard> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          widget.medName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        subtitle: Row(
          children: [
            Text('Taken $counter/${widget.doseCap} times.'),
            if (counter < widget.doseCap)
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    counter++;
                  });
                },
                child: Text('Took Dose'),
              ),
          ],
        ),
        trailing: Column(
          children: [
            Text('Next Refill:\n3 weeks'),
          ],
        ),
      ),
    );
  }
}
