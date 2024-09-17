class User {
  String? id;
  String? name;
  String? surname;
  String? phoneNumber;
  String? email;
  String? password;
  String? role;
  String? status;
  String? token;

  User({
    this.id,
    this.email,
    this.password,
    this.phoneNumber,
    this.name,
    this.surname,
    this.role,
    this.status,
    this.token
  });

  String fullName () {
    return "${name ?? ''} ${surname ?? ''}";
  }

  factory User.fromJson( json) {
    return User(
        id: json['id'],
        name: json['name'],
        surname: json['surname'],
        email: json['email'],
        phoneNumber: json['phone_number'],
        password: json['password'],
        role: json['roleId'],
        status: json['status'],
      token:  json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstname': name,
      'lastname': surname,
      'email': email,
      'phone': phoneNumber,
      'password': password,
    };
  }

  static const EMPLOYER_ROLE =  'employer';
  static const ADMIN_ROLE =  'admin';
}
