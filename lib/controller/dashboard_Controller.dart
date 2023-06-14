import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

// import 'package:url_launcher/url_launcher.dart';

class DashBoardController extends GetxController {
// map function
  void openMaps(document) async {
    // String address =
    //     requestList[index].fullAddress; // Replace with your desired address
    // log(address);

    // with lan and lon
    var latitude = document["lan"];
    var longitude = document["lon"];

    // String googleMapsUrl =
    //     'https://www.google.com/maps/search/?api=AIzaSyAmwDgWrDHHGyTX1Flb0JmUbyWdnOUL-kw&query=$address';
    // String encodedAddress = Uri.encodeComponent(address);
    // String googleMapsUrl =
    //     'https://www.google.com/maps/search/?api=1&query=$encodedAddress';
    String googleMapsUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not open Google Maps';
    }
  }

  Expanded feedbackScreenMethod(BuildContext context) {
    return Expanded(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(28.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Feedback",
                  style: TextStyle(fontSize: 30),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.82,
              height: 2,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 10, 0, 20),
            child: Row(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.21,
                    child: const Text(
                      "Name",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                    width: MediaQuery.of(context).size.width * .55,
                    child: const Text(
                      "Feed Back",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.82,
              height: 2,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .54,
            width: MediaQuery.of(context).size.width * 0.82,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("UserFeedback")
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView(
                    children: snapshot.data!.docs.map((document) {
                      return ListTile(
                        // title: Text(requestList[index].name),
                        title: Container(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(40, 10, 0, 20),
                            child: Row(
                              children: [
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                            radius: 15,
                                            foregroundImage: NetworkImage(
                                                document["dpurl"])),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(document["name"]),
                                      ],
                                    )),
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: Text(document["feedback"])),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                }),
          ),
        ],
      ),
    );
  }

  // info screen

  Widget infoMethod(
    BuildContext context,
    List<String> dropdownOptions,
    String? selectedOption,
  ) {
    return Expanded(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(28.0),
            child: Row(
              children: [
                Text(
                  "User Information",
                  style: TextStyle(fontSize: 30),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.82,
              height: 2,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 10, 0, 20),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: Text(
                      "Name",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: Text(
                      "Phone",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: const Text(
                      "Cnic",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: const Text(
                      "Status",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: const Text(
                      "Photo",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.14,
                    child: const Text(
                      "Location",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.13,
                    child: const Text(
                      "date",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.82,
              height: 2,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 10, 0, 20),
            child: Row(
              children: [
                //expande list view

                Container(
                  height: MediaQuery.of(context).size.height * .54,
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("EmergencyRequest")
                          .orderBy("date", descending: true)
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                              snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return ListView(
                          children: snapshot.data!.docs.map((document) {
                            final date = document["date"];
                            final formateDate = DateFormat("yyyy-MM-dd HH:mm")
                                .format(DateTime.parse(date));
                            return ListTile(
                              // title: Text(requestList[index].name),
                              title: Container(
                                child: Row(
                                  children: [
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        child: Row(
                                          children: [
                                            CircleAvatar(
                                                radius: 15,
                                                foregroundImage: NetworkImage(
                                                    document["dpurl"])),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(document["name"],
                                                style: TextStyle(fontSize: 13)),
                                          ],
                                        )),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        child: Text(
                                          document["number"],
                                          style: TextStyle(fontSize: 13),
                                        )),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1,
                                        child: Text(
                                          document["cnic"],
                                          style: TextStyle(fontSize: 13),
                                        )),

                                    // dropdown menu here
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.08,
                                      child: DropdownButtonFormField(
                                        value: selectedOption,
                                        style: TextStyle(fontSize: 13),
                                        items: dropdownOptions
                                            .map((String option) {
                                          return DropdownMenuItem(
                                            value: option,
                                            child: Text(option),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          print(document.id);

                                          FirebaseFirestore.instance
                                              .collection("EmergencyRequest")
                                              .doc(document.id)
                                              .update({"Status": newValue});
                                          // setState(() {
                                          //   selectedOption = newValue;
                                          // });
                                          // EmergencyController()
                                          // .updateEmergencyRequest(
                                          //     selectedOption!);
                                        },
                                        decoration: InputDecoration(
                                          labelText: (document["Status"]),
                                          labelStyle:
                                              const TextStyle(fontSize: 13),
                                          border: const OutlineInputBorder(),
                                        ),
                                      ),
                                    ),

                                    // const SizedBox(
                                    //     width: 100,
                                    //     child: Text("Pending")),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 30),
                                      child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.1,
                                          child: GestureDetector(
                                            onTap: () {
                                              launchUrl(Uri.parse(
                                                document["emergencyurl"],
                                              ));
                                            },
                                            child: const Text(
                                              "OPEN Photo",
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontSize: 13,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                          )),
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.12,
                                        child: GestureDetector(
                                            onTap: () {
                                              openMaps(document);
                                            },
                                            child: const Text(
                                              "Open Location",
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 13,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            ))),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.13,
                                        child: Text(
                                          // document["date"],
                                          formateDate,
                                          style: TextStyle(fontSize: 13),
                                        )),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
