package {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import org.osflash.signals.Signal;
	
	public class Main extends MovieClip {
						
		// Map object
		public var map:Map
		
		// Controls
		public var controls:Controls;
				
		public function Main() {
			
			// Create a singleton of the stage
			StageManager.instance.stage = stage;			
						
			// Create a singleton of the controls
			Controls.instance.controls = new Controls(stage.stageWidth, stage.stageWidth);			
			controls = Controls.instance.controls;
			controls.x = 5;
			controls.y = 5;			
			
			// Create a map object and add it to the stage			
			map = new Map;
			
			this.addChild(map);
			this.addChild(controls);
			
			controls.addEventListener(MouseEvent.CLICK, clickHandler);
			map.activePinChanged.add(activePinHandler)
		}
		
		private function clickHandler(e:MouseEvent) {
			if (e.target is MenuItem) {				
				map.menuItemClicked(e.target.link);
			}
		}
		
		private function activePinHandler(heading:String) {			
			controls.changeMenuTitle(heading);
		}
	}	
}
