import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemTransferencia extends StatelessWidget {
  final Transferencia transferencia;

  ItemTransferencia(this.transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(transferencia.valor.toString()),
        subtitle: Text(transferencia.numeroconta.toString()),
      ),
    );
  }
}
