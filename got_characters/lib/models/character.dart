/*class CharacterOLD {
  int? id;
  String? fullName; 
  String? img; //String? img;
  String? nickName;
  String? family;
  String? title;
}*/

class Character {
  int? id;
  String? fullName;
  String? img;
  String? nickName;
  String? family;
  String? title;
  
  Character({this.id, this.fullName, this.img, this.nickName, this.family, this.title});
 
  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id : json['id'],
      fullName : json['fullName'],
      img : json['imageUrl'],
      nickName : json['nickName'],
      family : json['family'],
      title : json['title'],
    );
  }

/*   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullName'] = fullName;
    data['img'] = img;
    data['nickName'] = nickName;
    data['family'] = family;
    data['title'] = title;
    return data;
  }*/
  } 