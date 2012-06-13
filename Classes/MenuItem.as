package  {
	
	import flash.display.MovieClip;
		
	public class MenuItem extends MovieClip {
		
		public function MenuItem(itemLabel:String = 'Menu Item', pinLink:String = null) {
			this.itemLabel.text = itemLabel.toUpperCase();			
		}
	}
	
}
