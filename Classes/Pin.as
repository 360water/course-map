package  {
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	public class Pin extends Sprite {
		
		private var pinTitle:PinInformation;
		private var pinCourses:PinInformation;

		public function Pin() {
			
			pinTitle = new PinInformation(setPinLabel());
			pinTitle.x = 10;
			pinTitle.y = -pinTitle.height / 2;
			
			pinCourses = new PinInformation(null, setPinCourses());
			pinCourses.x = 10;
			pinCourses.y = pinTitle.y + pinTitle.height;
						
			this.addEventListener(MouseEvent.MOUSE_OVER, toggleTitle);
			this.addEventListener(MouseEvent.MOUSE_OUT, toggleTitle);
			this.addEventListener(MouseEvent.CLICK, toggleCourses);
			
		}
		
		private function toggleTitle(e:MouseEvent) {						
			if (this.contains(pinTitle)) {
				if (!this.contains(pinCourses)) {
					this.removeChild(pinTitle);
				}
				
			} else if (!this.contains(pinTitle)) {
				this.addChild(pinTitle);
			}
			
			parent.setChildIndex(this, parent.numChildren - 1);
		}
		
		private function toggleCourses(e:MouseEvent) {
			if (!this.contains(pinTitle)) {
				this.addChild(pinTitle);
			}			
			
			if (!this.contains(pinCourses)) {
				this.addChild(pinCourses);
			} else if (this.contains(pinCourses)) {
				this.removeChild(pinCourses);
			}
			parent.setChildIndex(this, parent.numChildren - 1);
		}
		
		private function setPinLabel():String {
			for (var i:int = 0; i < C.MENU_ITEMS.length; i++) {
				if (C.MENU_ITEMS[i].pin == this.name) {
					return C.MENU_ITEMS[i].itemLabel;	
				}
			}
			return null;
		}
		
		private function setPinCourses():Array {
			for (var i:int = 0; i < C.MENU_ITEMS.length; i++) {
				if (C.MENU_ITEMS[i].pin == this.name) {
					return C.MENU_ITEMS[i].courses;	
				}
			}
			return null;
		}

	}
	
}
