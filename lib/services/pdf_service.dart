
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../screens/edit_screen.dart';

class PdfService {
  Future<void> openTool(BuildContext context, String action) async {
    switch (action) {
      case 'images':
        await _imagesToPdf(context);
        break;
      case 'view':
        await _viewFiles(context);
        break;
      case 'merge':
        await _mergePdfs(context);
        break;
      case 'split':
        await _splitPdf(context);
        break;
      case 'protect':
        await _protectPdf(context);
        break;
      case 'unlock':
        await _unlockPdf(context);
        break;
      default:
        _showMessage(context, 'Unknown action');
    }
  }

  void _showMessage(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  Future<void> _imagesToPdf(BuildContext context) async {
    try {
      final result = await FilePicker.platform.pickFiles(allowMultiple: true, type: FileType.image);
      if (result == null || result.files.isEmpty) return;
      List<String> paths = result.files.map((e) => e.path!).whereType<String>().toList();
      // create pdf
      final pdf = pw.Document();
      for (final p in paths) {
        final image = pw.MemoryImage(File(p).readAsBytesSync());
        pdf.addPage(pw.Page(build: (pw.Context ctx) => pw.Center(child: pw.Image(image))));
      }
      final outDir = await getApplicationDocumentsDirectory();
      final outFile = File('\${outDir.path}/pdfmaster_images_\${DateTime.now().millisecondsSinceEpoch}.pdf');
      await outFile.writeAsBytes(await pdf.save());
      Fluttertoast.showToast(msg: 'Saved to: ' + outFile.path);
      Navigator.push(context, MaterialPageRoute(builder: (_) => EditScreen(action: 'images', imagePaths: paths)));
    } catch (e) {
      _showMessage(context, 'Error: \$e');
    }
  }

  Future<void> _viewFiles(BuildContext context) async {
    final outDir = await getApplicationDocumentsDirectory();
    final files = outDir.listSync().whereType<File>().where((f) => f.path.endsWith('.pdf')).toList();
    if (files.isEmpty) {
      _showMessage(context, 'No PDFs saved yet');
      return;
    }
    await OpenFile.open(files.first.path);
  }

  Future<void> _mergePdfs(BuildContext context) async {
    _showMessage(context, 'Merge feature: Select PDFs to merge (placeholder)');
    // Implement merging using package of choice (syncfusion or pdf_merger)
  }

  Future<void> _splitPdf(BuildContext context) async {
    _showMessage(context, 'Split feature: Select a PDF to split (placeholder)');
  }

  Future<void> _protectPdf(BuildContext context) async {
    _showMessage(context, 'Protect (encrypt) PDF - placeholder');
  }

  Future<void> _unlockPdf(BuildContext context) async {
    _showMessage(context, 'Unlock (decrypt) PDF - placeholder');
  }
}
