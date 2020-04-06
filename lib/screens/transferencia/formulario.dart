import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const titulo_appbar = 'Criando Transferência';

const rotulo_numero = 'Numero da conta';
const dica_numero = '00000';
const rotulo_valor = 'Valor';
const dica_valor = '0.00';
const rotulo_condirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double valor = double.tryParse(_controladorCampoValor.text);

    if (numeroConta != null && valor != null) {
      final Transferencia transferencia = Transferencia(valor, numeroConta);
      //Metodo pop fecha a tela removendo da pilha e devolve o callback
      Navigator.pop(context, transferencia);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(titulo_appbar),
        ),
        body: SingleChildScrollView(
          //SingleChildScrollView permite a rolagem que o column nao possui
          child: Column(
            children: <Widget>[
              Editor(
                controlador: _controladorCampoNumeroConta,
                dica: dica_numero,
                rotulo: rotulo_numero,
              ),
              Editor(
                dica: dica_valor,
                controlador: _controladorCampoValor,
                rotulo: rotulo_valor,
                icone: Icons.monetization_on,
              ),
              RaisedButton(
                child: Text(rotulo_condirmar),
                onPressed: () => _criaTransferencia(context),
              ),
            ],
          ),
        ));
  }
}
