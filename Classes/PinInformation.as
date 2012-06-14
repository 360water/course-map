package {
	import flash.display.Sprite;
	import flash.text.TextField;

	public class PinInformation extends Sprite {

		public function PinInformation(title:String = null, courses:Array = null) {
			this.alpha = 0.9;
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
					this.addChild(pinCourse);
					trace(courses[i]);
					trace(pinCourse.height);
				}
				var pinLink = new PinLink;
				pinLink.y = pinCourse.y + pinCourse.height - 1;
				this.addChild(pinLink);
			}
			
		}
	}

}