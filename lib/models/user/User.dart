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

  void setProfileURL(String profileURL){
    this.profileURL = profileURL;
  }

  User getDummyUser(){
    return new User(0, "John Doe", "", "johndoe@email.com", "3273161209000001",
        "82112341234", "12345678");
  }

}