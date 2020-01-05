using Toybox.Application;

class digitSettings{
    
    static function readKey(key,thisDefault) {
    	var value = Application.getApp().getProperty(key);
	    if(value == null) {
            value = thisDefault;
        }
	    return value;
	}
    
}