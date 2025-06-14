import 'package:flutter/material.dart';
import 'package:ux_app/menu_drawer.dart';
import 'package:ux_app/dashboard.dart';
import 'package:ux_app/bottom_nav_bar.dart';

class CheckinPage extends StatefulWidget {
  const CheckinPage({super.key});

  @override
  State<CheckinPage> createState() => _CheckinPageState();
}

class _CheckinPageState extends State<CheckinPage> {
  String? selectedMood;
  Map<String, String?> answers = {};

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
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Olá, Pedro!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                const Text(
                  'Como vc está se sentindo hoje?',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _MoodIcon(
                      label: 'Muito bem',
                      emoji: '😄',
                      isSelected: selectedMood == 'Muito bem',
                      onTap: () {
                        setState(() {
                          selectedMood = 'Muito bem';
                        });
                      },
                    ),
                    _MoodIcon(
                      label: 'Bem',
                      emoji: '🙂',
                      isSelected: selectedMood == 'Bem',
                      onTap: () {
                        setState(() {
                          selectedMood = 'Bem';
                        });
                      },
                    ),
                    _MoodIcon(
                      label: 'Neutro',
                      emoji: '😐',
                      isSelected: selectedMood == 'Neutro',
                      onTap: () {
                        setState(() {
                          selectedMood = 'Neutro';
                        });
                      },
                    ),
                    _MoodIcon(
                      label: 'Cansado',
                      emoji: '😩',
                      isSelected: selectedMood == 'Cansado',
                      onTap: () {
                        setState(() {
                          selectedMood = 'Cansado';
                        });
                      },
                    ),
                    _MoodIcon(
                      label: 'Mal',
                      emoji: '☹️',
                      isSelected: selectedMood == 'Mal',
                      onTap: () {
                        setState(() {
                          selectedMood = 'Mal';
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                _buildQuestion('1- Dormiu bem?'),
                _buildYesNoButtons('pergunta1'),
                _buildQuestion('2- Sentiu alguma dor hoje?'),
                _buildYesNoButtons('pergunta2'),
                _buildTextField(),
                _buildQuestion(
                  '3- Tomou os remédios?\nSentiu algum efeito colateral? Se “Sim”, descreva sobre.',
                ),
                _buildYesNoButtons('pergunta3'),
                _buildTextField(),
                _buildQuestion('4- Bebeu água suficiente hoje?'),
                _buildYesNoButtons('pergunta4'),
                _buildQuestion(
                  '5- Se movimentou hoje?\n(caminhada, exercícios leves...)',
                ),
                _buildYesNoButtons('pergunta5'),
                _buildQuestion('6- Está com fadiga ou cansaço?'),
                _buildYesNoButtons('pergunta6'),
                _buildQuestion(
                  '7- Há algo que gostaria de contar à equipe médica hoje?',
                ),
                _buildTextField(),

                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00995D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          title: const Text(
                            'Finalizado!',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          content: const Text(
                            'Dados Salvos com sucesso!',
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          actionsAlignment: MainAxisAlignment.center,
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const DashboardPage(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF99F6CA),
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Text(
                                'Voltar',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text(
                    'Finalizar Check-in',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 0),
    );
  }
  Widget _buildQuestion(String question) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(
        question,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
  Widget _buildYesNoButtons(String questionKey) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildAnswerButton('Sim', questionKey),
        const SizedBox(width: 20),
        _buildAnswerButton('Não', questionKey),
      ],
    );
  }
  Widget _buildAnswerButton(String label, String questionKey) {
    final isSelected = answers[questionKey] == label;

    return OutlinedButton(
      onPressed: () {
        setState(() {
          answers[questionKey] = label;
        });
      },
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        side: BorderSide(
          color: isSelected ? const Color(0xFF00995D) : Colors.black,
          width: isSelected ? 2 : 1,
        ),
        backgroundColor: isSelected ? const Color(0xFFCCF2E0) : null,
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
  Widget _buildTextField() {
    return const Padding(
      padding: EdgeInsets.only(top: 8),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Descreva mais...',
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.all(8),
        ),
        maxLines: 2,
      ),
    );
  }
}
class _MoodIcon extends StatelessWidget {
  final String label;
  final String emoji;
  final VoidCallback onTap;
  final bool isSelected;

  const _MoodIcon({
    required this.label,
    required this.emoji,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFCCF2E0) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text(emoji, style: const TextStyle(fontSize: 28)),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}