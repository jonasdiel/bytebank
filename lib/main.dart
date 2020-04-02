import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        body: ListaTransferencias(),
        appBar: AppBar(title: Text('Transferencias')),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
        ),
      ),
    ));

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ItemTransferencia(Transferencia(100, 321)),
        ItemTransferencia(Transferencia(200, 13213265))
      ],
    );
  }
}

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
    ));
  }
}

class Transferencia {
  final double valor;
  final int numeroconta;

  Transferencia(this.valor, this.numeroconta);
}
