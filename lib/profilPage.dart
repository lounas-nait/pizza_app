import 'package:flutter/material.dart';
import 'appBarTitre.dart';
import 'bottomBarMenu.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarTitre(title: 'Mon profil'),
      bottomNavigationBar: Bottombarmenu(),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.red.shade100,
                backgroundImage: const NetworkImage(
                  'https://tse3.mm.bing.net/th/id/OIP.E0aM_U_NvbE72bw0Z6vFhQHaKX?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'LOONA',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  'loona@email.com',
                  style: TextStyle(fontSize: 15, color: Colors.grey.shade700),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Divider(),
          ListTile(
            leading: Icon(Icons.receipt_long, color: Colors.red),
            title: Text('Mes commandes'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
          const Divider(height: 1),
          ListTile(
            leading: Icon(Icons.payment, color: Colors.red),
            title: Text('Mode de paiement'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {},
          ),
          const Divider(height: 1),
        ],
      ),
    );
  }
}