package {
	import flash.display.MovieClip;
	
	public class Main extends MovieClip {
						
		// Map object
		private var map:Map
		
		// Controls
		public var controls:Controls;
				
		public function Main() {
			
			// Create a singleton of the stage
			StageManager.instance.stage = stage;
			
			// Create a singleton of the controls
			Controls.instance.controls = new Controls;			
			controls = Controls.instance.controls;
			controls.x = 5;
			controls.y = 5;
			
			// Create a map object and add it to the stage
			map = new Map;
			this.addChild(map);
			this.addChild(controls)
			
		}

	}
	
}
