package {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class Map extends MovieClip {
		
		private var pins:Array;
		private var activePin:Pin;
					
		public function Map() {
			// Go to and stop at the first frame
			highlights.visible = false;
			
			// Create an array with the pins
			setPins();
			
			// Add pan and zooming to the map
			var pan:Pan = new Pan(this);
			var zoom:Zoom = new Zoom(this);
			
			this.addEventListener(MouseEvent.CLICK, hidePinInformation);
		}
		
		private function setPins() {
			pins = new Array();
			var pin = new Pin();
			for (var i:int = 0; i < this.numChildren; i++) {
				if (this.getChildAt(i) is Pin) {
					pin = this.getChildAt(i);
					pins.push(pin);					
				}
			}
		}
		
		private function hidePinInformation(e:MouseEvent) {
			if (e.target is Map) {
				setActivePin();				
			}			
		}
		
		public function scalePins() {
			for (var i:int = 0; i < pins.length; i++) {				
				this.getChildAt(i).scaleX = 1 / this.scaleX;
				this.getChildAt(i).scaleY = 1 / this.scaleY;				
			}
		}
		
		public function setActivePin(pin:Pin = null) {
			if (activePin && pin != activePin) {
				activePin.hideInformation();				
			}
			
			if (pin) {
				this.setChildIndex(pin, this.numChildren - 1);
				activePin = pin;
				highlights.visible = true;
				highlights.gotoAndStop(pin.getPinFrame());
			} else {				
				highlights.visible = false;
			}
		}
	}
	
}
