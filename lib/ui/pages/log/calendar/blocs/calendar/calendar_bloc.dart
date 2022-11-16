import 'package:abushakir/abushakir.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'calendar_state.dart';
import 'calendar_event.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  final ETC currentMoment;

  CalendarState get initialState => Month(currentMoment);

  CalendarBloc({required this.currentMoment}) : super(CalendarState(currentMoment)) {
    on<NextMonthCalendar>((event, emit) => emit(Month(event.currentMonth.nextMonth)));
    on<PrevMonthCalendar>((event, emit) => emit(Month(event.currentMonth.prevMonth)));
  }

}
