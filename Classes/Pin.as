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
		public function getPinLabel():String { return pinLabel; }

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
		
		public function showTitle() {			
			pinTitle.visible = true;			
		}
		
		public function hideTitle() {
			pinTitle.visible = false;			
		}
		
		public function showCourses() {			
			pinCourses.visible = true;
			trace(this.y);
			if (pinTitle.visible == false) {
					pinTitle.visible = true;						
			}
		}
		
		public function hideCourses() {
			pinCourses.visible = false;			
		}
	}	
}
