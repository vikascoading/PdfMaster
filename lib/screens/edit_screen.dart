
import 'dart:io';
import 'package:flutter/material.dart';

class EditScreen extends StatelessWidget {
  final String action;
  final List<String>? imagePaths;
  const EditScreen({super.key, required this.action, this.imagePaths});

  @override
  Widget build(BuildContext context) {
    final isImages = action == 'images';
    return Scaffold(
      appBar: AppBar(title: Text(isImages ? 'Images to PDF' : 'Editor')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: isImages ? _buildImages() : const Center(child: Text('Editor')),
      ),
    );
  }

  Widget _buildImages() {
    final paths = imagePaths ?? [];
    if (paths.isEmpty) return const Center(child: Text('No images'));
    return ListView.builder(
      itemCount: paths.length,
      itemBuilder: (context, index) {
        final p = paths[index];
        return Card(
          color: Colors.black,
          child: ListTile(
            leading: Image.file(File(p)),
            title: Text(p.split('/').last, style: const TextStyle(color: Colors.white)),
            trailing: const Icon(Icons.save, color: Color(0xFFFFB300)),
          ),
        );
      },
    );
  }
}
