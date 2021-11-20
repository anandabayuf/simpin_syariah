class User{
  late int id;
  late String name;
  late String profileURL;
  late String email;
  late String nik;
  late String noTelp;
  late String password;

  User(this.id, this.name, this.profileURL, this.email, this.nik, this.noTelp,
      this.password);

  User.emptyConstructor();

  void setName(String newName){
    this.name = newName;
  }

  User getDummyUser(){
    return new User(0, "John Doe", "/assets/images/appbar/profilepict.png", "johndoe@email.com", "123549656",
        "0283868127", "12345678");
  }

}