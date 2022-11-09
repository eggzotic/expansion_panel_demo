import 'package:expansion_panel_demo/home_page.dart';
import 'package:expansion_panel_demo/state/tile_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TileState(tileCount: 2),
      builder: (context, widget) => const ExpansionPanelDemo(),
    ),
  );
}

class ExpansionPanelDemo extends StatelessWidget {
  const ExpansionPanelDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final tileState = Provider.of<TileState>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Expansion Panels'),
          actions: [
            TextButton(
              onPressed: () => tileState.toggleAll(),
              child: Text(
                tileState.allClosed ? 'Expand All' : 'Collapse All',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        body: ListView(
          children: const [HomePage()],
        ),
      ),
    );
  }
}
