import 'dart:io';
import 'package:codaula/database/agente_dao.dart';
import 'package:codaula/model/agente.dart';
import 'package:codaula/screens/android/agente/agente_add.dart';
import 'package:codaula/screens/android/paciente/paciente_add.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:random_color/random_color.dart';

class AgenteList extends StatefulWidget {
  @override
  _AgenteListState createState() => _AgenteListState();
}

class _AgenteListState extends State<AgenteList> {
  @override
  Widget build(BuildContext context) {
    List<Agente> _agentes = AgenteDAO.listarAgentes;

    return Scaffold(
      appBar: AppBar(
        title: Text('AGENTES'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            //color: Colors.red,
            child: TextField(
              style: TextStyle(fontSize: 25),
              decoration: InputDecoration(
                labelText: "Pesquisar",
                hintText: "Pesquisar",
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: Container(
              // color: Colors.green,
              child: ListView.builder(
                  itemCount: _agentes.length,
                  itemBuilder: (context, index) {
                    final Agente a = _agentes[index];
                    return ItemAgente(a, onClick: (){
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context)=> AgenteScrean(index: index))
                      ).then((value) {
                        setState(() {
                          debugPrint('... voltou do editar');
                        });
                      });
                    },);
                  }),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {

            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PacienteScrean()
            )).then((value) {

              setState(() {
                debugPrint(' retornou do add agentes ');
              });

            });

          },
          child: Icon(Icons.add)),
    );
  }
}

class ItemAgente extends StatelessWidget {
  final Agente _agente;
  final Function onClick;

  ItemAgente(this._agente, {@required this.onClick});

  Widget _avatarAntigo(){
    return CircleAvatar(
      backgroundImage: AssetImage('imagens/avatar.jpeg'),
    );
  }

  Widget _avatarFotoPerfil(){

    RandomColor corRandomica = RandomColor();
    Color cor = corRandomica.randomColor(
        colorBrightness: ColorBrightness.light
    );

    var iniciaNome = this._agente.nome[0].toUpperCase();
    if(this._agente.foto.length> 0){
      iniciaNome = '';
    }

    return CircleAvatar(
      backgroundColor: cor,
      foregroundColor: Colors.white,
      backgroundImage: FileImage(File(this._agente.foto)),
      radius: 22.0,
      child: Text(iniciaNome,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.0
        ),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          onTap: () => this.onClick(),
          leading: _avatarFotoPerfil(),
          title: Text(
            this._agente.nome,
            style: TextStyle(fontSize: 24),
          ),
          subtitle: Text(
            this._agente.email,
            style: TextStyle(fontSize: 12),
          ),
          trailing: _menu(),
        ),
        Divider(
          color: Colors.green,
          indent: 70.0,
          endIndent: 20,
          thickness: 1.0,
          height: 0.0,
        )
      ],
    );
  }

  Widget _menu() {
    return PopupMenuButton(
      onSelected: (ItensMenuListAgente selecionado) {
        debugPrint('selecionado ... $selecionado');
      },
      itemBuilder: (BuildContext context) =>
      <PopupMenuItem<ItensMenuListAgente>>[
        const PopupMenuItem(
          value: ItensMenuListAgente.resultados,
          child: Text('Resultados'),
        ),
        const PopupMenuItem(
          value: ItensMenuListAgente.novo_checklist,
          child: Text('Novo Checklist'),
        )
      ],
    );
  }
}

enum ItensMenuListAgente { resultados, novo_checklist }
