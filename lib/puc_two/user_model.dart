
class User{
  final String name;
  final String email;
  final int phone;

  User({required this.name, required this.email, required this.phone});

  Map<String,dynamic> toMap() => {"name":this.name, "email": this.email, "phone": this.phone};
}


