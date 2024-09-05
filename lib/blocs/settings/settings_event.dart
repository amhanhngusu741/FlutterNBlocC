part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class SettingsLoaded extends SettingsEvent {}

class SettingsSavedSoundNotification extends SettingsEvent {
  const SettingsSavedSoundNotification(
      {@required this.soundMode, this.fromDate, this.toDate});
  final SoundMode soundMode;
  final String fromDate;
  final String toDate;

  @override
  List<Object> get props => [soundMode, fromDate, toDate];
}

class SettingsSavedStartScreen extends SettingsEvent {
  const SettingsSavedStartScreen({@required this.startScreen});
  final String startScreen;
  @override
  List<Object> get props => [startScreen];
}
