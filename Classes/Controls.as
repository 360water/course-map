package  {
	import flash.display.MovieClip;	
	
	public class Controls extends MovieClip {
		
		// Publicly accessible singleton instance
		public static var instance:Controls = new Controls();						
		private var m_controls:Controls;
		
		// Create the menu object
		private var menu:Menu;
		
		// Stage properties
		private var stageWidth:int;
		private var stageHeight:int;
		
		// Create the zoom and pan controls
		public var panControls:PanControls;
		public var zoomControls:ZoomControls;
		
		// Constructor
		public function Controls(stageWidth:int = 950, stageHeight:int = 650) {			
			this.stageWidth = stageWidth;
			this.stageHeight = stageHeight;
			
			menu = new Menu;
			menu.x = 5;
			menu.y = 5;
						
			panControls = new PanControls;
			panControls.x = stageWidth - panControls.width - 10;
			panControls.y = 50;
			
			zoomControls = new ZoomControls;
			zoomControls.x = stageWidth - zoomControls.width - panControls.width - 30;
			zoomControls.y = panControls.y + panControls.height * 0.5 - zoomControls.height * 0.5;
			
			
			this.addChild(panControls);
			this.addChild(zoomControls);
			this.addChild(menu);
		}
		
		public function changeMenuTitle(menuLabel:String = null) {
			menu.changeMenuHeading(menuLabel);
		}
		
		// Getters and Setters
		public function set controls(ctrl:Controls):void {
			m_controls = ctrl;
		}

		public function get controls():Controls {
			return m_controls;
		}
		
		public function getMenu() {
			return menu;
		}		
	}	
}
