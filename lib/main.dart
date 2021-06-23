
import 'dart:io';

import 'package:codaula/database/paciente_dao.dart';
import 'package:codaula/model/agente.dart';
import 'package:codaula/model/paciente.dart';
import 'package:codaula/screens/android/appcovid.dart';
import 'package:flutter/material.dart';
import 'package:codaula/database/agente_dao.dart';

void main() {

  _geraPacientes(){

    Paciente p1 = Paciente(18, 'Jose', 'jose@teste', 'tx232', 66, 'teste223', '');
    Paciente p2 = Paciente(22, 'Paulo', 'paulo@teste', 'tx232', 56, 'teste223', '');
    Paciente p3 = Paciente(22, 'Paulo12', 'paulo@teste', 'tx232', 56, 'teste223', '');

    PacienteDAO.adicionar(p1);
    PacienteDAO.adicionar(p2);
    PacienteDAO.adicionar(p3);

  }

  _geraAgentes(){

    Agente a1 = Agente(1, 'Douglas', 'douglas@husm', 26, 'teste123', '');
    Agente a2 = Agente(2, 'Jose', 'jose@husm', 27, 'teste321', '');
    Agente a3 = Agente(1, 'Monica', 'monica@husm', 28, 'teste231', '');

    AgenteDAO.adicionar(a1);
    AgenteDAO.adicionar(a2);
    AgenteDAO.adicionar(a3);

  }

  if(Platform.isAndroid){
    debugPrint('app no android');
    _geraPacientes();
    _geraAgentes();
    runApp(AppCovid());
  }
  if(Platform.isIOS){
    debugPrint('app no IOS');
  }

  //runApp(MyApp());
}



