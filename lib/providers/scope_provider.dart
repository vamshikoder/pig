import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/models/scope/scope.dart';

class ScopeNotifier extends StateNotifier<List<Scope>> {
  ScopeNotifier() : super([]);
  void setScope() {
    state = [];
  }
}

final scopeStateProvider = StateNotifierProvider<ScopeNotifier>((ref) {
  return ScopeNotifier();
});
