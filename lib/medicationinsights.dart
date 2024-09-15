import 'package:flutter/material.dart';

class MedicationInsights extends StatelessWidget {
  @override
  const MedicationInsights({super.key});
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MedicationPage(),
    );
  }
}

class MedicationPage extends StatefulWidget {
  @override
  _MedicationPageState createState() => _MedicationPageState();
}

class _MedicationPageState extends State<MedicationPage> {
  bool showMed1Info = false;
  bool showMed2Info = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showMed1Info = !showMed1Info;
                });
              },
              child: Text('Adderall'),
            ),
            if (showMed1Info)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Adderall Information',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text('A medication commonly popularized for the solutions for those struggling with ADHD. This stimulant is composed of amphetamine and dextroamphetamine and works by increasing the brain’s levels of dopamine and norepinephrine. This in turn allows those who take adderall to feel an inclination to focus more easily. Misuse can lead to addiction, loss of appetite, insomnia, headaches, heart palpitations, constipation, and anxiety. Adderall is not meant to be taken in tandem with MAOI(Monoamine Oxidase Inhibitors).'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showMed2Info = !showMed2Info;
                });
              },
              child: Text('Lexapro'),
            ),
            if (showMed2Info)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lexapro Information',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text('Escitalopram, better known as Lexapro, is a drug often used to treat patients facing generalized anxiety disorder and depression. This antidepressant works by increasing chemical serotonin more active in the brain. This drug is exclusively available through a doctor’s prescription. Lexapro should not be taken in tandem with blood thinners, alcohol, or pimozide as these drug interactions could lead to fatal side effects. Other side effects of Lexapro may include: Nausea; Insomnia; Drowsiness; Dhiarrea; Serotonin syndome; higher risk of bleeding. '),
                        ],
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
