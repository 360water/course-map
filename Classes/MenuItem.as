package  {	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.MouseEvent;	
		
	public class MenuItem extends MovieClip {
		
		private var pinLink:String;	 
		private var menuLabel:String;
		
		public function MenuItem(itemLabel:String = 'Menu Item', pinLink:String = null) {			
			this.menuLabel = itemLabel;
			this.itemLabel.text = itemLabel.toUpperCase();
			this.pinLink = pinLink;
			this.mouseChildren = false;
		}
		
		public function get link():String {
			return pinLink;
		}
		
		public function get label():String {
			return menuLabel;
		}
	}	
}
