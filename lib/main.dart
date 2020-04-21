import 'package:bytebank/tranferencia.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          body: listaTransferencias(),
          appBar: AppBar(
            title: const Text('Transferência'),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
