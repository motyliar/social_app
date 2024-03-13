import 'package:climbapp/core/datahelpers/params/sports/get_sports_params.dart';
import 'package:climbapp/core/utils/utils.dart';
import 'package:climbapp/domains/sports/entities/sport_entity.dart';

abstract class SportsRepository {
  EitherFunc<SportEntity> getUserFavouriteSports(GetSportParams params);
  EitherFunc<String> updateUserSports(UpdateSportParams params);
}
