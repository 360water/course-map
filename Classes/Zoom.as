package  {
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.MouseEvent;	
	
	public class Zoom {
		
		// Object to be zoomed
		private var zoomObject:MovieClip;
		
		// Stage object
		private var stage:Stage;
		
		// Set the controls
		private var controls:Controls;							
			
		// Constructor
		public function Zoom(object:MovieClip) {			
			// Set the stage
			stage = StageManager.instance.stage;
			
			// Set the controls			
			controls = Controls.instance.controls;
			
			// Set the zoom object
			zoomObject = object;			
			
			// Add event listener for the mouse wheel
			stage.addEventListener(MouseEvent.MOUSE_WHEEL, mouseZoom);
			
			if (controls.zoomControls) {
				controls.zoomControls.zoomInBtn.addEventListener(MouseEvent.CLICK, zoomIn);
				controls.zoomControls.zoomOutBtn.addEventListener(MouseEvent.CLICK, zoomOut);
			}
		}
		
		// Detect movement of the mouse wheel
		private function mouseZoom(e:MouseEvent) {
			if (e.target is Map) {			
				// Set the initial zoomObject size
				var tempSizeX:Number = zoomObject.width;
				var tempSizeY:Number = zoomObject.height;
				
				// Scale the zoomObject based on the mouse wheel
				zoomObject.scaleX += e.delta * C.ZOOM_MOUSE_SPEED;
				zoomObject.scaleY += e.delta * C.ZOOM_MOUSE_SPEED;
				
				// Contrain zoom to min and max values
				constrainZoom();
				
				// Move zoomObject so center stays in same place
				zoomObject.x = ((2 * stage.mouseX) - (2 * (e.localX * zoomObject.scaleX))) / 2;
				zoomObject.y = ((2 * stage.mouseY) - (2 * (e.localY * zoomObject.scaleY))) / 2;
										
				// Constrain zoomObject to borders of stage
				if (e.delta < 0) {
					constrainObject();			
				}
				
				zoomObject.scaleChildren();
			}
		}
		
		// Zoom in with button
		private function zoomIn(e:MouseEvent) {
			var initialZoom:Number = zoomObject.scaleX;
			
			if (zoomObject.scaleX < C.MAX_ZOOM) {
				zoomObject.scaleX += C.ZOOM_BUTTON_SPEED;
				zoomObject.scaleY += C.ZOOM_BUTTON_SPEED;
			
				// Contrain zoom to min and max values
				constrainZoom();
				
				// Adjust the position of the object
				adjustPosition(zoomObject.scaleX - initialZoom);
				zoomObject.scaleChildren();
			}
		}
		
		// Zoom out with button
		private function zoomOut(e:MouseEvent) {			
			var initialZoom:Number = zoomObject.scaleX;
			
			if (zoomObject.scaleY > C.MIN_ZOOM)
			{
				zoomObject.scaleX -= C.ZOOM_BUTTON_SPEED;
				zoomObject.scaleY -= C.ZOOM_BUTTON_SPEED;					

				// Contrain zoom to min and max values
				constrainZoom();
			
				// Adjust the position of the object
				adjustPosition(zoomObject.scaleX - initialZoom);
			
				// Constrain zoomObject to borders of stage
				constrainObject();
				zoomObject.scaleChildren();
			}
		}
		
		private function constrainZoom() {			
			if (zoomObject.scaleX <= C.MIN_ZOOM) {
				zoomObject.scaleX = C.MIN_ZOOM;
				zoomObject.scaleY = C.MIN_ZOOM;
			}
			if (zoomObject.scaleX >= C.MAX_ZOOM) {
				zoomObject.scaleX = C.MAX_ZOOM;
				zoomObject.scaleY = C.MAX_ZOOM;
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
