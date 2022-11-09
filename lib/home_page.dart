import 'package:expansion_panel_demo/state/tile_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final tileStates = [true, false];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final tileState = Provider.of<TileState>(context);
    //
    return ExpansionPanelList(
      expansionCallback: (i, isExpanded) => tileState.toggleTileState(index: i),
      children: [
        ExpansionPanel(
          canTapOnHeader: true,
          isExpanded: tileState.tileStateFor(index: 0),
          headerBuilder: (context, isOpen) {
            return ListTile(
              leading: Icon(isOpen
                  ? Icons.expand_less_outlined
                  : Icons.expand_more_outlined),
              title: Text(isOpen ? '1: I am open' : "1: I'm hiding"),
            );
          },
          body: const ListTile(
            title: Text('You can see me!'),
          ),
        ),
        ExpansionPanel(
          canTapOnHeader: true,
          isExpanded: tileState.tileStateFor(index: 1),
          headerBuilder: (context, isOpen) {
            return ListTile(
              leading: Icon(isOpen
                  ? Icons.expand_less_outlined
                  : Icons.expand_more_outlined),
              title: Text(isOpen ? '2: I am open' : "2: I'm hiding"),
            );
          },
          body: const ListTile(
            title: Text('You can see me!'),
          ),
        ),
      ],
    );
  }
}
