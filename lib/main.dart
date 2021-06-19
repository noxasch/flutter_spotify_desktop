import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux))
  await DesktopWindow.setMinWindowSize(const Size(800, 600));
  runApp(ProviderScope(child: MyApp()));
}
