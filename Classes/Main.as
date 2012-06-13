package {
	import flash.display.MovieClip;	
	import Classes.Map;
	
	public class Main extends MovieClip {
						
		// Map object
		private var map:Map
		
		public function Main() {
			
			// Create a singleton of the stage
			StageManager.instance.stage = stage;
			
			// Create a singleton of the controls
			Controls.instance.controls = new Controls;			
			
			// Create a map object and add it to the stage
			map = new Map;
			this.addChild(map);
			this.addChild(Controls.instance.controls)
			Controls.instance.controls.x = 10;
			Controls.instance.controls.y = 10;			
		}

	}
	
}
