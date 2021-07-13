class Recibo {
  int id;
  String name;
  Recibo(this.id, this.name);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'name': name,
    };
    return map;
  }

  /*Recibo.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
  }*/

  Map<String, Recibo> personsMap = fromMap({"person1": {"id": 1, "name": "John Doe"}}, [() => Map<String, Recibo>(), [String, Recibo]]);
}