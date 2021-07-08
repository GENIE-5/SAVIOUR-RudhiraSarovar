class OurUser{

 String uid;
String username;
int age;
String phoneNumber;
String pincode;
String profilePicUrl;


OurUser({ required this.uid, required this.username, required this.age, required this.phoneNumber,required this.pincode,required this.profilePicUrl});

Map toJson() =>{

  "uid":this.uid,
  "username":this.username,
  "age":this.age,
  "phoneNumber":this.phoneNumber,
  "pincode":this.pincode

};


}