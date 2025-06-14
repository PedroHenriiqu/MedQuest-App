import 'package:flutter/material.dart';
import 'package:ux_app/MedicacaoPage.dart';
import 'package:ux_app/consultas_exames_page.dart';
import 'package:ux_app/login.dart';
import 'package:ux_app/checkin_page.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF00995D),
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 30),
          const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, color: Colors.green, size: 30),
          ),
          const SizedBox(height: 10),
          const Text(
            'Pedro Souza',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const Text(
            'Rua Papa João, 12 - Vila Velha - ES',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
          const Divider(color: Colors.white54, height: 30),
          // Campo pesquisa
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Pesquise aqui...',
                border: InputBorder.none,
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          const SizedBox(height: 20),

          const Text('CATEGORIAS:', style: TextStyle(color: Colors.white70)),
          ListTile(
            leading: const Icon(Icons.check_circle, color: Colors.white),
            title: const Text(
              'Check-ins Diarios',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CheckinPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.medication, color: Colors.white),
            title: const Text(
              'Medicações',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pop(context); // fecha o drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MedicacaoPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.medical_services, color: Colors.white),
            title: const Text(
              'Consultas / Exames',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ConsultasExamesPage(),
                ),
              );
            },
          ),
          const SizedBox(height: 20),

          const Text('MINHA CONTA:', style: TextStyle(color: Colors.white70)),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.white),
            title: const Text(
              'Minha Conta',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.location_on, color: Colors.white),
            title: const Text(
              'Endereços',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {},
          ),
          const Spacer(),

          const Divider(color: Colors.white54),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.white),
            title: const Text('Sair', style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}