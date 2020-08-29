import 'dart:async';

import 'package:PassManager/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final LocalAuthentication auth = LocalAuthentication();
  List<BiometricType> _availableBiometrics;

  Future<bool> _checkBiometrics() async {
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return false;

    return canCheckBiometrics;
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

  Future<bool> _authenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: 'Scan your fingerprint to authenticate',
          useErrorDialogs: true,
          stickyAuth: true);
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return false;

    return authenticated;
  }

  void _cancelAuthentication() {
    auth.stopAuthentication();
  }

  void initState() {
    super.initState();
    _checkBiometrics().then((value) => _authenticate().then((value) =>
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Tryst')),
    );
  }
}
