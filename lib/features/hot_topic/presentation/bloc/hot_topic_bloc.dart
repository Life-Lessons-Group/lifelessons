import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'hot_topic_event.dart';
part 'hot_topic_state.dart';
class HotTopicBloc extends Bloc<HotTopicEvent, HotTopicState> {
  HotTopicBloc() : super(HotTopicInitial());
  @override
  Stream<HotTopicState> mapEventToState(
    HotTopicEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
