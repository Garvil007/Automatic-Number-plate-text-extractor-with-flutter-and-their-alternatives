import 'package:flutter/material.dart';

class AppState extends InheritedWidget {
  final String email;
  final String communityCode;
  final Function(String, String) updateLoginInfo;

  const AppState({
    Key? key,
    required this.email,
    required this.communityCode,
    required this.updateLoginInfo,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(AppState oldWidget) {
    return email != oldWidget.email || communityCode != oldWidget.communityCode;
  }

  static AppState of(BuildContext context) {
    final AppState? result = context.dependOnInheritedWidgetOfExactType<AppState>();
    assert(result != null, 'No AppState found in context');
    return result!;
  }
}
