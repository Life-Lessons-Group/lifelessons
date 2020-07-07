import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'topics_event.dart';
part 'topics_state.dart';
class TopicsBloc extends Bloc<TopicsEvent, TopicsState> {
  @override
  TopicsState get initialState => TopicsInitial();
  @override
  Stream<TopicsState> mapEventToState(
    TopicsEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
