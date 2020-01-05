using Toybox.System;

class cache{

	static var cacheItems = {
		digitSettingsNames.USE_MILITARY_FORMAT => new cacheValue(digitSettings.readKey(
        				digitSettingsNames.USE_MILITARY_FORMAT,
        				digitSettingsDefaults.DEFAULT_USE_MILITARY_FORMAT)),
		digitSettingsNames.BACKGROUND_COLOR => new cacheValue(digitSettings.readKey(
        				digitSettingsNames.BACKGROUND_COLOR,
        				digitSettingsDefaults.DEFAULT_BACKGROUND_COLOR)),
		digitSettingsNames.FOREGROUND_COLOR => new cacheValue(digitSettings.readKey(
        				digitSettingsNames.FOREGROUND_COLOR,
        				digitSettingsDefaults.DEFAULT_FOREGROUND_COLOR
        				)),
       	digitSettingsNames.USE_24_FORMAT => new cacheValue(System.getDeviceSettings().is24Hour)
	};
	
	static function reloadCache(){
		var useMilitaryFormat = digitSettings.readKey(
        				digitSettingsNames.USE_MILITARY_FORMAT,
        				digitSettingsDefaults.DEFAULT_USE_MILITARY_FORMAT);
        if(useMilitaryFormat != getCachedValue(digitSettingsNames.USE_MILITARY_FORMAT)){
			cacheItems[digitSettingsNames.USE_MILITARY_FORMAT].setValue(useMilitaryFormat);
		}
       
       	var backgroundColor = digitSettings.readKey(
        				digitSettingsNames.BACKGROUND_COLOR,
        				digitSettingsDefaults.DEFAULT_BACKGROUND_COLOR);
        if(backgroundColor != getCachedValue(digitSettingsNames.BACKGROUND_COLOR)){
			cacheItems[digitSettingsNames.BACKGROUND_COLOR].setValue(backgroundColor);
		}
		
		var foregroundColor = digitSettings.readKey(
        				digitSettingsNames.FOREGROUND_COLOR,
        				digitSettingsDefaults.DEFAULT_FOREGROUND_COLOR
        				);
        if(foregroundColor != getCachedValue(digitSettingsNames.FOREGROUND_COLOR)){
			cacheItems[digitSettingsNames.FOREGROUND_COLOR].setValue(foregroundColor);
		}

		var use24HourFormat = System.getDeviceSettings().is24Hour;
		if(use24HourFormat != getCachedValue(digitSettingsNames.USE_24_FORMAT)){
			cacheItems[digitSettingsNames.USE_24_FORMAT].setValue(use24HourFormat);
		}
	}
	
	static function getCachedValue(name){
		return cacheItems[name].getValue();
	}
	
	static function isUpdated(name){
		return cacheItems[name].isUpdated();
	}
	
	static function clearUpdatedFlag(name){
		cacheItems[name].setUpdated(false);
	}
}