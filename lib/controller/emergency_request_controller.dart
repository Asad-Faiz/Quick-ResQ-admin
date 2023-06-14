// import 'dart:developer';

// import 'package:adminpannel/model/EmergencyRequestModel.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';

// class EmergencyController extends GetxController {
//   ShowEmergencyRequests() async {
//     QuerySnapshot<Map<String, dynamic>> documentSnapshot =
//         await FirebaseFirestore.instance.collection("EmergencyRequest").get();
//     // log(documentSnapshot.docs[0].data().toString());
//     List<EmergencyRequestModel> requests = [];
//     documentSnapshot.docs.forEach((element) {
//       // print(element.data()!["longitude"].runtimeType);
//       requests.add(EmergencyRequestModel.fromMap(
//           element.data() as Map<String, dynamic>));
//     });
//     return requests;
//   }

//   // function
//   updateEmergencyRequest(String selectedValue) async {
//     DocumentSnapshot sourceSnapshot = await FirebaseFirestore.instance
//         // .collection('users').doc(FirebaseAuth.instance.currentUser)
//         .collection('EmergencyRequest')
//         .doc()
//         .get();
//     if (sourceSnapshot.exists) {
//       Map<String, dynamic> userData =
//           sourceSnapshot.data() as Map<String, dynamic>;
//       // userData['latitude'] = latitude;
//       // userData['longitude'] = longitude;
//       // userData['EmergencyPhoto'] = downloadurl;

//       // emergency model
//       final emergencyRequest = EmergencyRequestModel(
//           lan: latitude,
//           lon: longitude,
//           fullAddress: fullAddress,
//           emergencyurl: downloadurl,
//           dpurl: userData['imageurl'],
//           number: number,
//           name: userData['name'],
//           cnic: userData['cnic'],
//           date: DateTime.now().toString(),
//           EmergencyType: emergencyType,
//           Status: "pending");

//       final res = await FirebaseFirestore.instance
//           .collection("EmergencyRequest")
//           // .doc(FirebaseAuth.instance.currentUser!.phoneNumber)
//           .add(emergencyRequest.toMap())
//           .then(
//         (value) async {
//           showAlertDialog(context);
//           // final Uri url = Uri(
//           //   scheme: 'tel',
//           //   path: '1122',
//           // );
//           // if (await canLaunchUrl(url)) {
//           //   await launchUrl(url);
//           // } else {
//           //   log("cannot open url");
//           // }
//         },
//       );
//       // log(emergencyRequest.toString());
//       // log(res.);
//       // if (res. != null) {}
//     }
//   }
// }
