package  {
	import flash.display.MovieClip;	
	
	public class Controls extends MovieClip {
		
		// Publicly accessible singleton instance
		public static var instance:Controls = new Controls();		
				
		private var m_controls:Controls;
		
		// Create the menu object
		private var menu:Menu;
		
		// Constructor
		public function Controls() {
			
			menu = new Menu;
			this.addChild(menu)
		}
		
		// Getters and Setters
		public function set controls(ctrl:Controls):void {
			m_controls = ctrl;
		}

		public function get controls():Controls {
			return m_controls;
		}
	}	
}
