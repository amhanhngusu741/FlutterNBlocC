part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  const SettingsState({
    this.settingsResponse,
    this.status = FormStatus.pure,
    this.messageStatus = '',
    this.startScreen,
  });

  final SettingsResponse settingsResponse;
  final FormStatus status;
  final String messageStatus;
  final String startScreen;

  SettingsState copyWith({
    SettingsResponse settingsResponse,
    FormStatus status,
    String messageStatus,
    String startScreen,
  }) {
    return SettingsState(
      settingsResponse: settingsResponse ?? this.settingsResponse,
      status: status ?? this.status,
      messageStatus: messageStatus ?? this.messageStatus,
      startScreen: startScreen ?? this.startScreen,
    );
  }

  @override
  List<Object> get props =>
      [settingsResponse, status, messageStatus, startScreen];
}
