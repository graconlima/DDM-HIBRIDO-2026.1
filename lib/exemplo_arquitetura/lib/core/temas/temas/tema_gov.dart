import 'package:ddm_20261/exemplo_arquitetura/lib/core/temas/tokens/token_cores.dart';
import 'package:flutter/material.dart';

ThemeData govBrLight = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.green,
    brightness: Brightness.light,
  ),
);

ThemeData govBrDark = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.green,
    brightness: Brightness.dark,
  ),
);