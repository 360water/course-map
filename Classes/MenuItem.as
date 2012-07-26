package  {	
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.MouseEvent;	
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.AntiAliasType;
	import flashx.textLayout.conversion.FormatDescriptor;
	import flash.display.Shape;	
	import flash.geom.ColorTransform;
		
	public class MenuItem extends Sprite {
		
		private var pinLink:String;	 
		private var menuLabel:String;
		private var itemLabel:String;
		private var highlightOn:Boolean;		
		private var menuText:TextField;
		private var menuBackground:Shape;
		private var highlightColor:ColorTransform;
		
		public function MenuItem(itemLabel:String = 'Menu Item', pinLink:String = null) {			
			highlightOn = false;
			highlightColor = new ColorTransform;
			
			this.menuLabel = itemLabel;
			this.itemLabel = itemLabel.toUpperCase();
			this.pinLink = pinLink;
			this.mouseChildren = false;			
			
			DrawMenuItem();
			
			this.addEventListener(MouseEvent.MOUSE_OVER, mouseHandler);
			this.addEventListener(MouseEvent.MOUSE_OUT, mouseHandler);			
		}
		
		private function DrawMenuItem() {
			// Format for menu item text			
			var format = new TextFormat();
			format.color = 0xFFFFFF;
			format.font = "Century Gothic";
			format.size = 10;					
			format.leftMargin = 5;
			format.rightMargin = 5;
			
			// Text field properties
			var menuText = new TextField();
			menuText.width = 260;
			menuText.wordWrap = true;
			menuText.multiline = true;
			menuText.autoSize = "left";
			menuText.selectable = false;
			menuText.embedFonts = true;
			menuText.antiAliasType = AntiAliasType.ADVANCED;
			menuText.text = itemLabel;
			menuText.setTextFormat(format);
			menuText.y = 5;
			
			// Create the background for the menu item
			menuBackground = new Shape();			
			menuBackground.graphics.beginFill(0x8FAEC0, 1);
			menuBackground.graphics.drawRect(0, 0, 260, menuText.height + 10);
			menuBackground.graphics.endFill();
			
			var menuBorder:Shape = new Shape();
			menuBorder.graphics.lineStyle(2, 0xFFFFFF);			
			menuBorder.graphics.drawRect(0, 0, 260, menuText.height + 10);
			
			
			this.addChild(menuBackground);
			this.addChild(menuBorder);
			this.addChild(menuText);
		}
		
		private function mouseHandler(e:MouseEvent) {
			if (e.target is MenuItem) {
				if (e.type == "mouseOver") {
					turnOnHighlight(true);
				} else if (e.type == "mouseOut" && !highlightOn) {
					turnOffHighlight(true);
				}				
			}
		}
		
		public function turnOnHighlight(fromMouse:Boolean = false) {
			if (!fromMouse) {
				highlightOn = true;
			}
			highlightColor.color = 0x3E7799;
			menuBackground.transform.colorTransform = highlightColor;			
		}
		
		public function turnOffHighlight(fromMouse:Boolean = false) {
			if (!fromMouse) {
				highlightOn = false;
			}
			highlightColor.color = 0x8FAEC0;
			menuBackground.transform.colorTransform = highlightColor;			
		}
				
		public function get link():String { return pinLink; }		
		public function get label():String { return menuLabel; }		
		public function get highlight():Boolean { return highlightOn; }
	}	
}
