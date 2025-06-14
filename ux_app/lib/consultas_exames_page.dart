import 'package:flutter/material.dart';
import 'package:ux_app/menu_drawer.dart';
import 'package:ux_app/call_page.dart';
import 'package:ux_app/bottom_nav_bar.dart';

class ConsultasExamesPage extends StatelessWidget {
  const ConsultasExamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00995D),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'MedQuest',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: Colors.white,
                decorationThickness: 2,
              ),
            ),
          ],
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      backgroundColor: const Color(0xFFF0FFFA),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Consultas / Exames',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Próximas Consultas:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            _buildConsultaCard(
              context: context,
              especialidade: 'Clínico Geral:',
              data: '30/06/2025',
              hora: '15:30',
            ),
            const SizedBox(height: 16),
            _buildConsultaCard(
              context: context,
              especialidade: 'Cardiologista:',
              data: '15/07/2025',
              hora: '08:20',
            ),
            const SizedBox(height: 32),
            const Text(
              'Próximos Exames:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            _buildExameCard(
              context: context,
              tipoExame: 'Exame de Sangue:',
              data: '16/07/2025',
              hora: '08:20',
              local: 'Clínica MedQuest, Vila Velha, centro n: 1200',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 2),
    );
  }
  static Widget _buildConsultaCard({
    required BuildContext context,
    required String especialidade,
    required String data,
    required String hora,
  }) {
    return Card(
      color: const Color(0xFFF2F2F2),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Colors.black),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    especialidade,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00995D),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Tipo de Consulta: Online',
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 4),
                  Text('Data: $data', style: const TextStyle(fontSize: 15)),
                  const SizedBox(height: 4),
                  Text('Hora: $hora', style: const TextStyle(fontSize: 15)),
                ],
              ),
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CallPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFACF39D),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 8,
                    ),
                  ),
                  child: const Text('Acessar Consulta'),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    _mostrarPopUpDesmarcar(context, 'Consulta');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF5B0B0),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('Desmarcar Consulta'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  static Widget _buildExameCard({
    required BuildContext context,
    required String tipoExame,
    required String data,
    required String hora,
    required String local,
  }) {
    return Card(
      color: const Color(0xFFF2F2F2),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Colors.black),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tipoExame,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00995D),
              ),
            ),
            const SizedBox(height: 8),
            Text('Data: $data', style: const TextStyle(fontSize: 15)),
            const SizedBox(height: 4),
            Text('Hora: $hora', style: const TextStyle(fontSize: 15)),
            const SizedBox(height: 4),
            Text('Local: $local', style: const TextStyle(fontSize: 15)),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  _mostrarPopUpDesmarcar(context, 'Exame');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF5B0B0),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                ),
                child: const Text('Desmarcar Exame'),
              ),
            ),
          ],
        ),
      ),
    );
  }
  static void _mostrarPopUpDesmarcar(BuildContext context, String tipo) {
    TextEditingController motivoController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Cancelar $tipo ?',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: motivoController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Descreva sobre o motivo do cancelamento...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Fecha pop-up
                  Navigator.of(
                    context,
                  ).pop(); // Volta para tela dashboard
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFACF39D),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                ),
                child: Text('Cancelar $tipo'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFF5B0B0),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                ),
                child: const Text('Voltar'),
              ),
            ],
          ),
        );
      },
    );
  }
}