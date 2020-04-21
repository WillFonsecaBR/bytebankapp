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
  final String valor;
  final String conta;

  Transferencia(
    this.valor,
    this.conta,
  );
}

class ItemTransferencia extends StatelessWidget {
  // Criando um objeto da classe trasferencia em uma variavel privada
  final Transferencia _transferencia;

  /*CONSTRUTOR = Passando os atributos da conta 
  transferência para a classe item transferência.*/  
  ItemTransferencia(this._transferencia)

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      /*EXISTEM DIVERSOS TIPOS DE COMPLEMENTOS NO CARD
      PARA QUE O CARD SEJA ATIVO TEMOS QUE CRIAR UM CHILD.
      DENTRO DEST CHILD PODEMOS UTILIZAR A PROPRIEDADE DESEJADA.*/
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor),
        subtitle: Text(_transferencia.conta),
      ),
    );
  }
}

class listaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      // A COLUNA DEIXA TODOS OS CARDS ALINHADOS UM ENCIMA DO OUTRO.
      children: <Widget>[
        //CRIASE UM FILHO NA COLUNA PARA QUE ELA POSSA PERMANECER ATIVA
        ItemTransferencia(Transferencia('100.00','10.203040')),
        ItemTransferencia(Transferencia('500.00','10.203040')),
        ItemTransferencia(Transferencia('600.00','10.203040')),
        ItemTransferencia(Transferencia('700.00','10.203040')),
      ],
    );
  }
}

