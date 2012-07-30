package  {
	// This file stores all of the constants use throughout the program.
	public class C {		
		// Menu Heading
		public static const MENU_HEADING:String = "Bossier City WTP";
		
		// Menu Items
		public static const MENU_ITEMS = new Array();
		MENU_ITEMS.push({itemLabel:"Solids Contact Blanket Clarifier", 
						 pin:"blanketClarifier",
						 courses:['Clarifiers', 
								  'Mixers'],
						 highlightFrame:1,
						 categoryId:1748 
						 });
		MENU_ITEMS.push({itemLabel:"All Ozone", 
						 pin:"ozone",
						 courses:['Raw Water Ozone Injection', 
								  'Raw Water Ozone Destruction', 
								  'Pre-Filter East Ozone Injection', 
								  'Pre-Filter West Ozone Injection',
								  'Post Membrane Ozone Injection',
								  'Post Membrane Ozone Destruction'],
						 highlightFrame:2,
						 categoryId:1840
						 });
		MENU_ITEMS.push({itemLabel:"Liquid Oxygen System", 
						 pin:"liquidOxygen",
						 courses:['Liquid Oxygen System'],
						 highlightFrame:3,
						 categoryId:1839
						 });						 
		MENU_ITEMS.push({itemLabel:"Raw Water Ozone Contactors", 
						 pin:"rawOzone",
						 courses:['Raw Water Ozone Injection',
								  'Raw Water Ozone Destruction'],
						 highlightFrame:4,
						 categoryId:1840,
						 postDisabled: true
						 });
		MENU_ITEMS.push({itemLabel:"Ozone Off Gas Destruction", 
						 pin:"ozoneDestruction",
						 courses:['Ozone Off Gas Destruction System'],
						 highlightFrame:5,
						 categoryId:1843
						 });
		MENU_ITEMS.push({itemLabel:"Carbon Dioxide System", 
						 pin:"carbonDioxide",
						 courses:['Carbon Dioxide System'],
						 highlightFrame:6,
						 categoryId:1841
						 });
		MENU_ITEMS.push({itemLabel:"Solids Contact Clarifiers", 
						 pin:"solidsClarifier",
						 courses:['Solids Contact Clarifiers'],
						 highlightFrame:7,
						 categoryId:1809
						 });
		MENU_ITEMS.push({itemLabel:"Raw Water Blend/Splitter Structure", 
						 pin:"blendStructure",
						 courses:['Sample Pumps'],
						 highlightFrame:8,
						 categoryId:1807
						 });						 
		MENU_ITEMS.push({itemLabel:"Pre-Filter Ozone Contactors", 
						 pin:"preFilterOzone",
						 courses:['Pre-Filter East Ozone Injection', 
								  'Pre-Filter West Ozone Injection'],
						 highlightFrame:9,
						 categoryId:1842,
						 postDisabled: true
						 });
		MENU_ITEMS.push({itemLabel:"High Service and Backwash Pumping", 
						 pin:"backwashPumping",
						 courses:['Backwash and High Service Pumps'],
						 highlightFrame:10,
						 categoryId:1826
						 });
		MENU_ITEMS.push({itemLabel:"High Pressure Service Water", 
						 pin:"highPressureWater",
						 courses:['High Pressure Service Water'],
						 highlightFrame:11,
						 categoryId:1849						 
						 });
		MENU_ITEMS.push({itemLabel:"Membrane Filtration", 
						 pin:"membraneFiltration",
						 courses:['Membranes',
								  'Feed Pumps',
								  'Feed Strainers',
								  'Reverse Flow Pumps',
								  'Chemical Transfer',
								  'Chemical Storage',
								  'Air Scour Blowers',
								  'Air Compressors'],
						 highlightFrame:12,
						 categoryId:1752
						 });
		MENU_ITEMS.push({itemLabel:"Chlorine Building", 
						 pin:"chlorineBuilding",
						 courses:['Chlorination System',
								  'Chlorine Dock Access',
								  'Emergency Chlorine Scrubber'],
						 highlightFrame:13,
						 categoryId:1849
						 });		
		MENU_ITEMS.push({itemLabel:"Ammonia System", 
						 pin:"ammoniaSystem",
						 courses:['Ammoniation System',
								  'Bulk Ammonia Storage'],
						 highlightFrame:14,
						 categoryId:1844
						 });
		MENU_ITEMS.push({itemLabel:"Post Membrane Ozone Contactors", 
						 pin:"postMembraneOzone",
						 courses:['Post Membrane Ozone Injection',
								  'Post Membrane Ozone Destruction'],
						 highlightFrame:15,
						 categoryId:1840,
						 postDisabled: true
						 });
		MENU_ITEMS.push({itemLabel:"Side-Stream Ozone Injection", 
						 pin:"sideStreamOzone",
						 courses:['Ozone Injection System'],
						 highlightFrame:16,
						 categoryId:1842
						 });
		MENU_ITEMS.push({itemLabel:"Chemical Building", 
						 pin:"chemicalBuilding",
						 courses:['Flouride, ZOP, LCH, Polymer, and ACH Feed',
								  'Chemical Transer Pumps',
								  'Misc Chemical Feed'],
						 highlightFrame:17,
						 categoryId:1830
						 });
		MENU_ITEMS.push({itemLabel:"GAC Contactors", 
						 pin:"gacContactors",
						 courses:['Filter & Underdrain',
								  'Air Compressors',
								  'Air Scour Blowers'],
						 highlightFrame:18,
						 categoryId:1821
						 });
		MENU_ITEMS.push({itemLabel:"Sanitary Sewer Lift Station", 
						 pin:"sewerLiftStation",
						 courses:['Sanitary Sewer Lift Station'],
						 highlightFrame:19,
						 categoryId:1851
						 });
		
		// Base URL for Link
		public static const BASE_URL = "/home/index.php?id=";

		// Constants for zooming
		public static const MIN_ZOOM:Number = 1;
		public static const MAX_ZOOM:Number = 4;
		public static const ZOOM_MOUSE_SPEED:Number = 0.1;		// Higher is larger zoom
		public static const ZOOM_BUTTON_SPEED:Number = 0.5;		// Higher is larger zoom
		
		// Constants for panning
		public static const PAN_MOUSE_SPEED:Number = 1.5;		// Higher is faster pan
		public static const PAN_BUTTON_SPEED:Number = 25;		// Higher is faster pan
		
		// Constants for menu opening/closing speed
		public static const MENU_SPEED:Number = 1;				// Lower is faster
	}
	
}
