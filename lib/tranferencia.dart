import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*Na função de transferencia iremos trabalhar com as classes StatefulWidget
e StatelessWidget que herdan de Widget, mas têm o comportamento 
de encapsular códigos de Widgets já prontos. A diferença entre 
elas é que StatefulWidget tem a capacidade de modificar 
o conteúdo do widget de maneira dinâmica a partir de alguns 
eventos que acontecem no aplicativo, enquanto o StatelessWidget 
não permite esse tipo de modificação.*/

class Transferencia {
  final double valor;
  final int conta;
  Transferencia(
    this.valor,
    this.conta,
  );

  @override
  String toString() {
    return 'Transferencia{valor: $valor, Conta: $conta}';
  }
}

class ItemTransferencia extends StatelessWidget {
  //! Criando um objeto da classe trasferencia em uma variavel privada
  final Transferencia _transferencia;

  /**
   *! CONSTRUTOR => Passando os atributos da conta 
   *! transferência para a classe item transferência.
  **/
  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      /**
       *? EXISTEM DIVERSOS TIPOS DE COMPLEMENTOS NO CARD
       *? PARA QUE O CARD SEJA ATIVO TEMOS QUE CRIAR UM CHILD.
       *? ENTRO DEST CHILD PODEMOS UTILIZAR A PROPRIEDADE DESEJADA.
      **/
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.conta.toString()),
      ),
    );
  }
}

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferência'),
      ),
      body: Column(
        //! A COLUNA DEIXA TODOS OS CARDS ALINHADOS UM ENCIMA DO OUTRO.
        children: <Widget>[
          //! CRIASE UM FILHO NA COLUNA PARA QUE ELA POSSA PERMANECER ATIVA
          ItemTransferencia(Transferencia(100.00, 203040)),
          ItemTransferencia(Transferencia(500.00, 203050)),
          ItemTransferencia(Transferencia(500.00, 203060)),
          ItemTransferencia(Transferencia(500.00, 203070))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  @override
  /**
   *! CONTROLADOR DE TEXTO ==> TextEditingController 
   *! PARA COLHER AS INFORMAÇÕES DO TEXTFILDS.
   **/
  final TextEditingController _controladorConta = TextEditingController();
  final TextEditingController _controladorValor = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferencias'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              //! ESTILO DO TEXTO
              style: TextStyle(
                fontSize: 24.0,
              ),
              //! O CONTROLER CAPTURA O TEXTO DO TEXTFIELD
              controller: _controladorConta,
              //! DECORAÇÃO DO TIPO DE IMPUT
              decoration: InputDecoration(
                labelText: 'Numero da Conta:',
                hintText: '00.0000',
              ),
              //! TIPO DE TECLADO.
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              //! ESTILO DO TEXTO
              style: TextStyle(
                fontSize: 24.0,
              ),
              //! O CONTROLER CAPTURA O TEXTO DO TEXTFIELD
              controller: _controladorValor,
              //! DECORAÇÃO DO TIPO DE IMPUT
              decoration: InputDecoration(
                  labelText: 'Valor:',
                  hintText: '00,00',
                  icon: Icon(
                    //! INSERINDO ICONE DE MONETIZAÇÃO DENTRO DO TEXTFIELD
                    Icons.monetization_on,
                  )),
              //! TIPO DE TECLADO.
              keyboardType: TextInputType.number,
            ),
          ),
          RaisedButton(
            child: Text('Confirmar'),
            onPressed: () {
              //! MOSTRA UM PRINT NO DEBUG AO CLICAR NO BOTÃO.
              // debugPrint('Clicou em confirmar');

              //! COLHE AS INFORMAÇÕES INSERIDAS NOS TEXTFILDS
              final int numeroConta = int.tryParse(_controladorConta.text);
              final double valor = double.tryParse(_controladorValor.text);

              //! INSERINDO OS VALORES NA CLASSE TRANSFERENCIA
              if (numeroConta != null && valor != null) {
                final transferenciaCriada = Transferencia(valor, numeroConta);
                debugPrint('$transferenciaCriada');
              } else {
                debugPrint('NÃO FOI POSSIVEL REALIZAR A TRANSFERENCIA');
              }
            },
          ),
        ],
      ),
    );
  }
}
