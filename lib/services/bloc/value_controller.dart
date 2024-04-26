import 'dart:async';

import 'package:flutter/material.dart';

class DValueController<T> {
  final StreamController<T> _streamController = StreamController.broadcast();

  DValueController(T value) {
    _value = value;
  }

  T get value => _value;

  Stream<T> get streamValue => _streamController.stream;

  late T _value;

  set value(T newValue) {
    if (!_streamController.isClosed) {
      _streamController.add(newValue);
      _value = newValue;
    }
  }

  void dispose() {
    _streamController.close();
  }
}

typedef DBuilder<T> = Widget Function(BuildContext context, T value);

class DValueBuilder<T> extends StatelessWidget {
  final DValueController<T> controller;
  final DBuilder<T> builder;

  const DValueBuilder({
    Key? key,
    required this.controller,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      stream: controller.streamValue,
      initialData: controller.value,
      builder: (context, snapshot) {
        return builder(context, snapshot.data as T);
      },
    );
  }
}
