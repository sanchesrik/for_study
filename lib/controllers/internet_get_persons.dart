import 'package:for_study/controllers/rick_and_morty_data.dart';
import 'package:dio/dio.dart';
import 'package:for_study/controllers/rick_and_morty_person.dart';

class InternetGetPersons implements RickAndMortyData {
  @override
  Future<List<RickAndMortyPerson>> getPersons() async {
    Dio dio = Dio();
    var a = await dio.get("https://rickandmortyapi.com/api/character");
    var data = a.data["results"];
    List<RickAndMortyPerson> forCheck = [];
    for (var person in data) {
      var model = RickAndMortyPerson.fromJson(person);
      forCheck.add(model);
    }
    return forCheck;
  }
}
