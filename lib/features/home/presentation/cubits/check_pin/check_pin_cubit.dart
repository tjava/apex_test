import 'package:apex_test/core/errors/failures.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:apex_test/features/auth/domain/usecases/get_pin_usecase.dart';

part 'check_pin_state.dart';

@injectable
class CheckPinCubit extends Cubit<CheckPinState> {
  GetPinUsecase getPinUsecase;
  CheckPinCubit(
    this.getPinUsecase,
  ) : super(CheckPinInitial());

  Future<void> checkPin(String pin) async {
    emit(const Loading());

    final result = await getPinUsecase();

    result.fold(
      (Failure failure) {
        emit(Error(failure.message!));
      },
      (String? savedPin) {
        if (savedPin == pin) {
          emit(const Loaded());
        } else {
          emit(const Error('Incorrect pin'));
        }
      },
    );
  }
}
