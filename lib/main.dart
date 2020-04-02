import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FormularioTransferencia(),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {

  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                  labelText: 'Numero da conta', hintText: '0000'),
              style: TextStyle(fontSize: 24.0),
              keyboardType: TextInputType.number,
              controller: _controladorCampoNumeroConta,
            ),
          ), Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on),
                  labelText: 'Valor', hintText: '0000'),
              style: TextStyle(fontSize: 24.0),
              keyboardType: TextInputType.number,
              controller: _controladorCampoValor,
            ),
          ),
          RaisedButton(
            child: Text('Confirmar'),
            onPressed: () {
              final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
              final double valor = double.tryParse(_controladorCampoValor.text);

              if( numeroConta != null && valor != null ) {
                final Transferencia transferencia = Transferencia(valor, numeroConta);
                debugPrint(transferencia.toString());
              }

            },
          ),
        ],
      ),
      appBar: AppBar(title: Text('Criando transferencia')),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }
}

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ItemTransferencia(Transferencia(100, 321)),
        ItemTransferencia(Transferencia(200, 13213265)),
        ItemTransferencia(Transferencia(300.0, 3000))
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

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroconta}';
  }

}
