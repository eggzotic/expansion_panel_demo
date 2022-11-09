import 'package:flutter/material.dart';

class TileState with ChangeNotifier {
  final int tileCount;
  final bool initialState;
  //
  final List<bool> _states = [];
  bool get allClosed => _states.every((s) => !s);
  //
  // Constructor
  TileState({
    required this.tileCount,
    this.initialState = true,
  }) {
    for (var i = 0; i < tileCount; i++) {
      _states.add(initialState);
    }
  }
  //
  // Modify state
  //  Individual entries
  void setTileState({required int index, required bool isOpen}) {
    _states[index] = isOpen;
    notifyListeners();
  }

  void toggleTileState({required int index}) {
    setTileState(index: index, isOpen: !_states[index]);
  }

  //
  //  All entries
  void setAll({required bool state}) {
    for (var i = 0; i < tileCount; i++) {
      _states[i] = state;
    }
    notifyListeners();
  }

  void collapseAll() => setAll(state: false);

  void expandAll() => setAll(state: true);

  void toggleAll() {
    allClosed ? expandAll() : collapseAll();
  }

  //
  // state getters
  bool tileStateFor({required int index}) => _states[index];
  //  the map generates a new list - preventing direct modification of _states
  List<bool> get allStates => _states.map((s) => s).toList();
}
