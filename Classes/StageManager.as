package {
	import flash.display.Stage;
	
	// Singleton class so any other classes can access the stage.

	public class StageManager {
		
		// Publicly accessible singleton instance
		public static var instance:StageManager = new StageManager();

		private var m_stage:Stage;

		// Getters and Setters
		public function set stage(stg:Stage):void {
			m_stage = stg;
		}

		public function get stage():Stage {
			return m_stage;
		}
	}
}