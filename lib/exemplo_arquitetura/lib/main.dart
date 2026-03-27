import '../lib/app/app.dart';
import '../lib/core/temas/controlador_tema.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final controller = ControladorTema();
  await controller.load();

  runApp(
    ChangeNotifierProvider(
      create: (_) => controller,
      child: const MeuApp(),
    ),
  );
}