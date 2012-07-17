package {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import org.osflash.signals.Signal;
	
	public class Map extends MovieClip {
		
		private var pins:Array;
		private var activePin:Pin;
		
		public var activePinChanged:Signal;
									
		public function Map() {
			// Go to and stop at the first frame
			highlights.visible = false;
			
			// Create an array with the pins
			setPins();
						
			this.addEventListener(MouseEvent.MOUSE_OVER, mouseHandler);
			this.addEventListener(MouseEvent.MOUSE_OUT, mouseHandler);
			this.addEventListener(MouseEvent.CLICK, clickHandler);
			
			activePinChanged = new Signal(String);
		}
		
		// Selects the pins and adds them to an array		
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
		
		// Handler for when mouse moves over or away from object
		private function mouseHandler(e:MouseEvent) {
			if (e.target is Pin) {				
				toggleActivePin(e.target as Pin, e.type);				
			}
		}
		
		// Handler for when the mouse is clicked
		private function clickHandler(e:MouseEvent) {			
			if (e.target is Pin) {
				toggleActivePin(e.target as Pin, e.type);								
			} else if (e.target is Map) {
				toggleActivePin()
			}
		}
		
		// Sets/unsets the active pin
		private function toggleActivePin(pin:Pin = null, type:String = null) {
			if (pin) {
				if (type == "mouseOver") {
					
					// If different from active pin, remove active pn
					if (pin != activePin && activePin) {
						activePin.hideTitle();
						activePin.hideCourses();
						activePin == null;
						activePinChanged.dispatch(C.MENU_HEADING);
					}
					
					// Show pin title and highlights
					pin.showTitle();
					highlights.visible = true;
					highlights.gotoAndStop(pin.getPinFrame());
					this.setChildIndex(pin, this.numChildren - 1);
					
				} else if (type == "mouseOut" && pin != activePin) {
					// Hide pin title and highlights
					pin.hideTitle();
					highlights.visible = false;
					
				} else if (type == "click") {
					// If new pin, set as activePin
					if (pin != activePin) {
						activePin = pin;
						activePin.showTitle();
						activePin.showCourses();
						activePinChanged.dispatch(activePin.getPinLabel());
					// If already active pin, reset active pin
					} else {						
						activePin.hideCourses();
						activePin = null;
						activePinChanged.dispatch(C.MENU_HEADING);
					}
				} else if (type == "menu") {					
					// Hide previous active pin
					if (activePin) {
						activePin.hideTitle();
						activePin.hideCourses();
					}
					
					// Set new active pin and show information					
					activePin = pin;
					activePinChanged.dispatch(pin.getPinLabel());
					
					activePin.showTitle();
					activePin.showCourses();
					highlights.visible = true;
					highlights.gotoAndStop(pin.getPinFrame());
					this.setChildIndex(pin, this.numChildren - 1);					
				}				
			} else {
				// If active pin exists, reset it
				if (activePin) {
					activePin.hideTitle();
					activePin.hideCourses();
					highlights.visible = false;
					activePin = null;
				}
			}
		}
		
		// Scale the pins so they are not affected by zoom
		public function scaleChildren() {			
			for (var i:int = 0; i < pins.length; i++) {				
				pins[i].scaleX = 1 / this.scaleX;
				pins[i].scaleY = 1 / this.scaleY;				
			}
		}
				
		// Handler for when menu item is clicked
		public function menuItemClicked(pinName:String) {
			var pin:Pin;
			for (var i:int = 0; i < pins.length; i++) {
				if (pins[i].name == pinName) {
					pin = pins[i];					
					toggleActivePin(pin, "menu");		
				}
			}			
		}
		
		// ID was passed in URL
		public function idPassedIn(id:int) {
			var pin:Pin;			
			for (var i:int = 0; i < pins.length; i++) {
				if (pins[i].getCategoryId() == id) {
					pin = pins[i];					
					toggleActivePin(pin, "menu");		
				}
			}			
		}
	}
	
}
