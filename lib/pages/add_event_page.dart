import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  final _formkey=GlobalKey<FormState>();
  final varNameController=TextEditingController();
  final formeNameController=TextEditingController();
  final varDureController=TextEditingController();
  String selectedColor='vert';
  DateTime selectedDate=DateTime.now();
  @override
  void dispose() {
    super.dispose();
    varNameController.dispose();
    formeNameController.dispose();
    varDureController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.all(20),
      child: Form(
        key: _formkey,
        child: Column(
          children:[
            Container(
              margin: EdgeInsets.only(bottom:12),
              child: TextFormField(
                decoration:const InputDecoration(
                  labelText:"nom de la variete de pasteque",
                  hintText: "entrez le nom de la variete de pasteque",
                  border:OutlineInputBorder(),
                ),
                  validator:(value){
                    if(value==null || value.isEmpty){
                      return 'veillez remplir ce champ';
                    }else {
                      return null;
                    }
                  },
                 controller: varNameController,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom:12),
              child: TextFormField(
                decoration:const InputDecoration(
                  labelText:"forme de la variete de pasteque",
                  hintText: "entrez la forme de la variete de pasteque",
                  border:OutlineInputBorder(),
                ),
                validator:(value){
                  if(value==null || value.isEmpty){
                    return 'veillez remplir ce champ';
                  }else {
                    return null;
                  }
                },
                controller: formeNameController,
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom:12),
              child: TextFormField(
                decoration:const InputDecoration(
                  labelText:"duree de la variete de pasteque",
                  hintText: "entrez la duree de la variete de pasteque",
                  border:OutlineInputBorder(),
                ),
                validator:(value){
                  if(value==null || value.isEmpty){
                    return 'veillez remplir ce champ';
                  }else {
                    return null;
                  }
                },
                controller: varDureController,
              ),
            ),
            //liste de selection
            Container(
              margin: EdgeInsets.only(bottom:10),
              child: DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder()
                ),
                  items:const [
                    DropdownMenuItem(value:"vert",child: Text("Écorce vert foncé")),
                    DropdownMenuItem(value:"jaunatre",child: Text("Écorce vert pâle")),
                    DropdownMenuItem(value:"noir",child: Text("Écorce vert tandant ver le noir")),
                  ],
                  value: selectedColor,
                  onChanged: (value){
                  setState(() {
                    selectedColor=value!;
                  });
                  }
              ),
            ),
            Container(
              margin:EdgeInsets.only(bottom: 12),
              child: DateTimeFormField(
                decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.black45),
                  errorStyle: TextStyle(color: Colors.redAccent),
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.event_note),
                  labelText: ' Choisir unr date',
                ),
                mode: DateTimeFieldPickerMode.dateAndTime,
                autovalidateMode: AutovalidateMode.always,
                validator: (e) => (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                onDateSelected: (DateTime value) {
                  setState(() {
                    selectedDate=value;
                  });
                },
              ),
            ),
            SizedBox(
              width:double.infinity,
              height:50,
              child: ElevatedButton(
                  style:ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    //onPrimary: Colors.white,
                    textStyle: TextStyle(
                      fontSize: 20
                    )
                  ),
                  onPressed: (){
                    if(_formkey.currentState!.validate()){
                      //recuperation du contnue des champs grace au controller
                      final varName= varNameController.text;
                      final formeName=formeNameController.text;
                      final varDure=varDureController.text;
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("en cour d'envoie ..."))
                      );
                      //pour fermer le clavier apres soumition
                      FocusScope.of(context).requestFocus(FocusNode());
                      // print("ajout de la variete $varName avec la forme $formeName");
                      // print('couleur de la variete $selectedColor');
                      // print('la date est $selectedDate');
                      //ajout dans la base de donnee (collection)
                      //recupation de la collection
                     CollectionReference varieteRef = FirebaseFirestore.instance.collection("Varietes");
                     varieteRef.add({
                       "nom":varName,
                       "forme":formeName,
                       "couleur":selectedColor,
                       "date":selectedDate,
                       "duree":varDure,
                       "photo":"pasteque"
                     });
                    }
                  },
                  child:const Text('Enregistrer'),

              ),
            )
          ]
        )
      ),
    );
  }
}

