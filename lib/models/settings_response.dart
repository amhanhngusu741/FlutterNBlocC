enum SoundMode { always, off, custom }
enum StartScreenMode { schedule, jobs, alerts }

class SettingsResponse {
  SettingNotify notify;

  SettingsResponse({this.notify});

  SettingsResponse.fromJson(Map<String, dynamic> json) {
    notify = json['notify'] != null
        ? new SettingNotify.fromJson(json['notify'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.notify != null) {
      data['notify'] = this.notify.toJson();
    }
    return data;
  }
}

class SettingNotify {
  int muteNotify;
  String muteFrom;
  String muteTo;
  SoundMode soundMode;
  String soundModeName;

  SettingNotify({this.muteNotify, this.muteFrom, this.muteTo});

  SettingNotify.fromJson(Map<String, dynamic> json) {
    muteNotify = json['mute_notify'];
    muteFrom = json['mute_from'];
    muteTo = json['mute_to'];
    soundMode = getSoundMode();
    soundModeName = getSoundModeName();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mute_notify'] = this.muteNotify;
    data['mute_from'] = this.muteFrom;
    data['mute_to'] = this.muteTo;
    return data;
  }

  SoundMode getSoundMode() {
    if (muteNotify == 1) {
      return SoundMode.off;
    }
    if (muteFrom != null && muteTo != null) {
      return SoundMode.custom;
    }

    if (muteNotify == 0) {
      return SoundMode.always;
    }

    return SoundMode.always;
  }

  String getSoundModeName() {
    if (muteNotify == 1) {
      return 'Off';
    }
    if (muteFrom != null && muteTo != null) {
      return 'Off ($muteFrom - $muteTo)';
    }

    if (muteNotify == 0) {
      return 'On';
    }

    return 'On';
  }
}
