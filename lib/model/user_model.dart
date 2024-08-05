import 'dart:convert';

class UserModel{

  String? name;
  String? email;
  double? price;
  String? place;

  String? password;
  String? phone;
  String? image;
  List? image2;
  String? description;
  String? Categories;
  int? age;

  UserModel({
    this.name,
    this.email,
    this.price,
    this.place,

    this.password,
    this.phone,
    this.image,
    this.image2,
    this.description,
    this.Categories,
    this.age

  });
  Map<String,dynamic> toMap (){
    return{
      "name": this.name,
      "email": this.email,
      "price":this.price,
      "place":this.place,

      "password": this.password,
      "phone": this.phone,
      "image": this.image,
      "image2": this.image2,
      "description": this.description,
      "categories": this.Categories,
      "age": this.age
    };
  }
  factory UserModel.fromMap(Map<String,dynamic>map){
    return UserModel(

      name: map["name"]??"",
        email: map["email"]??"",
        price: map["price"]??"",
        place: map["place"]??"",
        password: map["email"]??"",

        phone: map["phone"]??"",
        image: map["image"]??"",
        image2: map["image2"]??"",
        description: map["description"]??"",
      Categories: map["Categories"]??"",
      age: map["age"]??"",


    );
  }

  String toJson()=> json.encode(toMap());
  factory UserModel.fromJson(String source)=>UserModel.fromMap(jsonDecode(source));

  UserModel copyWith({

    String? name,
    String? email,
    double? price,
    String? place,

    String? password,
    String? phone,
    String? image,
    List? image2,
    String? descrption,
    String? Categories,
    int? age


  }){
    return UserModel(

      name: name ?? this.name,
        email: email ?? this.email,
      price: price ?? this.price,
      place: place ?? this.place,

      password: password ?? this.password,
      phone: phone ?? this.phone,
      image: image ?? this.image,
      image2: image2?? this.image2,
      description: description ?? this.description,
      Categories: Categories ?? this.Categories,
      age: age ?? this.age

    );
  }
}