import 'package:crud_mvvm_app/home_screen.dart';
import 'package:localstore/localstore.dart';

class SampleItemServices{
  Future loadItem() async{
    var db = Localstore.getInstance(useSupportDir: true);
    var mapItems = await db.collection('items').get();
    if(mapItems != null && mapItems.isNotEmpty){
      var items = List<SampleItem>.from(mapItems.entries.map((e) => SampleItem.fromMap(e.value)));
      return items;
    }
    return null;
  }

  Future addItem(SampleItem item) async{
    var db = Localstore.getInstance(useSupportDir: true);
    db.collection('items').doc(item.id).set(item.toMap());
  }

  Future removeItem(String id) async{
    var db = Localstore.getInstance(useSupportDir: true);
    db.collection('items').doc(id).delete();
  }

  updateItem(SampleItem item){
    var db = Localstore.getInstance(useSupportDir: true);
    db
        .collection('items').doc(item.id).set(item.toMap(), SetOptions(merge: true));
  }

}