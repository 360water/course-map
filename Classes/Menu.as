package {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.display.Shape;

	public class Menu extends MovieClip {

		// Array to store the attributes of the menu items
		private var menuItems:Array;
		
		// Array to store the menu item objects
		private var menuObjects:Array;
		public function getMenuObjects():Array { return menuItems; }

		// Menu objects
		private var menuItem:MenuItem;
		private var menuHeading:MenuHeading;		
		private var menuContainer:MovieClip;
		private var menuButton:MenuButton;

		// Menu status variables
		private var menuOpening:Boolean;
		private var menuClosing:Boolean;
		private var menuOpen:Boolean;

		// Constructor
		public function Menu() {
			this.addEventListener(Event.ADDED_TO_STAGE, initializeMenu);
		}

		private function initializeMenu(e:Event) {
			this.removeEventListener(Event.ADDED_TO_STAGE, initializeMenu);
			
			// Create the menu information
			menuItems = C.MENU_ITEMS;
			
			menuObjects = new Array;

			// Create the menu items
			menuButton = new MenuButton;									
			menuButton.alpha = 0.9;
			
			menuContainer = new MovieClip;
			
			// Add menu items into the menu container
			for (var i:int = 0; i < menuItems.length; i++) {
				menuItem = new MenuItem(menuItems[i].itemLabel,menuItems[i].pin);
				menuItems[i] = menuItem;				
				menuItem.y = menuItem.height * i - (i + 1) * 2;				
				menuContainer.addChild(menuItem);
				menuObjects.push(menuItem);
			}
						
			menuContainer.y = menuButton.height - menuContainer.height;
			menuContainer.alpha = 0.9;
			
			menuHeading = new MenuHeading;						
			menuHeading.x = menuButton.width + 5;			
			menuHeading.alpha = 0.9;
			menuHeading.heading.text = C.MENU_HEADING.toUpperCase();
			
			// Create a mask for the menu items
			var rectMask:Shape = new Shape();
    		rectMask.graphics.beginFill(0xFF0000, 1);
    		rectMask.graphics.drawRect(menuButton.x - 1, 
									   menuButton.y + menuButton.height - 1,
									   menuButton.width, 
									   menuContainer.height);
    		rectMask.graphics.endFill();
			this.addChild(rectMask);
			     		
			// App the mask to the menuContainer
    		menuContainer.mask = rectMask;
						
			// Add menu elements to the stage
			this.addChild(menuHeading);
			this.addChild(menuContainer);
			this.addChild(menuButton);

			// Add event listener for clicking the menu button
			menuButton.addEventListener(MouseEvent.CLICK, toggleMenu);

			// Add an event listener to update the menu
			this.addEventListener(Event.ENTER_FRAME, update);			
		}

		// Tooggle whether the menu is opening or closing
		private function toggleMenu(e:MouseEvent) {
			if (menuOpen || menuOpening) {
				menuOpening = false;
				menuOpen = false;
				CloseMenu();
			} else if (menuClosing || menuOpen == false) {
				menuClosing = false;
				menuOpening = true;
			}			
		}

		// Update the position of the menu
		private function update(e:Event) {
			if (menuOpening) {				
				menuButton.menuIcon.rotation -=  180 / (menuItems.length * C.MENU_SPEED);

				menuContainer.y +=  (menuContainer.height / menuItems.length) / C.MENU_SPEED;

				if (menuContainer.y >= menuButton.height) {
					menuContainer.y = menuButton.height;
					menuOpening = false;
					menuOpen = true;
					menuButton.menuIcon.rotation = 180;					
				}
			}

			if (menuClosing) {
				menuButton.menuIcon.rotation +=  180 / (menuItems.length * C.MENU_SPEED);

				menuContainer.y -=  menuItem.height / C.MENU_SPEED;

				if (menuContainer.y <= menuButton.height - menuContainer.height) {
					menuContainer.y = menuButton.height - menuContainer.height;
					menuClosing = false;
					menuButton.menuIcon.rotation = 0;
				}
			}
		}

		// Close the menu
		public function CloseMenu() {
			menuOpen = false;
			menuClosing = true;
		}
		
		// Change the menu heading
		public function changeMenuHeading(label:String = C.MENU_HEADING) {
			menuHeading.heading.text = label.toUpperCase();
		}
	}
}