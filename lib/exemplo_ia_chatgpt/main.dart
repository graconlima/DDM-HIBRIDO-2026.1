import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const PulseApp());
}

class PulseApp extends StatelessWidget {
  const PulseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pulse',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F0F14),
        fontFamily: 'Roboto',
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF6C3EEF),
          secondary: Color(0xFF00D1FF),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const PulseFAB(),
      bottomNavigationBar: const PulseBottomNav(),
      body: SafeArea(
        child: Column(
          children: const [
            Header(),
            SizedBox(height: 10),
            FrequenciasSection(),
            SizedBox(height: 10),
            Expanded(child: ConversasSection()),
          ],
        ),
      ),
    );
  }
}

//// HEADER //////////////////////////////////////////////////////////////

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Pulse",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Stay in sync",
                style: TextStyle(color: Colors.white54),
              ),
            ],
          ),
          const Spacer(),
          const Icon(Icons.search),
          const SizedBox(width: 16),
          const CircleAvatar(
            backgroundColor: Color(0xFF6C3EEF),
            child: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}

//// FREQUÊNCIAS /////////////////////////////////////////////////////////

class FrequenciasSection extends StatelessWidget {
  const FrequenciasSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: "Frequências"),
        const SizedBox(height: 10),
        SizedBox(
          height: 90,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            children: const [
              FrequencyAvatar(name: "Você", isYou: true),
              FrequencyAvatar(name: "Ana"),
              FrequencyAvatar(name: "Carlos"),
              FrequencyAvatar(name: "Julia"),
              FrequencyAvatar(name: "Pedro"),
            ],
          ),
        ),
      ],
    );
  }
}

class FrequencyAvatar extends StatelessWidget {
  final String name;
  final bool isYou;

  const FrequencyAvatar({
    super.key,
    required this.name,
    this.isYou = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: isYou
                  ? null
                  : const LinearGradient(
                colors: [Color(0xFF6C3EEF), Color(0xFF00D1FF)],
              ),
            ),
            child: CircleAvatar(
              radius: 28,
              backgroundColor: const Color(0xFF1A1A22),
              child: Icon(isYou ? Icons.add : Icons.person),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            name,
            style: const TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}

//// CONVERSAS ///////////////////////////////////////////////////////////

class ConversasSection extends StatelessWidget {
  const ConversasSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      children: const [
        SectionTitle(title: "Fixadas"),
        ChatItem(name: "Equipe Dev", message: "Deploy feito!", unread: 2),
        ChatItem(name: "Ana", message: "Tá online?", isOnline: true),

        SizedBox(height: 12),
        SectionTitle(title: "Recentes"),
        ChatItem(name: "Carlos", message: "Bora jogar hoje?"),
        ChatItem(name: "Julia", message: "Te mandei o arquivo"),
        ChatItem(name: "Pedro", message: "Ok 👍", unread: 1),
      ],
    );
  }
}

class ChatItem extends StatelessWidget {
  final String name;
  final String message;
  final int unread;
  final bool isOnline;

  const ChatItem({
    super.key,
    required this.name,
    required this.message,
    this.unread = 0,
    this.isOnline = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 6),
      leading: Stack(
        children: [
          const CircleAvatar(
            radius: 26,
            backgroundColor: Color(0xFF1A1A22),
            child: Icon(Icons.person),
          ),
          if (isOnline)
            Positioned(
              bottom: 2,
              right: 2,
              child: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Colors.greenAccent,
                  shape: BoxShape.circle,
                ),
              ),
            )
        ],
      ),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(
        message,
        style: const TextStyle(color: Colors.white54),
      ),
      trailing: unread > 0
          ? Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF6C3EEF), Color(0xFF00D1FF)],
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          unread.toString(),
          style: const TextStyle(fontSize: 12),
        ),
      )
          : null,
    );
  }
}

//// COMPONENTES REUTILIZÁVEIS //////////////////////////////////////////

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

//// FAB /////////////////////////////////////////////////////////////////

class PulseFAB extends StatelessWidget {
  const PulseFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      onPressed: () {},
      child: const Icon(Icons.bolt),
    );
  }
}

//// BOTTOM NAV //////////////////////////////////////////////////////////

class PulseBottomNav extends StatelessWidget {
  const PulseBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF1A1A22),
      selectedItemColor: const Color(0xFF00D1FF),
      unselectedItemColor: Colors.white38,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: "Conversas"),
        BottomNavigationBarItem(icon: Icon(Icons.waves), label: "Frequências"),
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explorar"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
      ],
    );
  }
}