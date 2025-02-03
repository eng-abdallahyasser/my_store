import 'package:my_store/firebase/firebase_massaging.dart';
import 'package:my_store/firebase/firestore_services.dart';

class AdminServices {
  final MyMassaging _massaging = MyMassaging();
  final FirestoreServices  _firestoreServices = FirestoreServices();

  Future<void> saveThisDevice() async{
    String? token = await _massaging.getToken();
    if(token != null){
      await _firestoreServices.addAdminToken(token);
      }
  }
}
