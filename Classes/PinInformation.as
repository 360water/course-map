package {
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.events.MouseEvent;
	import flash.net.*;
	import flash.display.Shape;
	import flash.text.TextFormat;
	import flash.text.AntiAliasType;
	import flashx.textLayout.conversion.FormatDescriptor;

	public class PinInformation extends Sprite {

		private var request:URLRequest = new URLRequest  ;
		private var id:int;

		public function PinInformation(title:String = null, courses:Array = null, id = null) {

			this.alpha = 0.9;

			// Get id for category link
			this.id = id;
			
			// Create a format object for text
			var format:TextFormat;

			if (title) {
				format = new TextFormat();
				format.color = 0xFFFFFF;
				format.font = "Century Gothic";
				format.size = 14;				
				format.leftMargin = 5;
				format.rightMargin = 5;
				format.align = 'center';

				// Course text field
				var titleText:TextField = new TextField();
				titleText.width = 200;
				titleText.wordWrap = true;
				titleText.multiline = true;
				titleText.autoSize = "left";
				titleText.selectable = false;
				titleText.embedFonts = true;
				titleText.antiAliasType = AntiAliasType.ADVANCED;
				titleText.text = title.toUpperCase();
				titleText.setTextFormat(format);
				titleText.y = 2;				
				
				// Create the background
				var titleBackground:Shape = new Shape();
				titleBackground.graphics.lineStyle(2,0xFFFFFF);
				titleBackground.graphics.beginFill(0x3E7799, 1);
				titleBackground.graphics.drawRect(0, 0, 200, titleText.height + 5);
				titleBackground.graphics.endFill();
				
				// Add elements to stage
				this.addChild(titleText);
				this.addChild(titleBackground);
				this.setChildIndex(titleBackground, 0);
			}

			if (courses) {
				var heightSum:Number = 0;
				for (var i:int = 0; i < courses.length; i++) {
					// Format for course text
					format = new TextFormat();
					format.color = 0xFFFFFF;
					format.font = "Century Gothic";
					format.size = 12.5;
					format.bullet = true;
					format.leftMargin = -10;
					format.rightMargin = 5;				

					// Course text field
					var courseText:TextField = new TextField();
					courseText.width = 200;
					courseText.wordWrap = true;
					courseText.multiline = true;
					courseText.autoSize = "left";
					courseText.selectable = false;
					courseText.embedFonts = true;
					courseText.antiAliasType = AntiAliasType.ADVANCED;
					courseText.text = courses[i];
					courseText.setTextFormat(format);

					// Course text position
					courseText.x = 0;
					courseText.y = heightSum;

					// Add elements to stage
					this.addChild(courseText);

					// Set the total height
					heightSum +=  courseText.height;
				}

				// Create the background
				var courseBackground:Shape = new Shape();
				courseBackground.graphics.lineStyle(2,0xFFFFFF);
				courseBackground.graphics.beginFill(0x3E7799, 1);
				courseBackground.graphics.drawRect(0, -2, 200, heightSum + 5);
				courseBackground.graphics.endFill();

				this.addChild(courseBackground);
				this.setChildIndex(courseBackground, 0);

				var pinLink = new PinLink();
				pinLink.mouseEnabled = true;
				pinLink.y = heightSum + 5 - 2;
				this.addChild(pinLink);
				pinLink.addEventListener(MouseEvent.CLICK, openLink);
			}
		}

		private function openLink(e:MouseEvent) {
			request = new URLRequest(C.BASE_URL + String(id));
			navigateToURL(request, "_self");
		}
	}
}