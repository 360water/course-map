package  {
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.MouseEvent;	
	
	public class Zoom {
		
		// Object to be zoomed
		private var zoomObject:MovieClip;
		
		// Min and Max Zoom
		private var minZoom:Number = 1;
		private var maxZoom:Number = 3;
		
		// Stage object
		private var stage:Stage;
					
		// Zoom speed modifier (higher is less zooms)
		private var speedModifier:Number = 0.1;
		
		// Zoom button modifier (higher is less zooms)
		private var zoomModifier:Number = 0.25;
			
		// Constructor
		public function Zoom(object:MovieClip) {
			// Set the stage
			stage = StageManager.instance.stage;
			
			// Set the zoom object
			zoomObject = object;			
			
			// Add event listener for the mouse wheel
			stage.addEventListener(MouseEvent.MOUSE_WHEEL, mouseZoom);
			
			if (Controls.instance.controls.zoomInBtn && Controls.instance.controls.zoomOutBtn) {
				Controls.instance.controls.zoomInBtn.addEventListener(MouseEvent.CLICK, zoomIn);
				Controls.instance.controls.zoomOutBtn.addEventListener(MouseEvent.CLICK, zoomOut);
			}
		}
		
		// Detect movement of the mouse wheel
		private function mouseZoom(e:MouseEvent) {					
			
			// Set the initial zoomObject size
			var tempSizeX:Number = zoomObject.width;
			var tempSizeY:Number = zoomObject.height;
			
			// Scale the zoomObject based on the mouse wheel
			zoomObject.scaleX += e.delta * speedModifier;
			zoomObject.scaleY += e.delta * speedModifier;
			
			// Contrain zoom to min and max values
			constrainZoom();
			
			//zoomObject.scaleChildren();
			
			// Move zoomObject so center stays in same place			
			zoomObject.x = ((2 * stage.mouseX) - (2 * (e.localX * zoomObject.scaleX))) / 2;
			zoomObject.y = ((2 * stage.mouseY) - (2 * (e.localY * zoomObject.scaleY))) / 2;
			
						
			// Constrain zoomObject to borders of stage
			if (e.delta < 0) {
				constrainObject();			
			}
		}
		
		// Zoom in with button
		private function zoomIn(e:MouseEvent) {
			var initialZoom:Number = zoomObject.scaleX;
			
			if (zoomObject.scaleX < maxZoom) {
				zoomObject.scaleX += zoomModifier;
				zoomObject.scaleY += zoomModifier;
			
				// Contrain zoom to min and max values
				constrainZoom();
				
				// Adjust the position of the object
				adjustPosition(zoomObject.scaleX - initialZoom);
			}
		}
		
		// Zoom out with button
		private function zoomOut(e:MouseEvent) {			
			var initialZoom:Number = zoomObject.scaleX;
			
			if (zoomObject.scaleY > minZoom)
			{
				zoomObject.scaleX -= zoomModifier;
				zoomObject.scaleY -= zoomModifier;					

				// Contrain zoom to min and max values
				constrainZoom();
			
				// Adjust the position of the object
				adjustPosition(zoomObject.scaleX - initialZoom);
			
				// Constrain zoomObject to borders of stage
				constrainObject();
			}
		}
		
		private function constrainZoom() {			
			if (zoomObject.scaleX <= minZoom) {
				zoomObject.scaleX = minZoom;
				zoomObject.scaleY = minZoom;
			}
			if (zoomObject.scaleX >= maxZoom) {
				zoomObject.scaleX = maxZoom;
				zoomObject.scaleY = maxZoom;
			}
		}
		
		// Constrain object to borders of stage
		private function constrainObject() {
			if (zoomObject.x >= 0) {
				zoomObject.x = 0;
			}
			
			if (zoomObject.y >= 0) {
				zoomObject.y = 0;
			}
			
			if (zoomObject.x <= -zoomObject.width + stage.stageWidth) {
				zoomObject.x = -zoomObject.width + stage.stageWidth;
			}
			
			if (zoomObject.y <= -zoomObject.height + stage.stageHeight) {
				zoomObject.y = -zoomObject.height + stage.stageHeight;
			}
		}		
		
		
		// Scale the map children
		private function scaleChildren() {
			for (var i:int = 0; i < zoomObject.numChildren; i++) {
				zoomObject.getChildAt(i).scaleX = 1 / zoomObject.scaleX;
				zoomObject.getChildAt(i).scaleY = 1 / zoomObject.scaleY;
			}
		}
		
		// Adjust object position with zoom (only use with buttons)
		private function adjustPosition(scaleChange:Number) {			
			zoomObject.x -= scaleChange * stage.stageWidth / 2;
			zoomObject.y -= scaleChange * stage.stageHeight / 2;
		}
		
		
	}	
}
