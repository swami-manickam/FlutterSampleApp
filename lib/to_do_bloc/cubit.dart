import 'package:bloc/bloc.dart';

import 'state.dart';

class To_do_blocCubit extends Cubit<To_do_blocState> {
  To_do_blocCubit() : super(To_do_blocState().init());
}
