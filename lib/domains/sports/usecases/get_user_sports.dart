import 'package:climbapp/core/datahelpers/params/sports/get_sports_params.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/domains/notice/usecases/i_usecase.dart';
import 'package:climbapp/domains/sports/entities/sport_entity.dart';
import 'package:climbapp/domains/sports/repository/sports_repository.dart';

class GetUserFavouriteSportsUseCase
    extends IUseCase<SportsRepository, SportEntity, GetSportParams> {
  const GetUserFavouriteSportsUseCase({required super.repository});

  @override
  EitherFunc<SportEntity> execute(GetSportParams params) {
    return repository_.getUserFavouriteSports(params);
  }
}
