class Transferencia {
  final double valor;
  final int numeroconta;

  Transferencia(this.valor, this.numeroconta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroconta}';
  }
}
