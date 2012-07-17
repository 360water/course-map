﻿package  {
	// This file stores all of the constants use throughout the program.
	public class C {		
		// Menu Heading
		public static const MENU_HEADING:String = "Bossier City WTP";
		
		// Menu Items
		public static const MENU_ITEMS = new Array();
		MENU_ITEMS.push({itemLabel:"Solids Contact", 
						 pin:"pinSolidsContact",
						 courses:['Membranes Membranes Membranes Membranes Membranes Membranes', 'Feed Pumps', 'Strainers', 'Reverse Flow Pumps'],
						 highlightFrame:1,
						 categoryId:1121 
						 });
		MENU_ITEMS.push({itemLabel:"Membranes", 
						 pin:"pinMembranes",
						 courses:['Membranes', 'Feed Pumps', 'Strainers', 'Reverse Flow Pumps'],
						 highlightFrame:2,
						 categoryId:1122
						 });
		MENU_ITEMS.push({itemLabel:"GAC", 
						 pin:"pinGac",
						 courses:['Membranes', 'Feed Pumps', 'Strainers', 'Reverse Flow Pumps'],
						 highlightFrame:3,
						 categoryId:1123
						 });						 
		MENU_ITEMS.push({itemLabel:"Filters", 
						 pin:"pinFilters",
						 courses:['Membranes', 'Feed Pumps', 'Strainers', 'Reverse Flow Pumps'],
						 highlightFrame:4,
						 categoryId:1125
						 });		
		
		// Base URL for Link
		public static const BASE_URL = "/home/index.php?id=";
		
		// Constants for zooming
		public static const MIN_ZOOM:Number = 1;
		public static const MAX_ZOOM:Number = 3;
		public static const ZOOM_MOUSE_SPEED:Number = 0.1;		// Higher is larger zoom
		public static const ZOOM_BUTTON_SPEED:Number = 0.25;	// Higher is larger zoom
		
		// Constants for panning
		public static const PAN_MOUSE_SPEED:Number = 1.5;		// Higher is faster pan
		public static const PAN_BUTTON_SPEED:Number = 25;		// Higher is faster pan
		
		// Constants for menu opening/closing speed
		public static const MENU_SPEED:Number = 2.5;				// Lower is faster
	}
	
}
