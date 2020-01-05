using Toybox.WatchUi;
using Toybox.Application;
using Toybox.Graphics;

class Background extends WatchUi.Drawable {

    function initialize() {
        var dictionary = {
            :identifier => "Background"
        };
        
        Drawable.initialize(dictionary);
    }

    function draw(dc) {
        // Set the background color then call to clear the screen
        if(cache.isUpdated(digitSettingsNames.BACKGROUND_COLOR)){
        	dc.setColor(Graphics.COLOR_TRANSPARENT,cache.getCachedValue(digitSettingsNames.BACKGROUND_COLOR));
        	cache.clearUpdatedFlag(digitSettingsNames.BACKGROUND_COLOR);
        }
        dc.clear();
    }

}
