import 'package:flutter/material.dart';
import 'package:for_study/controllers/internet_get_persons.dart';
import 'package:for_study/controllers/rick_and_morty_person.dart';
import 'package:for_study/ui/page_character.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Rick and Morty",
              style: TextStyle(
                  color: Color.fromARGB(255, 17, 236, 24), fontSize: 20.0),
            ),
          ),
          backgroundColor: Color.fromARGB(255, 46, 140, 216),
        ),
        body: FutureBuilder(
            future: InternetGetPersons().getPersons(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                List<RickAndMortyPerson> characters =
                    snapshot.data as List<RickAndMortyPerson>;
                return ListView.separated(
                    itemBuilder: ((context, index) {
                      return TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Page_Character(
                                          name: characters[index].name ?? '',
                                          image: characters[index].image ?? '',
                                          type: characters[index].type ?? '',
                                          status:
                                              characters[index].status ?? '',
                                          gender:
                                              characters[index].gender ?? '',
                                          species:
                                              characters[index].species ?? '',
                                        )));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.network(
                                characters[index].image ?? '',
                                width: 60,
                                height: 60,
                              ),
                              Text(
                                characters[index].name ?? "",
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              const SizedBox(width: 10)
                            ],
                          ));
                    }),
                    separatorBuilder: ((context, index) {
                      return const Divider(
                        height: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      );
                    }),
                    itemCount: characters.length);
              }
              if (snapshot.hasError) {
                return const Text("Error");
              }
              return const CircularProgressIndicator();
            })));
  }
}
