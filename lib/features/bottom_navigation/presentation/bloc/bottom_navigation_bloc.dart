import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';
class BottomNavigationBloc extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  @override
  BottomNavigationState get initialState => BottomNavigationInitial();
  @override
  Stream<BottomNavigationState> mapEventToState(
    BottomNavigationEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
