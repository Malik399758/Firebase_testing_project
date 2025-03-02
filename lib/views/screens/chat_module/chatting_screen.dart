import 'package:firebase_first_testing/views/screens/chat_module/user_chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChattingScreen extends StatefulWidget {
  const ChattingScreen({super.key});

  @override
  State<ChattingScreen> createState() => _ChattingScreenState();
}

class _ChattingScreenState extends State<ChattingScreen> {
  TextEditingController searchController = TextEditingController();

  List<String> images = [
    'assets/images/y.jpg',
    'assets/images/y.jpg',
    'assets/images/y.jpg',
    'assets/images/y.jpg',
    'assets/images/y.jpg',
    'assets/images/y.jpg',
    'assets/images/y.jpg',
  ];
  List<String> names = ['Yaseen Malik', 'Ali', 'Asad', 'Noman', 'Bob', 'John', 'Jane'];
  List<String> subTitle = [
    'What is the condition of product',
    'What is the condition of product',
    'What is the condition of product',
    'What is the condition of product',
    'What is the condition of product',
    'What is the condition of product',
    'What is the condition of product',
  ];
  List<String> time = ['7 Jan', '6 Jan', '10 Jan', '12 Jan', '15 Jan', '3 Jan', '8 Jan'];

  List<String> filteredNames = [];

  @override
  void initState() {
    super.initState();
    filteredNames = List.from(names);
  }

  void filterSearch(String query) {
    setState(() {
      filteredNames = query.isEmpty
          ? List.from(names)
          : names.where((name) => name.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text(
              'Chat',
              style: GoogleFonts.poppins(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  const Icon(Icons.search),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      onChanged: filterSearch,
                      decoration: const InputDecoration(
                        hintText: "Search by name",
                        border: InputBorder.none,
                      ),
                      style: GoogleFonts.poppins(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: filteredNames.isEmpty ? Center(child: Text('User not found',style: GoogleFonts.poppins(fontSize: 21,fontWeight: FontWeight.w600),))
                : ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: filteredNames.length,
              itemBuilder: (context, index) {
                int originalIndex = names.indexOf(filteredNames[index]); // Get original index
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserChatScreen(
                          name: names[originalIndex],
                          imageUrl: images[originalIndex],
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(images[originalIndex]),
                    ),
                    title: Text(
                      names[originalIndex],
                      style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(subTitle[originalIndex]),
                    trailing: Text(
                      time[originalIndex],
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
