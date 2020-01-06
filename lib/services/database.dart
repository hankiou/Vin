import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vin/models/comment.dart';
import 'package:vin/models/wine.dart';

class DatabaseService {
  final CollectionReference wineCollection = Firestore.instance.collection('wines');
  final CollectionReference userCollection = Firestore.instance.collection('users');

  List<Wine> _wineListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map( (doc) {
      return Wine(
        uid: doc.documentID,
        name: doc.data['name'] ?? '', 
        year: doc.data['year'] ?? '',
        winery: doc.data['winery'] ?? '',
        color: doc.data['color'] ?? '',
        description: doc.data['description'] ?? '',
      );
    }).toList();
  }

  Stream<List<Comment>> commentListforWine(String wine_id){
    return Firestore.instance.collection('comments').where('wine_id', isEqualTo: wine_id)
      .snapshots().map(_commentListFromSnapshot);
  }

  List<Comment> _commentListFromSnapshot(QuerySnapshot snapshot){
    
    return snapshot.documents.map( (doc) {
      return Comment(
        grade: double.parse(doc['grade']),
        wine_id: doc['wine_id'],
        user_id: doc['user_id'],
        statement: doc['statement']
      );
    }).toList();
  }

  Stream<List<Wine>> get wines {
    return wineCollection.snapshots()
      .map(_wineListFromSnapshot);
  }

  void registerUser(String user_id, String nickname) {
    userCollection.add({
      'user_id': user_id,
      'nickname': nickname
    });
  }

  String getNickname(String user_id){
    
  }

 List<String> _nicknames(QuerySnapshot snapshot){
    return snapshot.documents.map((doc) {
      return doc['nickname'];
    }).toList();
  }
}

