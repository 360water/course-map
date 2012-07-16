package  {
	import flash.display.Sprite;
	import flash.events.MouseEvent;	
	
	public class Pin extends Sprite {
		
		private var pinTitle:PinInformation;
		private var pinCourses:PinInformation;
				
		private var pinFrame:int;
		private var pinLabel:String;
		private var courses:Array;
		
		private var map:Map;
		
		public function getPinFrame():int { return pinFrame; }

		public function Pin() {
			
			setPinInformation();
			
			pinTitle = new PinInformation(pinLabel);
			pinTitle.x = 10;
			pinTitle.y = -pinTitle.height / 2;					
			pinTitle.visible = false;
			pinTitle.mouseEnabled = false;
			this.addChild(pinTitle);
					
			pinCourses = new PinInformation(null, courses);
			pinCourses.x = 10;	
			pinCourses.y = pinTitle.y + pinTitle.height;
			pinCourses.visible = false;
			this.addChild(pinCourses);
			
			this.addEventListener(MouseEvent.MOUSE_OVER, toggleTitle);
			this.addEventListener(MouseEvent.MOUSE_OUT, toggleTitle);
			this.addEventListener(MouseEvent.CLICK, toggleCourses);
		}
		
		private function setPinInformation() {	
			for (var i:int = 0; i < C.MENU_ITEMS.length; i++) {
				if (C.MENU_ITEMS[i].pin == this.name) {
					pinFrame = C.MENU_ITEMS[i].highlightFrame;
					pinLabel = C.MENU_ITEMS[i].itemLabel;
					courses = C.MENU_ITEMS[i].courses;
				}				
			}
		}
		
		public function toggleTitle(e:MouseEvent) {
			if (e.target is Pin) {			
				if (pinTitle.visible == false && e.type == "mouseOver") {
					pinTitle.visible = true;
					e.target.parent.setActivePin(this);
				} else if (pinCourses.visible == false && e.type == "mouseOut") {					
					pinTitle.visible = false;
					e.target.parent.setActivePin();
				}				
			}			
		}		
		
		public function toggleCourses(e:MouseEvent) {			
			if (e.target is Pin) {
				if (pinCourses.visible == false) {
					pinCourses.visible = true;
					if (pinTitle.visible == false) {
						pinTitle.visible = true;						
					}					
				} else {
					pinCourses.visible = false;
					pinTitle.visible = false;					
				}
			}			
		}
		
		public function hideInformation() {
			pinTitle.visible = false;
			pinCourses.visible = false;
		}
	}
	
}
