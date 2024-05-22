import 'package:flutter/material.dart';
import 'estructura_app.dart';

class FinancieroPage extends StatefulWidget {
  const FinancieroPage({Key? key}) : super(key: key);

  @override
  _FinancieroPageState createState() => _FinancieroPageState();
}

class _FinancieroPageState extends State<FinancieroPage> {
  List<Map<String, dynamic>> selectedPayments = [
    {'payment': 'Cuota de enero', 'value': 200, 'paid': false},
    {'payment': 'Cuota de febrero', 'value': 200, 'paid': false},
    {'payment': 'Materiales', 'value': 50, 'paid': false},
  ];

  List<Map<String, dynamic>> previousPayments = [
    {'payment': 'Cuota de diciembre', 'value': 200, 'paid': true},
    {'payment': 'Inscripción', 'value': 300, 'paid': true},
  ];

  @override
  Widget build(BuildContext context) {
    selectedPayments.sort((a, b) {
      // Ordenar de más antiguo a más reciente
      return a['payment'].compareTo(b['payment']);
    });

    previousPayments.sort((a, b) {
      // Ordenar de más antiguo a más reciente
      return a['payment'].compareTo(b['payment']);
    });

    return EstructuraPage(
      pageTitle: 'Financiero',
      pageContent: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionCard(
              title: 'Seleccionar Pagos',
              icon: Icons.attach_money,
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: selectedPayments.map((payment) {
                  return CheckboxListTile(
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(payment['payment']),
                        ),
                        Text(
                          '\$${payment['value']}',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    value: payment['paid'],
                    onChanged: (value) {
                      setState(() {
                        if (_canPay(payment)) {
                          payment['paid'] = value;
                        }
                      });
                    },
                    controlAffinity: ListTileControlAffinity.trailing,
                    activeColor: Color(0xFFFF914D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),
            SectionCard(
              title: 'Total a Pagar',
              icon: Icons.money,
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total: \$${_calculateTotal()}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Acción para proceder al pago en línea
                    },
                    child: Text('Pagar en Línea'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            SectionCard(
              title: 'Pagos Anteriores',
              icon: Icons.history,
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: previousPayments.map((payment) {
                  return ListTile(
                    title: Text(payment['payment']),
                    subtitle: Text('\$${payment['value']}'),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _calculateTotal() {
    double total = 0;
    for (var payment in selectedPayments) {
      if (payment['paid']) {
        total += payment['value'];
      }
    }
    return total;
  }

  bool _canPay(Map<String, dynamic> payment) {
    // Verificar si se puede pagar este pago
    int currentIndex = selectedPayments.indexOf(payment);
    for (int i = 0; i < currentIndex; i++) {
      if (!selectedPayments[i]['paid']) {
        // Si hay un pago más antiguo sin pagar, no se puede pagar este
        return false;
      }
    }
    return true;
  }
}

class SectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget content;

  const SectionCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 28, color: Colors.blue),
                SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10),
            content,
          ],
        ),
      ),
    );
  }
}
