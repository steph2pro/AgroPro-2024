import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'event_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/images/logo.svg",
            color: Colors.blue,
          ),
          const Text("AgroPro 2024",
            style: TextStyle(
              fontSize: 42,
              fontFamily: 'Poppins',
            ),
          ),
          const Text("Aide virtuel pour les Agriculteurs",
            style: TextStyle(
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          //Image.asset("assets/images/pasteque.png"),
          Padding(padding: EdgeInsets.only(top: 20)),
          // ElevatedButton.icon(
          //   style: ButtonStyle(
          //       padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
          //       backgroundColor: MaterialStatePropertyAll(Colors.green)
          //   ),
          //   onPressed: () {
          //     Navigator.push(
          //         context,
          //         PageRouteBuilder(pageBuilder: (_, __, ___)=>EventPage()
          //         )
          //     );
          //   },
          //   label: const Text("Afficher les variete",
          //     style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 20
          //     ),
          //   ),
          //   icon: Icon(Icons.calendar_month,
          //     color: Colors.white,
          //   ),
          // ),
        ],
      ),
    );
  }
}
