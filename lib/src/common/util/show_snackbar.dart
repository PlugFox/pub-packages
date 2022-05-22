import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void showSnackBar(SnackBar snackBar) => GetIt.instance<GlobalKey<ScaffoldMessengerState>>().currentState
  ?..clearSnackBars()
  ..showSnackBar(snackBar);
