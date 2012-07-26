package {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.display.LoaderInfo;
	import org.osflash.signals.Signal;
	
	public class Main extends MovieClip {
						
		// Map object
		public var map:Map
		
		// Schematic object
		public var schematic:Schematic;
		
		// Controls
		public var controls:Controls;
		
		// Switch Button
		public var switchButton:SwitchButton;
		
		// Is there a pin active
		var isPinActive:Boolean;
				
		public function Main() {
			
			// Create a singleton of the stage
			StageManager.instance.stage = stage;			
						
			// Create a singleton of the controls
			Controls.instance.controls = new Controls(stage.stageWidth, stage.stageWidth);			
			controls = Controls.instance.controls;
			controls.x = 5;
			controls.y = 5;			
			
			isPinActive = false;
			
			// Create a map object and add it to the stage			
			map = new Map();
			
			this.addChild(map);
			this.addChild(controls);
			
			// Create a schematic object and add it to the stage
			schematic = new Schematic();
			this.addChild(schematic);
			
			// Create the switch button
			switchButton = new SwitchButton();
			switchButton.width = 50;
			switchButton.height = 50;
			switchButton.x = 862.5;
			switchButton.y = 512.5;
			this.addChild(switchButton);			
			
			map.visible = false;
			controls.visible = false;			
			
			// Add pan and zooming to the map
			var pan:Pan = new Pan(map);
			var zoom:Zoom = new Zoom(map);
			
			controls.addEventListener(MouseEvent.CLICK, clickHandler);
			controls.addEventListener(MouseEvent.MOUSE_OVER, mouseHandler);
			controls.addEventListener(MouseEvent.MOUSE_OUT, mouseHandler);
			switchButton.addEventListener(MouseEvent.CLICK, switchButtonHandler);
			map.activePinChanged.add(activePinHandler);
			schematic.schematicButtonClicked.add(schematicHandler);
			
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
			if (e.target is MenuItem && !isPinActive) {				
				map.menuItemHovered(e.target.link, e.type);
			}			
		}
		
		private function activePinHandler(itemLabel:String) {
			if (itemLabel == "") {
				isPinActive = false;
			} else {
				isPinActive = true;
			}			
			controls.highLightMenuItem(itemLabel);
		}
		
		private function schematicHandler(pinName:String) {
			map.visible = true;
			controls.visible = true;
			schematic.visible = false;
			
			map.schematicButtonClicked(pinName);
		}
		
		private function switchButtonHandler(e:MouseEvent) {
			if (map.visible && controls.visible) {
				map.visible = false;
				controls.visible = false;
				schematic.visible = true;
			} else {
				schematic.visible = false;
				map.visible = true;
				controls.visible = true;
			}
		}
	}	
}
