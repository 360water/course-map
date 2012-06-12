package {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class Map extends MovieClip {
					
		public function Map() {
			// Create a new pan object
			var pan:Pan = new Pan(this);
			addChild(pan);			
		}
	}
	
}
