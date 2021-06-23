import 'package:codaula/model/agente.dart';
import 'package:codaula/model/paciente.dart';
import 'package:flutter/cupertino.dart';

class AgenteDAO {
  static final List<Agente> _agentes = List();

  static adicionar(Agente a) {
    _agentes.add(a);
  }

  static Agente getAgente(int index) {
    return _agentes.elementAt(index);
  }

  static void autalizarAgente(Agente a) {
    debugPrint('novo Agente ' + a.toString());
    debugPrint('lista antiga ${_agentes}');
    _agentes.replaceRange(a.id, a.id + 1, [a]);
    debugPrint('lista NOVA ${_agentes}');
  }

  static get listarAgentes {
    return _agentes;
  }
}
