package {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.display.Shape;
	import flash.geom.Point;
	import org.osflash.signals.Signal;
	
	public class Map extends MovieClip {
		
		private var pins:Array;
		private var activePin:Pin;
		private var tempX:Number;
		private var tempY:Number;
		
		public var activePinChanged:Signal;
									
		public function Map() {			
			// Go to and stop at the first frame
			highlights.visible = false;
			highlights.mouseEnabled = false;
			
			tempX = this.x;
			tempY = this.y;
			
			// Create an array with the pins
			setPins();
						
			this.addEventListener(MouseEvent.MOUSE_OVER, mouseHandler);
			this.addEventListener(MouseEvent.MOUSE_OUT, mouseHandler);
			this.addEventListener(MouseEvent.CLICK, clickHandler);
			this.addEventListener(MouseEvent.MOUSE_DOWN, clickHandler);
			this.addEventListener(MouseEvent.MOUSE_UP, clickHandler);
			this.addEventListener(MouseEvent.MOUSE_WHEEL, zoomHandler);
			
			activePinChanged = new Signal(String);
		}
		
		private function zoomHandler(e:MouseEvent) {
			if (activePin) {
				activePin.infoPlacement();
			}
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
			if (e.target is Pin && !activePin) {				
				toggleActivePin(e.target as Pin, e.type);
			}
		}
		
		// Handler for when the mouse is clicked
		private function clickHandler(e:MouseEvent) {			
			if (e.target is Pin) {
				toggleActivePin(e.target as Pin, e.type);								
			} else if (e.target is Map) {
				if (e.type == "mouseDown") {
					tempX = this.x;
					tempY = this.y;					
				} else if (e.type == "mouseUp") {					
					if (tempX == this.x && tempY == this.y) {
						toggleActivePin();
					} else {
						if (activePin) {
							activePin.infoPlacement();
						}
					}
				}
			}
		}
		
		// Sets/unsets the active pin
		private function toggleActivePin(pin:Pin = null, type:String = null) {
			if (pin) {
				if (type == "mouseOver") {															
					// Show pin title and highlights
					pin.showTitle();
					highlights.visible = true;
					highlights.gotoAndStop(pin.getPinFrame());
					this.setChildIndex(pin, this.numChildren - 1);
					if (activePin) {
						this.setChildIndex(activePin, this.numChildren - 1);								
					}
				} else if (type == "mouseOut" && pin != activePin) {
					// Hide pin title and highlights
					pin.hideTitle();
					highlights.visible = false;
					
				} else if (type == "click") {
					// If new pin, set as activePin
					if (pin != activePin) {
						if (activePin) {
							activePin.hideTitle();
							activePin.hideCourses();
						}
						
						activePin = pin;
						this.setChildIndex(activePin, this.numChildren - 1);
						activePin.showTitle();
						activePin.showCourses();						
						highlights.visible = true;
						highlights.gotoAndStop(activePin.getPinFrame());
						activePinChanged.dispatch(activePin.getPinLabel());
					// If already active pin, reset active pin
					} else {						
						activePin.hideCourses();
						activePin = null;
						activePinChanged.dispatch("");
					}
				} else if (type == "menu") {					
					// Hide previous active pin
					if (activePin) {						
						activePin.hideTitle();
						activePin.hideCourses();						
					}
					
					// Set new active pin and show information					
					activePin = pin;
					
					var pinX = activePin.localToGlobal(new Point()).x;
					var pinY = activePin.localToGlobal(new Point()).y;										
					
					if (pinX > StageManager.instance.stage.stageWidth ||
						pinX < 0 ||
						pinY > StageManager.instance.stage.stageHeight ||
						pinY < 0) {
							this.scaleX = 1;
							this.scaleY = 1;
							this.x = 0;
							this.y = 0;					
							this.scaleChildren();
						}
					
					activePinChanged.dispatch(pin.getPinLabel());					
					highlights.visible = true;
					highlights.gotoAndStop(activePin.getPinFrame());
					activePin.showTitle();
					activePin.showCourses();					
					this.setChildIndex(activePin, this.numChildren - 1);
				}				
			} else {
				// If active pin exists, reset it
				if (activePin) {
					activePin.hideTitle();
					activePin.hideCourses();
					highlights.visible = false;
					activePin = null;
					activePinChanged.dispatch("");
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
		
		// Handler for when menu item is hovered over
		public function menuItemHovered(pinName:String, type:String) {			
			var pin:Pin;
			for (var i:int = 0; i < pins.length; i++) {
				if (pins[i].name == pinName) {
					pin = pins[i];					
					toggleActivePin(pin, type);
				}
			}			
		}
		
		// ID was passed in URL
		public function idPassedIn(id:int) {
			var pin:Pin;
			for (var i:int = 0; i < pins.length; i++) {
				if (pins[i].getCategoryId() == id && !pins[i].getPostDisabled()) {
					pin = pins[i];					
					toggleActivePin(pin, "menu");					
				}
			}			
		}
		
		// Handler for when schematic button is clicked
		public function schematicButtonClicked(pinName:String) {
			var pin:Pin;
			for (var i:int = 0; i < pins.length; i++) {
				if (pins[i].name == pinName) {
					pin = pins[i];					
					toggleActivePin(pin, "menu");					
				}
			}			
		}
	}
	
}
