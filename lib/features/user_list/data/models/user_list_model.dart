class UserListModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String website;
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  UserListModel({
   required this.city,
   required this.email,
   required this.id,
   required this.name,
   required this.phone,
   required this.street,
   required this.suite,
   required this.website,
   required this.zipcode,
});
  factory UserListModel.fromJson(Map<String,dynamic> json){

    final address = json['address'] ?? {};

    return UserListModel(
        city: address["city"]??'',
        email: json["email"]??'',
        id: json['id']??0,
        name: json['name']??"",
        phone: json['phone']??'',
        street: address['street']??"",
        suite: address['suite']??"",
        website: json['website']??'',
        zipcode: address['zipcode']??''
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
    };
  }

}