package {	
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.display.SimpleButton;
	
	public class Pan {
		
		// Object to be panned
		private var panObject:MovieClip;
		
		// Mouse positions
		private var xPos:Number;
		private var yPos:Number;
		
		// Stage object
		private var stage:Stage;
					
		// Pan speed modifier (higher is faster)
		private var speedModifier:Number = 1.5;
		
		// Pan modifier for buttons (higher is larger pan)
		private var panModifier:Number = 25;
						
		public function Pan(object:MovieClip) {
			
			// Set the stage
			stage = StageManager.instance.stage;
			
			// Set the pan object
			panObject = object;
			
			// Add mouse event for mouse down and mouse up
			panObject.addEventListener(MouseEvent.MOUSE_MOVE, mouseMovement);			
			
			// Set listeners for pan buttons
			if (Controls.instance.controls.panLeft && 
				Controls.instance.controls.panRight &&
				Controls.instance.controls.panUp &&
				Controls.instance.controls.panDown) {
				
				Controls.instance.controls.panLeft.addEventListener(MouseEvent.CLICK, panButtons);
				Controls.instance.controls.panRight.addEventListener(MouseEvent.CLICK, panButtons);
				Controls.instance.controls.panUp.addEventListener(MouseEvent.CLICK, panButtons);
				Controls.instance.controls.panDown.addEventListener(MouseEvent.CLICK, panButtons);
			}
		}
	
		// Mouse is being moved
		private function mouseMovement(e:MouseEvent) {
			
			// If the mouse button is still down, adjust object position
			if (e.buttonDown) {				
				panObject.x +=  (stage.mouseX - xPos) * speedModifier;
				panObject.y +=  (stage.mouseY - yPos) * speedModifier;
				
				constrainObject();
			}				
															
			// Save new positions
			xPos = stage.mouseX;
			yPos = stage.mouseY;		
		}
		
		// Pan buttons listener
		private function panButtons(e:MouseEvent) {
			var selectedButton:String = e.target.name;
			
			switch(selectedButton) { 
				case "panLeft": 
					panObject.x += panObject.scaleX * panModifier;
					break; 
				case "panRight": 
					panObject.x -= panObject.scaleX * panModifier;
					break; 
				case "panUp": 
					panObject.y += panObject.scaleY * panModifier;
					break; 
				case "panDown": 
					panObject.y -= panObject.scaleY * panModifier;
					break; 
			}
				constrainObject();
		}
		
		// Constrain object to borders of stage
		private function constrainObject() {
			if (panObject.x >= 0) {
				panObject.x = 0;
			}
			
			if (panObject.y >= 0) {
				panObject.y = 0;
			}
			
			if (panObject.x <= -panObject.width + stage.stageWidth) {
				panObject.x = -panObject.width + stage.stageWidth;
			}
			
			if (panObject.y <= -panObject.height + stage.stageHeight) {
				panObject.y = -panObject.height + stage.stageHeight;
			}
		}
		
		
	}
}
		