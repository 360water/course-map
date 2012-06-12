package {
	import flash.display.MovieClip;	
	import Classes.Map;
	
	public class Main extends MovieClip {
		
		// Create a new map object
		private var map:Map = new Map;
		
		public function Main() {
			
			// Add the map to the stage
			this.addChild(map);
			
			// Make sure the map fits to the stage
			map.width = stage.stageWidth * 2;
			map.height = stage.stageHeight * 2;
			
			
		}

	}
	
}
