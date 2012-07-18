package {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.display.LoaderInfo;
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
			
			// Add pan and zooming to the map
			var pan:Pan = new Pan(map);
			var zoom:Zoom = new Zoom(map);
			
			controls.addEventListener(MouseEvent.CLICK, clickHandler);
			controls.addEventListener(MouseEvent.MOUSE_OVER, mouseHandler);
			controls.addEventListener(MouseEvent.MOUSE_OUT, mouseHandler);
			map.activePinChanged.add(activePinHandler);
			
			// Get flashvars
			if (stage.loaderInfo.parameters.id) {
				map.idPassedIn(int(stage.loaderInfo.parameters.id));				
			}
			
		}
		
		private function clickHandler(e:MouseEvent) {
			if (e.target is MenuItem) {				
				map.menuItemClicked(e.target.link);
			}
		}
		
		private function mouseHandler(e:MouseEvent) {
			if (e.target is MenuItem) {				
				map.menuItemHovered(e.target.link, e.type);
			}			
		}
		
		private function activePinHandler(itemLabel:String) {			
			controls.highLightMenuItem(itemLabel);
		}
	}	
}
