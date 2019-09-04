import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:douban_movie/app.dart';

import 'blocs/simple_bloc_delegate.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(DoubanApp());
}
