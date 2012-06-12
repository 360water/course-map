package {
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.display.MovieClip;
	
	
	public class Pan extends Sprite {
		
		// Object to be panned
		private var panObject:MovieClip;
		
		// Mouse positions
		private var xPos:Number;
		private var yPos:Number;
		
		// Pan speed modifier
		private var speedModifier:Number;
						
		public function Pan(object:MovieClip) {
			// Set the pan object
			panObject = object;
			
			// Set the pan speed modifier (higher is faster)
			speedModifier = 1.5;
			
			// Add mouse event for mouse down and mouse up
			panObject.addEventListener(MouseEvent.MOUSE_MOVE, mouseMovement);			
		}
	
		// Mouse is being moved
		private function mouseMovement(e:MouseEvent) {
			
			// If the mouse button is still down, adjust object position
			if (e.buttonDown) {				
				panObject.x +=  (mouseX - xPos) * speedModifier;
				panObject.y +=  (mouseY - yPos) * speedModifier;
				
				// Get mouse position				
				xPos = mouseX;
				yPos = mouseY;				
				
				constrainObject();
			}				
															
			// Save new positions
			xPos = mouseX;
			yPos = mouseY;
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
		