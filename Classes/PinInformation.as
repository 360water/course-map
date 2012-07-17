package {
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.events.MouseEvent;
	import flash.net.*;

	public class PinInformation extends Sprite {
		
		private var request:URLRequest = new URLRequest;
		private var id:int;

		public function PinInformation(title:String = null, courses:Array = null, id = null) {
			
			this.alpha = 0.9;	
			
			// Get id for category link
			this.id = id;
			
			if (title) {				
				var pinTitle:PinTitle = new PinTitle();
				pinTitle.titleText.text = title.toUpperCase();				
				this.addChild(pinTitle);
			}
			
			if (courses) {				
				for (var i:int = 0; i < courses.length; i++) {
					var pinCourse = new PinCourse();
					pinCourse.titleText.text = courses[i];
					pinCourse.y = (i) * pinCourse.height - 1 - (i * 2);
					pinCourse.mouseEnabled = false;
					pinCourse.mouseChildren = false;
					this.addChild(pinCourse);					
				}
				var pinLink = new PinLink;
				pinLink.y = pinCourse.y + pinCourse.height - 1;
				this.addChild(pinLink);				
				pinLink.addEventListener(MouseEvent.CLICK, openLink)				
			}			
		}
		
		private function openLink(e:MouseEvent) {
			request = new URLRequest(C.BASE_URL + String(id));
			navigateToURL(request, "_self");
		}
	}
}