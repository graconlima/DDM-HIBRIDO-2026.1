
import '../../lib/funcionalidades/config/mudar_tema.dart';
import '../../lib/funcionalidades/config/pagina_config.dart';

import '../../lib/core/temas/controlador_tema.dart';
import '../../lib/core/temas/fabrica_temas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ControladorTema>();

    return MaterialApp(
      theme: FabricaTemas.light(controller.themeType),
      darkTheme: FabricaTemas.dark(controller.themeType),
      themeMode: controller.themeMode,
      home: PaginaConfig(),
    );
  }
}