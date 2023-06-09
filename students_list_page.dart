import 'package:flutter/material.dart';

class StudentsListPage extends StatefulWidget {
  @override
  _StudentsListPageState createState() => _StudentsListPageState();
}

class _StudentsListPageState extends State<StudentsListPage> {
  String selectedClass = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des étudiants'),
      ),
      body: Column(
        children: [
          DropdownButton<String>(
            value: selectedClass.isNotEmpty ? selectedClass : 'Toutes les classes',
            onChanged: (String? newValue) {
              setState(() {
                selectedClass = newValue!;
              });
            },
            items: <String>[
              'Toutes les classes',
              'CPD',
              'CDSD',
              'GLRS',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                final student = students[index];
                if (selectedClass == 'Toutes les classes' ||
                    student.classe == selectedClass) {
                  return ListTile(
                    title: Text(student.nom),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(student.prenom),
                        Text(student.email),
                      ],
                    ),
                  );
                } else {
                  return SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Student {
  final String nom;
  final String prenom;
  final String classe;
  final String matricule;
  final String email;

  Student(
      {required this.nom,
      required this.prenom,
      required this.classe,
      required this.matricule,
      required this.email});
}

List<Student> students = [
  Student(
      nom: 'Diop',
      prenom: 'Booba',
      classe: 'CPD',
      matricule: '001',
      email: 'bouba@example.com'),
  Student(
      nom: 'Coumbaa',
      prenom: 'Keita',
      classe: 'CDSD',
      matricule: '002',
      email: 'coumbaa@example.com'),
  Student(
      nom: 'Daoud',
      prenom: 'Dias',
      classe: 'GLRS',
      matricule: '003',
      email: 'daoud@example.com'),
  
];
