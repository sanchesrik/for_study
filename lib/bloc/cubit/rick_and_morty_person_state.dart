part of 'rick_and_morty_person_cubit.dart';

@immutable
abstract class RickAndMortyPersonState {}

class RickAndMortyPersonInitial extends RickAndMortyPersonState {}

class RickAndMortyPersonError extends RickAndMortyPersonState {}

class RickAndMortyPersonLoading extends RickAndMortyPersonState {}

class RickAndMortyPersonFetched extends RickAndMortyPersonState {
  RickAndMortyPersonFetched(
    this.persons,
  );
  final List<RickAndMortyPerson> persons;
}
