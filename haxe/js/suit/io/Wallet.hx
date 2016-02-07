package js.suit.io;

/**
 * Class that wraps IndexDB functionalities using LocalForage.
 * @author eduardo-costa
 */
extern class Wallet
{
	/**
	 * String to be used before keys to avoid key collision between different situations.
	 */
	static public var context  : String;
	
	/**
	 * Chosen name for the database. Use this to differentiate between applications.
	 */
	static public var database : String;
		
	/**
	 * Initializes the storage with custom information.
	 * @param	p_database
	 */
	static public function init(p_database:String = null):Void;
	/**
	 * Retrieves a data from LocalForage.
	 * @param	p_key
	 * @param	p_callback
	 */
	@:overload(function (p_key : String,p_callback : String):Void{})
	@:overload(function (p_key : String,p_callback : Dynamic->Void):Void{})
	static public function get(p_key : String, p_callback : Dynamic->Error->Void):Void;
	
	/**
	 * Stores a data into LocalForage.
	 * @param	p_key
	 * @param	p_value
	 * @param	p_callback
	 */
	@:overload(function (p_key : String,p_value:Dynamic,p_callback : String):Void{})
	@:overload(function (p_key : String,p_value:Dynamic,p_callback : Dynamic->Void):Void{})
	static public function set(p_key : String, p_value:Dynamic, p_callback : Dynamic->Error->Void):Void;

	/**
	 * Remove a data from LocalForage.
	 * @param	p_key
	 * @param	p_callback
	 */
	@:overload(function (p_key : String,p_callback : String):Void{})
	@:overload(function (p_key : String, p_callback : Dynamic->Void):Void { } )	
	static public function remove(p_key : String, p_callback : Dynamic->Error->Void):Void;
	
	/**
	 * Returns the keyname based on the numeric id.
	 * @param	p_index
	 * @param	p_callback
	 */
	@:overload(function (p_index : Int,p_callback : String):Void{})
	@:overload(function (p_index : Int, p_callback : String->Void):Void { } )	
	static public function key(p_index:Int, p_callback : String->Error->Void):Void;
	
	/**
	 * Returns an array of all stored keys.
	 * @param	p_callback
	 */
	@:overload(function (p_callback : String):Void { } )	
	@:overload(function (p_callback : Array<String>->Void):Void { } )	
	static public function keys(p_callback : Array<String>->Error->Void):Void;
	
	/**
	 * Removes all entries from the storage.
	 * @param	p_callback
	 */
	@:overload(function (p_callback : String):Void { } )	
	@:overload(function (p_callback : Int->Void):Void { } )	
	static public function clear(p_callback : Int->Error->Void):Void;
	
	/**
	 * Returns the number of elements stored.
	 */
	@:overload(function (p_callback : String):Void { } )	
	@:overload(function (p_callback : Int->Void):Void { } )	
	static public function length(p_callback : Int->Error->Void):Void;
	
	/**
	 * Iterates through all key-value pairs. If non-null values are returned it stops.
	 * @param	p_callback
	 */
	@:overload(function (p_callback : String->Dynamic->Void):Void { } )		
	@:overload(function (p_callback : String->Dynamic->Dynamic):Void { } )		
	@:overload(function (p_callback : String->Dynamic->Int->Void):Void { } )		
	static public function iterate(p_callback : String->Dynamic->Int->Dynamic):Void;
		
	/**
	 * Removes all data from ALL databases. Use with care.
	 * @param	p_callback
	 */
	@:overload(function (p_callback : String):Void { } )	
	@:overload(function (p_callback : Void->Void):Void { } )		
	static public function destroy(p_callback : Error->Void):Void;
	
	
}