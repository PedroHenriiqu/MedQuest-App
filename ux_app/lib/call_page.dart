import 'package:flutter/material.dart';

class CallPage extends StatelessWidget {
  const CallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: _buildVideoTile(
                text: 'Entrando em contato com o médico.\nAguarde!',
              ),
            ),
            Flexible(
              flex: 1,
              child: _buildVideoTile(
                text: 'Pedro',
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const IconButton(
              icon: Icon(Icons.mic_off, color: Colors.white, size: 30),
              onPressed: null,
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
              backgroundColor: Colors.red,
              child: const Icon(Icons.call_end, color: Colors.white),
            ),
            const IconButton(
              icon: Icon(Icons.videocam_off, color: Colors.white, size: 30),
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoTile({required String text}) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Center( // ← Centraliza tudo dentro do container
        child: Column(
          mainAxisSize: MainAxisSize.min, // ← Evita esticar desnecessariamente
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person,
              size: 80,
              color: Colors.black.withOpacity(0.7),
            ),
            const SizedBox(height: 16),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}