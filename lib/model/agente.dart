class Agente {

  int _id;
  String _nome;
  String _email;
  int _idade;
  String _senha;
  String _foto;

  Agente(this._id, this._nome, this._email,
         this._idade, this._senha, this._foto);

  set id(int i){
    this._id = i;
  }
  int get id{
    return this._id;
  }

  String get foto{
    return this._foto;
  }

  String get nome{
    return this._nome;
  }
  String get email{
    return this._email;
  }

  int get idade{
    return this._idade;
  }
  String get senha{
    return this._senha;
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Agente {id: $id, nome: $nome, email: $email}';
  }

}