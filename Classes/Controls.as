package  {
	import flash.display.MovieClip;	
	
	public class Controls extends MovieClip {
		
		// Publicly accessible singleton instance
		public static var instance:Controls = new Controls();		
				
		private var m_controls:Controls;
		
		// Create the menu object
		private var menu:Menu;
		
		// Create the zoom and pan controls
		public var panControls:PanControls;
		public var zoomControls:ZoomControls;
		
		// Constructor
		public function Controls() {			
			menu = new Menu;
			menu.x = 5;
			menu.y = 5;
			
			panControls = new PanControls;
			panControls.x = 5;
			panControls.y = 75;
			
			zoomControls = new ZoomControls;
			zoomControls.x = 5;
			zoomControls.y = 175;
			
			
			this.addChild(panControls);
			this.addChild(zoomControls);
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
