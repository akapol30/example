import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:json_annotation/json_annotation.dart';
part 'putdb.g.dart';

@JsonSerializable(explicitToJson: true)
class MyCard {
  String? username, name, password;
  List<dynamic>? pic;

  MyCard({
    required this.username,
    required this.name,
    required this.password,
    required this.pic,
  });

  factory MyCard.fromJson(Map<String, dynamic> json) => _$MyCardFromJson(json);

  Map<String, dynamic> toJson() => _$MyCardToJson(this);

  static List<MyCard> foodList = [];

  static Future<List<MyCard>> call() async {
    final foodRef =
        FirebaseFirestore.instance.collection('user').withConverter<MyCard>(
              fromFirestore: (snapshot, _) => MyCard.fromJson(snapshot.data()!),
              toFirestore: (myCard, _) => myCard.toJson(),
            );

    await foodRef.get().then((QuerySnapshot snapshot) => {
          if (foodList.length != snapshot.docs.length)
            {
              snapshot.docs.forEach((doc) {
                foodList.add(MyCard(
                    username: doc["Username"],
                    name: doc["Name"],
                    password: doc["password"],
                    pic: doc["pic"]));
              })
            }
        });

    return foodList;
  }
}
