using Toybox.Time;

class cacheValue{
	var lastDateUpdated;
	var value;
	var updated;

	function initialize( avalue ) {
    	setValue(avalue);
    }
    
    function getValue(){
    	return value;
    }
    
    function setValue( avalue ) {
    	lastDateUpdated = Time.now();
    	value = avalue;
    	updated = true;
    }
    
    function setUpdated( avalue ) {
    	updated = avalue;
    }
    
    function isUpdated(){
    	return updated;
    }
}