import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          body: Column(
            // A COLUNA DEIXA TODOS OS CARDS ALINHADOS UM ENCIMA DO OUTRO.
            children: <Widget>[
              //CRIASE UM FILHO NA COLUNA PARA QUE ELA POSSA PERMANECER ATIVA
              Card(
                //EXISTEM DIVERSOS TIPOS DE COMPLEMENTOS NO CARD
                //PARA QUE O CARD SEJA ATIVO TEMOS QUE CRIAR UM CHILD.
                //DENTRO DEST CHILD PODEMOS UTILIZAR A PROPRIEDADE DESEJADA.
                child: ListTile(
                  leading: Icon(Icons.monetization_on),
                  title: Text(
                    "100,00",
                  ),
                  subtitle: Text('Conta: 2030.20.1'),
                ),
              ),
            ],
          ),
          appBar: AppBar(
            title: const Text('Transferência'),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
