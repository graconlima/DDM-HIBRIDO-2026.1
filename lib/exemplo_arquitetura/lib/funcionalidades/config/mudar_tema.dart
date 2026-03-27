import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/temas/controlador_tema.dart';
import '../../core/temas/fabrica_temas.dart';

class MudarTema extends StatelessWidget {
  const MudarTema({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ControladorTema>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Modo de Tema'),

        DropdownButton<ThemeMode>(
          value: controller.themeMode,
          items: const [
            DropdownMenuItem(
              value: ThemeMode.system,
              child: Text('Sistema'),
            ),
            DropdownMenuItem(
              value: ThemeMode.light,
              child: Text('Claro'),
            ),
            DropdownMenuItem(
              value: ThemeMode.dark,
              child: Text('Escuro'),
            ),
          ],
          onChanged: (mode) {
            if (mode != null) {
              controller.setThemeMode(mode);
            }
          },
        ),

        const SizedBox(height: 20),

        const Text('Tema / Marca'),

        DropdownButton<AppThemeType>(
          value: controller.themeType,
          items: const [
            DropdownMenuItem(
              value: AppThemeType.padrao,
              child: Text('Padrão'),
            ),
            DropdownMenuItem(
              value: AppThemeType.govBr,
              child: Text('Gov.br'),
            ),
            DropdownMenuItem(
              value: AppThemeType.suap,
              child: Text('SUAP'),
            ),
          ],
          onChanged: (type) {
            if (type != null) {
              controller.setThemeType(type);
            }
          },
        ),
      ],
    );
  }
}