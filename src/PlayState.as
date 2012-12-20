package  
{
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	public class PlayState  extends FlxState
	{
		
		private var state:int = 0;
		private const S_INTRO:int = 0;
		private const S_SUBURB:int = 1;
		private const S_CITY:int = 2;
		private const S_DONE:int = 3;
		private const S_WINDOW:int = 4;
		
		private var g_bg:FlxSprite =  new FlxSprite;
		
		private var g_fish:FlxSprite = new FlxSprite(425, 273);
		private var g_clock:FlxSprite = new FlxSprite(600, 43);
		private var g_book:FlxSprite = new FlxSprite(600, 312);
		private var g_rug:FlxSprite = new FlxSprite(134, 318);
		private var g_key:FlxSprite = new FlxSprite(265, 508, Assets.key);
		private var g_sm_fam_port:FlxSprite = new FlxSprite(463, 18, Assets.familyportrait_small);
		private var g_laundry:FlxSprite = new FlxSprite(324, 392);
		private var g_suburb_door:FlxSprite = new FlxSprite(720, 220);
		private var group_suburb:FlxGroup = new FlxGroup;
		
		private var g_city_door:FlxSprite = new FlxSprite(3, 3);
		private var g_city_clock:FlxSprite = new FlxSprite(290, 46);
		private var g_cellphone:FlxSprite = new FlxSprite(272, 266, Assets.cellphone);
		private var g_pictures:FlxSprite = new FlxSprite(112, 69, Assets.pictures);
		private var g_window:FlxSprite = new FlxSprite(715, 58);
		private var group_city:FlxGroup = new FlxGroup;
		
		private var g_arrow:FlxSprite = new FlxSprite(10, 10);
		
		override public function create():void 
		{
			state = S_INTRO;
			
			g_bg.loadGraphic(Assets.room_suburb);
			
			add(g_bg);
			
			// City graphical assets
			g_city_door.makeGraphic(50, 450, 0x00ffffff);
			group_city.add(g_city_door);
			
			g_city_clock.makeGraphic(50, 50, 0x00ffffff);
			group_city.add(g_city_clock);
			
			group_city.add(g_cellphone);
			group_city.add(g_pictures);
			
			g_window.makeGraphic(83, 178, 0x00ffffff);
			group_city.add(g_window);
			
			// Suburb graphical assets
			g_fish.loadGraphic(Assets.fishup, true, false, 116, 54);
			g_fish.frame = 1;
			
			group_suburb.add(g_fish);
			
			g_clock.loadGraphic(Assets.clock, true, false, 84, 105);
			group_suburb.add(g_clock);
			
			g_book.loadGraphic(Assets.books, true, false, 63, 105);
			g_book.visible = false;
			group_suburb.add(g_book);
			
			g_rug.loadGraphic(Assets.rug, true, false, 222, 208);
			g_rug.frame = 1;
			group_suburb.add(g_rug);
			
			g_key.visible = false;
			group_suburb.add(g_key);
			
			group_suburb.add(g_sm_fam_port);
			
			g_laundry.loadGraphic(Assets.laundry, true, false, 250, 170);
			g_laundry.frame = 1;
			g_laundry.width = g_laundry.width - 120;
			g_laundry.offset.x = 130;
			g_laundry.x += 130;
			g_laundry.height = 100;
			g_laundry.offset.y = 35;
			g_laundry.y += 35;
			group_suburb.add(g_laundry);
			
			g_suburb_door.makeGraphic(80, 80, 0x00ffffff);
			group_suburb.add(g_suburb_door);
			
			add(group_suburb);
			add(group_city);
			group_city.exists = false;
			
			// other
			g_arrow.loadGraphic(Assets.arrow, true, false, 100, 100);
			g_arrow.visible = false;
			add(g_arrow);
			
			Mouse.show();

			
		}
		override public function destroy():void 
		{
			super.destroy();
		}
		
		
		private var jp_mouse:Boolean = false;
		
		override public function update():void 
		{
			Mouse.show();
			Mouse.cursor = MouseCursor.ARROW;
			jp_mouse = FlxG.mouse.justPressed();
			switch (state) {
				case S_INTRO:
					update_intro();
					break;
				case S_SUBURB:
					update_suburb();
					break;
				case S_CITY:
					update_city();
					break;
				case S_DONE:
					update_done();
					break;
				case S_WINDOW:
					update_window();
					break;
			}
			super.update();
		}
		
		private function update_intro():void {
			state = S_SUBURB;
		}
		
		
		
		private function update_suburb():void {
			
			// Need to click fish first
			if (g_fish.alive) {
				if (mouse_in(g_fish) && g_fish.alive) {
					hand();
					if (jp_mouse) {
						g_fish.frame = 0;
						g_fish.alive = false;
					}
				} 
			} else {
				if (mouse_in(g_book) && g_book.alive) {
					hand();
					if (jp_mouse) {
						g_book.alive = false;
						g_book.visible = true;
					}
				}
				// Clicking rug reveals key
				if (mouse_in(g_rug) && g_rug.alive) {
					hand();
					if (jp_mouse) {
						g_rug.alive = false;
						g_key.visible = true;
						g_rug.frame = 0;
						return;
					}
				}
				
				// Clicking key opens door
				if (mouse_in(g_key) && g_key.visible) {
					hand();
					if (jp_mouse) {
						g_key.visible = false;
						R.gs[R.GS_GOT_KEY] = true;
					}
					// OPEN DOOR
				}
				
				if (mouse_in(g_clock)) {
					hand();
				}
				
				if (mouse_in(g_sm_fam_port)) {
					hand();
				}
				
				if (g_laundry.alive && mouse_in(g_laundry)) {
					hand();
					if (jp_mouse) {
						g_laundry.frame = 0;
						g_laundry.alive = false;
					}
				}
				
				if (R.gs[R.GS_GOT_KEY] && mouse_in(g_suburb_door)) {
					hand();
					if (jp_mouse) {
						group_suburb.exists = false;
						group_city.exists = true;
						state = S_CITY;
						g_bg.loadGraphic(Assets.room_city, false, false, 800, 600);
					}
				}
			}
		}
		
		private function hand():void {
			Mouse.cursor = MouseCursor.HAND;
		}
		private function update_city():void {
			if (mouse_in(g_city_door)) {
				hand();
				if (jp_mouse) {
					group_city.exists = false;
					group_suburb.exists = true;
					state = S_SUBURB;
					g_bg.loadGraphic(Assets.room_suburb, false, false, 800, 600);
				}
			}
			
			if (mouse_in(g_cellphone)) {
				hand();
				if (jp_mouse) {
					
				}
			}
			
			if (mouse_in(g_pictures)) {
				hand();
				if (jp_mouse) {
					
				}
			}
			
			if (mouse_in(g_window)) {
				hand();
				if (jp_mouse) {
					state = S_WINDOW;
					group_city.exists = false;
					g_arrow.visible = true;
					g_bg.loadGraphic(Assets.windowclose, false, false, 800, 600);
				}
			}
			
		}
		
		private function update_window():void {
			if (mouse_in(g_arrow)) {
				g_arrow.frame = 1;
				hand();
				if (jp_mouse) {
					state = S_CITY;
					group_city.exists = true;
					g_arrow.visible = false;
					g_bg.loadGraphic(Assets.room_city, false, false, 800, 600);
				}
			} else {
				g_arrow.frame = 0;
			}
		}
		private function update_done():void {
			
		}
		
		private function mouse_in(o:FlxSprite):Boolean {
			var x:int = FlxG.mouse.screenX;
			var y:int = FlxG.mouse.screenY;
			
			if (x >= o.x && x <= o.x + o.width && y <= o.y + o.height && y >= o.y) {
				return true;
			}
			return false;
		}
	}

}