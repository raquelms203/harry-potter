import 'package:flutter/material.dart';
import 'package:harry_potter/model/character.dart';
import 'package:harry_potter/util/functions.dart';
import 'package:harry_potter/view/character_details.dart';
import "../service/character_service.dart";

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CharacterService service = CharacterService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personagens"),
        backgroundColor: Colors.blue[800],
      ),
      body: SingleChildScrollView(
          child: FutureBuilder<List<Character>>(
        future: service.fetchCharacters(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
                children: snapshot.data
                    .map((item) => Container(
                          margin:
                              const EdgeInsets.only(left: 8, right: 8, top: 8),
                          child: GestureDetector(
                            child: Card(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 8.0, bottom: 8),
                                child: ListTile(
                                  title: Text(item.name),
                                  leading: Container(
                                    height: 60,
                                    width: 60,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(item.image),
                                    ),
                                  ),
                                  trailing: Text(
                                    item.house,
                                    style: TextStyle(
                                        color: houseColor(item.house)),
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CharacterDetails(item)));
                            },
                          ),
                        ))
                    .toList());
          } else
            return Container(
                margin: const EdgeInsets.only(top: 20),
                child: Center(child: CircularProgressIndicator()));
        },
      )),
    );
  }
}
