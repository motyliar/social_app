import 'package:climbapp/core/datahelpers/params/sports/get_sports_params.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/data/sport/repository/sport_repository_impl.dart';
import 'package:climbapp/domains/notice/usecases/i_usecase.dart';
import 'package:climbapp/domains/sports/repository/sports_repository.dart';

class UpdateSportsUseCase
    extends IUseCase<SportsRepository, String, UpdateSportParams> {
  UpdateSportsUseCase({required super.repository});
  @override
  EitherFunc<String> execute(UpdateSportParams params) {
    return repository_.updateUserSports(params);
  }
}
