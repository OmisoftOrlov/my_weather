part of 'location_cubit.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {
  final Position position;

  const LocationLoaded({required this.position});
}

class LocationChanged extends LocationState {
  final Position position;

  const LocationChanged({required this.position});
}

class LocationLoadingFailed extends LocationState {
  final String errorMessage;

  const LocationLoadingFailed({required this.errorMessage});
}
