import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vin/models/wine.dart';

class DatabaseService {
  final CollectionReference wineCollection = Firestore.instance.collection('wines');

  List<Wine> _wineListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map( (doc) {
      return Wine(
        name: doc.data['name'] ?? '', 
        year: doc.data['year'] ?? '',
        winery: doc.data['winery'] ?? '',
        color: doc.data['color'] ?? ''
      );
    }).toList();
  }

  Stream<List<Wine>> get wines {
    return wineCollection.snapshots()
      .map(_wineListFromSnapshot);
  }
}

