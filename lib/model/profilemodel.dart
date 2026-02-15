class Profilemodel {
  final String? id;
  final String name;
  final String email;

  Profilemodel({required this.id, required this.name, required this.email});

  factory Profilemodel.fromJson(Map<String, dynamic> json) =>
      Profilemodel(id: json['_id'], name: json['name'], email: json['email']);
      Map<String, dynamic> toJson()=>{
        "name":name,
        "email":email,
      };
}
