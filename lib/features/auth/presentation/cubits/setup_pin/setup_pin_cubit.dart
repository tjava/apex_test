import 'package:apex_test/core/errors/failures.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import 'package:apex_test/features/auth/domain/usecases/cache_pin_usecase.dart';

part 'setup_pin_state.dart';

@injectable
class SetupPinCubit extends Cubit<SetupPinState> {
  CachePinUsecase cachePinUsecase;
  SetupPinCubit(
    this.cachePinUsecase,
  ) : super(SetupPinInitial());

  Future<void> setupPin(String pin) async {
    emit(const Loading());

    final result = await cachePinUsecase(pin);

    result.fold(
      (Failure failure) {
        emit(Error(failure.message!));
      },
      (_) => emit(const Loaded()),
    );
  }

  Future<void> verifyPin(String email) async {
    // emit(const Loading());

    // final result = await getEmailTokenUsecase(email);

    // result.fold(
    //   (Failure failure) {
    //     if (failure is ServerFailure) {
    //       emit(Error(failure.message!));
    //     }
    //     emit(Error(failure.message!));
    //   },
    //   (EmailTokenEntity emailTokenEntity) => emit(Loaded(emailTokenEntity)),
    // );
  }
}
