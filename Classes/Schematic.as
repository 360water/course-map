package  {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import org.osflash.signals.Signal;
	
	public class Schematic extends MovieClip {
		
		public var schematicButtonClicked:Signal;

		public function Schematic() {
			
			schematicButtonClicked = new Signal(String);			
			this.addEventListener(MouseEvent.CLICK, clickHandler);
			
		}
		
		private function clickHandler(e:MouseEvent) {
			if (e.target is SchematicButton) {
				schematicButtonClicked.dispatch(e.target.name);						
			}
		}

	}
	
}
