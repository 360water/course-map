package  {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	public class Menu extends MovieClip {
		
		// Array to store the attributes of the menu items
		private var menuItems:Array;
		
		// Menu item object
		private var menuItem:MenuItem;
		
		// Menu container
		private var menuContainer:MovieClip;
		
		// Button to toggle the menu
		private var menuButton:MenuButton;
		
		// Menu status variables
		private var menuOpening:Boolean;
		private var menuClosing:Boolean;
		private var menuOpen:Boolean;
		
		// Menu toggle speed (higher is slower)
		private var menuToggleSpeed:int = 3;		

		// Constructor
		public function Menu() {			
			this.addEventListener(Event.ADDED_TO_STAGE, initializeMenu);
		}
		
		private function initializeMenu(e:Event) {
			this.removeEventListener(Event.ADDED_TO_STAGE, initializeMenu);			
			
			// Create a button to toggle the menu
			menuButton = new MenuButton;
			
			// Create a container to hold the menu items
			menuContainer = new MovieClip;						
			
			menuItems = new Array();
			menuItems.push({itemLabel:"Process Area 1", pin:"process1"}); 
			menuItems.push({itemLabel:"Process Area 2", pin:"process2"}); 
			menuItems.push({itemLabel:"Process Area 3", pin:"process3"});			
			
			for (var i:int = 0; i < menuItems.length; i++) {							
				menuItem = new MenuItem(menuItems[i].itemLabel, menuItems[i].pin);				
				menuItem.x = 0;
				menuItem.y = menuItem.height * i;
				menuContainer.addChild(menuItem);				
			}
						
			menuContainer.y = menuButton.height - menuContainer.height;
			this.addChild(menuContainer);
			this.addChild(menuButton);
			
			// Add event listener for clicking the menu button
			menuButton.addEventListener(MouseEvent.CLICK, toggleMenu);
						
			// Add an event listener to update the menu
			this.addEventListener(Event.ENTER_FRAME, update);
		}
				
		// Tooggle whether the menu is opening or closing
		private function toggleMenu(e:MouseEvent)
		{			
			if (menuOpen || menuOpening)
			{
				menuOpening = false;
				menuOpen = false;
				CloseMenu();		
			}
			else if (menuClosing || menuOpen == false)
			{
				menuClosing = false;
				menuOpening = true;			
			}
			trace("menuClosing = " + menuClosing + " menuOpening = " + menuOpening + " menuOpen = " + menuOpen);
		}
		
		// Update the position of the menu
		private function update(e:Event)
		{
			if (menuOpening)
			{				
				menuButton.menuIcon.rotation -= 180/menuItem.height/menuToggleSpeed;
				for (var i:int = 0; i < menuItems.length; i++)
				{
					menuContainer.y += menuItem.height / menuToggleSpeed;
				}
			
				if (menuContainer.y >= menuButton.height)
				{					
					menuContainer.y = menuButton.height;
					menuOpening = false;
					menuOpen = true;
					menuButton.menuIcon.rotation = 180;
				}
			}
			
			if (menuClosing)
			{
				trace(menuButton.menuIcon.rotation);
				menuButton.menuIcon.rotation += 12.86;
				menuItems.y -= 12.5;
				
			
				if (menuItems.y <= 0)
				{
					menuItems.y = 0;					
					menuClosing = false;					
					menuButton.menuIcon.rotation = 0;
				}
			}
		}
		
		// Close the menu
		public function CloseMenu()
		{			
			menuOpen = false;
			menuClosing = true;			
		}	
	}	
}
