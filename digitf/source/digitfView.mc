using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.System;
using Toybox.Lang;
using Toybox.Application;
using Toybox.Time;
using Toybox.Time.Gregorian;


class digitfView extends WatchUi.WatchFace {
	
	var timeView;
    var dateView;
    var font;
    var font_small;
    
    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        font = WatchUi.loadResource(Rez.Fonts.id_7font);
        font_small = WatchUi.loadResource(Rez.Fonts.id_7font_small);
        setLayout(Rez.Layouts.WatchFace(dc));
        // Update the view
        timeView = View.findDrawableById("TimeLabel");
        dateView = View.findDrawableById("DateLabel");
        timeView.setFont(font);
        dateView.setFont(font_small);
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {

        
    }

    // Update the view
    function onUpdate(dc) {
        // Get the current time and format it correctly
        var now = Gregorian.info(Time.now(), Time.FORMAT_MEDIUM);
        var timeFormat = digitConstants.TIME_FORMAT_STD;
        var hours = now.hour;
        if (!cache.getCachedValue(digitSettingsNames.USE_24_FORMAT)) {
            if (hours > 12) {
                hours = hours - 12;
            }
        } else {
            if (cache.getCachedValue(digitSettingsNames.USE_MILITARY_FORMAT)) {
                timeFormat = digitConstants.TIME_FORMAT_MILITARY;
                hours = hours.format("%02d");
            }
        }
        
        if(cache.isUpdated(digitSettingsNames.FOREGROUND_COLOR)){
        	timeView.setColor(cache.getCachedValue(digitSettingsNames.FOREGROUND_COLOR));
        	dateView.setColor(cache.getCachedValue(digitSettingsNames.FOREGROUND_COLOR));
        	cache.clearUpdatedFlag(digitSettingsNames.FOREGROUND_COLOR);
        }
        
        var timeString = Lang.format(timeFormat, [hours, now.min.format("%02d")]);
        var dateString = Lang.format(digitConstants.DATE_FORMAT_SHORT, [now.day_of_week, now.day]);
        timeView.setText(timeString);
        dateView.setText(dateString);
        
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() {
    }

}
