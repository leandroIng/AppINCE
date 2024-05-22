import 'package:flutter/material.dart';
import 'estructura_app.dart';

class SeleccionPage extends StatefulWidget {
  const SeleccionPage({Key? key}) : super(key: key);

  @override
  _SeleccionPageState createState() => _SeleccionPageState();
}

class _SeleccionPageState extends State<SeleccionPage> {
  List<Map<String, dynamic>> selectedSubjects = [];

  int currentStep = 0;
  bool complete = false;

  void _onStepContinue() {
    setState(() {
      if (currentStep < 2) {
        currentStep += 1;
      } else {
        complete = true;
      }
    });
  }

  void _onStepCancel() {
    setState(() {
      if (currentStep > 0) {
        currentStep -= 1;
      } else {
        currentStep = 0;
      }
    });
  }

  void _showConflictDialog(String conflict) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Conflicto de selección'),
          content: Text(conflict),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return EstructuraPage(
      pageTitle: 'Selección de Materias',
      pageContent: Theme(
        data: ThemeData(
          colorScheme: ColorScheme.light(primary: Color(0xFFFF914D)),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Color(0xFFFF914D),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFFF914D),
              foregroundColor: Colors.white,
            ),
          ),
        ),
        child: Stepper(
          type: StepperType.vertical,
          currentStep: currentStep,
          onStepContinue: _onStepContinue,
          onStepCancel: _onStepCancel,
          steps: <Step>[
            Step(
              title: Text('Paso 1: Seleccionar Materias, Horario y Docente'),
              content: Column(
                children: [
                  _buildSubjectTile('MAT-100/S1', 'Matemáticas', '08:00 AM', 'Profesor A'),
                  _buildSubjectTile('MAT-100/S2', 'Matemáticas', '09:00 AM', 'Profesor A'),
                  _buildSubjectTile('CIE-200/S1', 'Ciencias', '09:00 AM', 'Profesor B'),
                  _buildSubjectTile('CIE-200/S2', 'Ciencias', '10:00 AM', 'Profesor B'),
                  _buildSubjectTile('HIS-300/S1', 'Historia', '10:00 AM', 'Profesor C'),
                  _buildSubjectTile('HIS-300/S2', 'Historia', '11:00 AM', 'Profesor C'),
                ],
              ),
            ),
            Step(
              title: Text('Paso 2: Verificar Materias Seleccionadas'),
              content: Column(
                children: selectedSubjects.map((subject) {
                  return ListTile(
                    title: Text('${subject['subject']} - ${subject['time']}'),
                    subtitle: Text('Docente: ${subject['teacher']}'),
                  );
                }).toList(),
              ),
            ),
            Step(
              title: Text('Paso 3: Proceder con la Selección'),
              content: Column(
                children: [
                  Text('¡Selección completada! Continuar para ver su horario actual.'),
                ],
              ),
            ),
          ],
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            return Row(
              children: <Widget>[
                ElevatedButton(
                  onPressed: details.onStepContinue,
                  child: Text('Continuar'),
                ),
                SizedBox(width: 12),
                TextButton(
                  onPressed: details.onStepCancel,
                  child: Text('Cancelar'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildSubjectTile(String code, String subject, String schedule, String teacher) {
    return CheckboxListTile(
      title: Text('$subject - $code'),
      subtitle: Text('Horario: $schedule\nDocente: $teacher'),
      value: selectedSubjects.any(
          (subj) => subj['code'] == code && subj['subject'] == subject),
      onChanged: (value) {
        setState(() {
          if (value!) {
            // Check if another section of the same subject is already selected
            if (selectedSubjects.any((subj) => subj['subject'] == subject)) {
              _showConflictDialog('Ya has seleccionado una sección para $subject.');
            } else if (selectedSubjects.any((subj) => subj['time'] == schedule)) {
              String conflictSubject = selectedSubjects.firstWhere((subj) => subj['time'] == schedule)['subject'];
              _showConflictDialog('El horario de $subject choca con el de $conflictSubject.');
            } else {
              // Add selected subject
              selectedSubjects.add({
                'code': code,
                'subject': subject,
                'time': schedule,
                'teacher': teacher
              });
            }
          } else {
            // Remove selected subject
            selectedSubjects.removeWhere(
                (subj) => subj['code'] == code && subj['subject'] == subject);
          }
        });
      },
      controlAffinity: ListTileControlAffinity.trailing,
      activeColor: Color(0xFFFF914D),
    );
  }
}
