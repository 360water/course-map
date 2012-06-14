package {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class Map extends MovieClip {
					
		public function Map() {
			
			// Add pan and zooming to the map
			var pan:Pan = new Pan(this);
			var zoom:Zoom = new Zoom(this);			
		}
		
		public function scaleChildren() {
			for (var i:int = 0; i < this.numChildren; i++) {
				if (this.getChildAt(i) is Pin) {
					this.getChildAt(i).scaleX = 1 / this.scaleX;
					this.getChildAt(i).scaleY = 1 / this.scaleY;
				}
			}
		}
	}
	
}
