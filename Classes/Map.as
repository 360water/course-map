package {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import fl.transitions.Zoom;
	
	public class Map extends MovieClip {
					
		public function Map() {
			// Add pannign and zooming to the map
			var pan:Pan = new Pan(this);
			var zoom:Zoom = new Zoom(this);
			
			
			
		}
	}
	
}
