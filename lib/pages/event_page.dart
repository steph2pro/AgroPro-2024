
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {


  @override
  Widget build(BuildContext context) {
    return Center(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Varietes").where("date").snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator();
            }
            //verification si la list est vide
            if(!snapshot.hasData){
              return Text("aucune variete pour le moment");
            }
            List<dynamic> events=[];
            snapshot.data!.docs.forEach((element) {
              events.add(element);
            });
            return ListView.builder(
              itemCount: events.length,
              itemBuilder:(context,index){
                final event=events[index];
                final photo=event["photo"].toString().toLowerCase();
                final duree =event["duree"];
                final Timestamp timestamp =event["date"];
                final String date=DateFormat.yMd().add_jm().format(timestamp.toDate());
                final nom=event["nom"];
                final couleur=event["couleur"];
                return Card(
                    child: ListTile(
                      leading: Image.asset("assets/images/$photo.png"),
                      title: Text('$nom ($duree)'),
                      subtitle: Text('$couleur $date '),
                      trailing: const Icon(Icons.more_vert),
                    )
                );
              } ,
            );

          },
        ),
    );
  }
}
