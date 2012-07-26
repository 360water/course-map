package  {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;	
	import flash.geom.Point;
	
	public class Pin extends MovieClip {
		
		private var pinTitle:PinInformation;
		private var pinCourses:PinInformation;
				
		private var pinFrame:int;
		private var pinLabel:String;
		private var courses:Array;
		private var id:int;
		
		private var stageWidth:int = StageManager.instance.stage.stageWidth;
		private var stageHeight:int = StageManager.instance.stage.stageHeight;
		private var pinX:int;
		private var pinY:int;
				
		public function getPinFrame():int { return pinFrame; }
		public function getPinLabel():String { return pinLabel; }
		public function getCategoryId():int { return id; }

		public function Pin() {
			this.gotoAndStop(1);
			
			// Set pin position to varibles			
			pinX = this.localToGlobal(new Point()).x;			
			pinY = this.localToGlobal(new Point()).y;
			
			setPinInformation();			
			
			pinTitle = new PinInformation(pinLabel);			
			pinTitle.visible = false;
			pinTitle.mouseEnabled = false;
			this.addChild(pinTitle);
			if (pinTitle.width + pinX > stageWidth) {				
				pinTitle.x = -pinTitle.width;
			}
			
					
			pinCourses = new PinInformation(null, courses, id);						
			pinCourses.visible = false;
			this.addChild(pinCourses);
			pinCourses.x = pinTitle.x;
			
			if (pinCourses.height + pinY > stageHeight) {
				pinCourses.y = -pinCourses.height;
			}
		}
		
		private function setPinInformation() {	
			for (var i:int = 0; i < C.MENU_ITEMS.length; i++) {
				if (C.MENU_ITEMS[i].pin == this.name) {
					pinFrame = C.MENU_ITEMS[i].highlightFrame;
					pinLabel = C.MENU_ITEMS[i].itemLabel;
					courses = C.MENU_ITEMS[i].courses;
					id = C.MENU_ITEMS[i].categoryId;
				}				
			}
		}
		
		public function showTitle() {
			this.gotoAndStop(2);
			// Set pin position to varibles			
			pinX = this.localToGlobal(new Point()).x;			
			
			if (pinX > stageWidth / 2) {
				pinTitle.x = -pinTitle.width - 15;
			} else {
				pinTitle.x = 15;
			}
			
			if (pinCourses.visible == false) {
				pinTitle.y = -pinTitle.height / 2;
			}
			
			pinTitle.visible = true;	
		}
		
		public function hideTitle() {
			this.gotoAndStop(1);
			pinTitle.visible = false;			
		}
		
		public function showCourses() {			
			this.gotoAndStop(2);
			
			// Set the y postion so it fits in the view
			var pinCoursesY = pinCourses.localToGlobal(new Point()).y;
			
			// Set pin courses to line up with the pin title
			pinCourses.x = pinTitle.x;
			
			if (pinCoursesY + pinCourses.height >= stageHeight) {
				pinCourses.y -= pinCoursesY + pinCourses.height - stageHeight;
				pinTitle.y = pinCourses.y - pinTitle.height;
			} else {
				pinCourses.y = pinTitle.y + pinTitle.height;
			}
			
			pinCourses.visible = true;
			
			if (pinTitle.visible == false) {
				pinTitle.visible = true;						
			}
		}
		
		public function hideCourses() {
			this.gotoAndStop(1);
			pinCourses.visible = false;
			pinTitle.y = -pinTitle.height / 2;
			//pinCourses.y = pinTitle.y + pinTitle.height;
		}
	}	
}
