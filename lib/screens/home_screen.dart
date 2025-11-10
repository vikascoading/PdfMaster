
import 'package:flutter/material.dart';
import '../services/pdf_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> tools = [
      {'name': 'Merge PDF', 'action': 'merge'},
      {'name': 'Split PDF', 'action': 'split'},
      {'name': 'Protect PDF', 'action': 'protect'},
      {'name': 'Unlock PDF', 'action': 'unlock'},
      {'name': 'Images → PDF', 'action': 'images'},
      {'name': 'View Files', 'action': 'view'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('PDFMaster'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: tools.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.05,
          ),
          itemBuilder: (context, index) {
            final tool = tools[index];
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                side: const BorderSide(color: Color(0xFFFFB300), width: 1.5),
                padding: const EdgeInsets.all(12),
              ),
              onPressed: () => PdfService().openTool(context, tool['action']!),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.picture_as_pdf, color: const Color(0xFFFFB300), size: 44),
                  const SizedBox(height: 10),
                  Text(tool['name']!, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white)),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(color: Colors.black),
        child: const Text('Developed by Vikas Sharma', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFFFFB300))),
      ),
    );
  }
}
