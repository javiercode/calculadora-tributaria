final String tableRecibos = 'recibos';

class ReciboFields {
  static final List<String> values = [
    /// Add all fields
    id, isImportant, number, title, description, time
  ];

  static final String id = '_id';
  static final String isImportant = 'isImportant';
  static final String number = 'number';
  static final String title = 'title';
  static final String description = 'description';
  static final String time = 'time';
}

class Recibo {
  final int? id;
  final bool isImportant;
  final int number;
  final String title;
  final String description;
  final DateTime createdTime;

  const Recibo({
    this.id,
    required this.isImportant,
    required this.number,
    required this.title,
    required this.description,
    required this.createdTime,
  });

  Recibo copy({
    int? id,
    bool? isImportant,
    int? number,
    String? title,
    String? description,
    DateTime? createdTime,
  }) =>
      Recibo(
        id: id ?? this.id,
        isImportant: isImportant ?? this.isImportant,
        number: number ?? this.number,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
      );

  static Recibo fromJson(Map<String, Object?> json) => Recibo(
    id: json[ReciboFields.id] as int?,
    isImportant: json[ReciboFields.isImportant] == 1,
    number: json[ReciboFields.number] as int,
    title: json[ReciboFields.title] as String,
    description: json[ReciboFields.description] as String,
    createdTime: DateTime.parse(json[ReciboFields.time] as String),
  );

  Map<String, Object?> toJson() => {
    ReciboFields.id: id,
    ReciboFields.title: title,
    ReciboFields.isImportant: isImportant ? 1 : 0,
    ReciboFields.number: number,
    ReciboFields.description: description,
    ReciboFields.time: createdTime.toIso8601String(),
  };
}