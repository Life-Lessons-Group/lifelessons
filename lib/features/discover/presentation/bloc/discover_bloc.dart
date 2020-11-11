import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'discover_event.dart';
part 'discover_state.dart';
class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  DiscoverBloc() : super(DiscoverInitial());
  @override
  Stream<DiscoverState> mapEventToState(
    DiscoverEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
