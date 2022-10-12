import 'package:for_study/controllers/rick_and_morty_person.dart';

abstract class RickAndMortyData {
  Future<List<RickAndMortyPerson>> getPersons();
}
