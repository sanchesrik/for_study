import 'package:bloc/bloc.dart';
import 'package:for_study/controllers/rick_and_morty_person.dart';
import 'package:for_study/controllers/internet_get_persons.dart';
import 'package:for_study/controllers/rick_and_morty_data.dart';
import 'package:meta/meta.dart';

part 'rick_and_morty_person_state.dart';

class RickAndMortyPersonCubit extends Cubit<RickAndMortyPersonState> {
  RickAndMortyPersonCubit() : super(RickAndMortyPersonInitial());
  fetchPersons() async {
    emit(RickAndMortyPersonLoading());
    try {
      RickAndMortyData repository = InternetGetPersons();
      var persons = await repository.getPersons();
      emit(RickAndMortyPersonFetched(persons));
    } catch (e) {
      emit(RickAndMortyPersonError());
    }
  }
}
