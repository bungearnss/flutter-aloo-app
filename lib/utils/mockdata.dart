import '../model/bodyscore.dart';
import '../model/monthactivity.dart';
import '../model/todayactivity.dart';
import '../model/exercise.dart';
import '../model/userinfos.dart';

final todayInfo = TodayActivity(
  steps: 1228,
  cals: 829,
  distance: 1.5,
  goal: 3,
);

final monthInfo = MonthActivity(
  steps: 50263,
  cals: 12835,
  distance: 48,
);

final bodyInfo = BodyScore(
  percent: 95,
  fat: 17.1,
  weigth: 49.8,
  water: 56.8,
);

final exerciseInfo = [
  Exercise(type: "Walking", distance: 4.71, time: "00:56:21"),
  Exercise(type: "Running", distance: 7.34, time: "00:50:45"),
  Exercise(type: "Cycling", distance: 2.45, time: "00:56:27"),
  Exercise(type: "Tradmill", distance: 3.54, time: "00:20:12"),
];

final userInfo = UserInfo(
  name: "Ramky Rejendran",
  rank: 1729,
  achievement: 23,
  avgStep: 839201,
  totalKm: 323,
  activityGoal: 8000,
  weightGoal: 62,
);
