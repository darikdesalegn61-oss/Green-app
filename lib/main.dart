import 'package:flutter/material.dart';

void main() => runApp(const GreenEmpire());

class GreenEmpire extends StatelessWidget {
  const GreenEmpire({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.green,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const WelcomeScreen(),
    );
  }
}

// 1 & 2. መግቢያና ምዝገባ
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage())),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100, height: 100,
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.green, width: 4)),
                child: const Center(child: Text('g', style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold))),
              ),
              const SizedBox(height: 20),
              const Text("GREEN EMPIRE", style: TextStyle(fontSize: 28, color: Colors.green, fontWeight: FontWeight.bold)),
              const Text("Tap to Enter", style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Account")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const TextField(decoration: InputDecoration(labelText: "Full Name")),
            const TextField(decoration: InputDecoration(labelText: "Phone Number")),
            const TextField(decoration: InputDecoration(labelText: "Email (Gmail)")),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green, minimumSize: const Size(double.infinity, 50)),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const MainNav())),
              child: const Text("SIGN UP", style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}

// 3. ዋናው ማውጫ (Home, Shorts, Upload, Chat, Wallet)
class MainNav extends StatefulWidget {
  const MainNav({super.key});
  @override
  State<MainNav> createState() => _MainNavState();
}

class _MainNavState extends State<MainNav> {
  int _idx = 0;
  final List<Widget> _tabs = [
    const HomeFeed(), 
    const Center(child: Text("Shorts Area")), 
    const Center(child: Text("Upload Content")), 
    const ChatArea(), 
    const WalletArea()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_idx],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _idx,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.white60,
        onTap: (i) => setState(() => _idx = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.play_arrow), label: "Shorts"),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: "Upload"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: "Wallet"),
        ],
      ),
    );
  }
}

// 4 & 11. Home Feed & Wallet (70/30 Profit)
class HomeFeed extends StatelessWidget {
  const HomeFeed({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GREEN FEED")),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, i) => Column(
          children: [
            Container(height: 200, color: Colors.grey[900], child: const Icon(Icons.play_circle, size: 50, color: Colors.green)),
            const ListTile(title: Text("Exclusive Video Content"), subtitle: Text("Views: 1.2M | Profit: 70%")),
          ],
        ),
      ),
    );
  }
}

class WalletArea extends StatelessWidget {
  const WalletArea({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Earnings")),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20), margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(color: Colors.green.withOpacity(0.1), borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.green)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Total Balance", style: TextStyle(fontSize: 18)),
                Text("\$29,520", style: TextStyle(fontSize: 28, color: Colors.green, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text("Earnings are split 70% for you and 30% for Green Empire."),
          ),
          const Spacer(),
          ElevatedButton(onPressed: () {}, child: const Text("Withdraw via P2P Escrow")),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class ChatArea extends StatelessWidget {
  const ChatArea({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Messages")),
      body: ListView.builder(itemCount: 10, itemBuilder: (context, i) => ListTile(leading: const CircleAvatar(backgroundColor: Colors.green), title: Text("User ${i+1}"), subtitle: const Text("Encrypted message..."))),
    );
  }
}
