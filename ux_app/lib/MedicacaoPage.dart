import 'package:flutter/material.dart';
import 'package:ux_app/menu_drawer.dart';
import 'package:ux_app/bottom_nav_bar.dart';

class MedicacaoPage extends StatelessWidget {
  const MedicacaoPage({super.key});

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Guia de Medicamentos',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Meus Medicamentos:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 12),
            _buildMedicamentoCard(
              nome: 'Losartana',
              horarios: '08:00, 14:00, 20:00',
              dose: '1 Comprimido',
              duracao: '20 dias',
              observacao: null,
            ),
            _buildMedicamentoCard(
              nome: 'Dipirona',
              horarios: '01:00, 09:00, 17:00',
              dose: '1 Comprimido',
              duracao: '20 dias',
              observacao: 'Caso houver dor e febre.',
              isHighlighted: true,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 1),
    );
  }

  Widget _buildMedicamentoCard({
    required String nome,
    required String horarios,
    required String dose,
    required String duracao,
    String? observacao,
    bool isHighlighted = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(
          color: isHighlighted ? Colors.blue : Colors.grey[300]!,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.medication),
              const SizedBox(width: 8),
              Text(
                nome,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text('Horário: $horarios'),
          Text('Dose: $dose'),
          Text('Duração: $duracao'),
          if (observacao != null) ...[
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(observacao),
            )
          ],
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(Icons.edit),
              Icon(Icons.delete),
              Icon(Icons.check_circle_outline),
            ],
          ),
        ],
      ),
    );
  }
}
