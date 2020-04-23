import 'package:bytebank/tranferencia.dart';
import 'package:flutter/material.dart';

class FormularioTransferencia extends StatelessWidget {
  /**
  *! CONTROLADOR DE TEXTO ==> TextEditingController
  *! PARA COLHER AS INFORMAÇÕES DO TEXTFILDS.
  **/

  final TextEditingController _controladorConta = TextEditingController();
  final TextEditingController _controladorValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferência'),
      ),
      body: Column(
        children: <Widget>[
          Editor(
            controlador: _controladorConta,
            rotulo: 'Numero da conta',
            dica: '0000',
          ),
          Editor(
            controlador: _controladorValor,
            rotulo: 'Valor',
            dica: '0.00',
            icone: Icons.monetization_on,
          ),
          RaisedButton(
            child: Text('Confirmar'),
            onPressed: () => _criaTransferencia(context),
          ),
        ],
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    //! MOSTRA UM PRINT NO DEBUG AO CLICAR NO BOTÃO.
    // debugPrint('Clicou em confirmar');

    //! COLHE AS INFORMAÇÕES INSERIDAS NOS TEXTFILDS
    final int numeroConta = int.tryParse(_controladorConta.text);
    final double valor = double.tryParse(_controladorValor.text);

    //! INSERINDO OS VALORES NA CLASSE TRANSFERENCIA
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint('Criando transferência');
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;

  //! CONSTRUTOR DA CLASSE
  const Editor({
    this.controlador,
    this.rotulo,
    this.dica,
    this.icone,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        //! ESTILO DO TEXTO
        style: TextStyle(
          fontSize: 24.0,
        ),
        //! O CONTROLER CAPTURA O TEXTO DO TEXTFIELD
        controller: controlador,
        //! DECORAÇÃO DO TIPO DE IMPUT
        decoration: InputDecoration(
          labelText: rotulo,
          hintText: dica,
        ),
        //! TIPO DE TECLADO.
        keyboardType: TextInputType.number,
      ),
    );
  }
}
