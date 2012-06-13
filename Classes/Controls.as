package  {
	import flash.display.MovieClip;
	
	public class Controls extends MovieClip {
		
		// Publicly accessible singleton instance
		public static var instance:Controls = new Controls();		
		
		private var m_controls:Controls;
		
		// Getters and Setters
		public function set controls(ctrl:Controls):void {
			m_controls = ctrl;
		}

		public function get controls():Controls {
			return m_controls;
		}
	}	
}
