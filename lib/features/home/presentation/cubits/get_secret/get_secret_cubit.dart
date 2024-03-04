import 'package:apex_test/core/errors/failures.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:apex_test/features/home/domain/entities/secret_entity.dart';
import 'package:apex_test/features/home/domain/usecases/get_secret_usecase.dart';
import 'package:injectable/injectable.dart';

part 'get_secret_state.dart';

@injectable
class GetSecretCubit extends Cubit<GetSecretState> {
  GetSecretUsecase getSecretUsecase;
  GetSecretCubit(
    this.getSecretUsecase,
  ) : super(GetSecretInitial());

  Future<void> getSecret() async {
    emit(const Loading());

    final result = await getSecretUsecase();

    result.fold(
      (Failure failure) {
        if (failure is ServerFailure) {
          emit(Error(failure.message!));
        }
        emit(Error(failure.message!));
      },
      (SecretEntity secretEntity) => emit(Loaded(secretEntity)),
    );
  }
}
