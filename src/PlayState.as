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
		
		private var g_bg:FlxSprite =  new FlxSprite;
		
		private var g_fish:FlxSprite = new FlxSprite(425, 273);
		private var g_clock:FlxSprite = new FlxSprite(600, 43);
		private var g_book:FlxSprite = new FlxSprite(600, 312);
		private var g_rug:FlxSprite = new FlxSprite(134, 318);
		private var g_key:FlxSprite = new FlxSprite(265, 508, Assets.key);
		private var g_sm_fam_port:FlxSprite = new FlxSprite(463, 18, Assets.familyportrait_small);
		private var g_laundry:FlxSprite = new FlxSprite(324, 392);
		private var group_suburb:FlxGroup = new FlxGroup;
		
		private var group_city:FlxGroup = new FlxGroup;
		
		override public function create():void 
		{
			state = S_INTRO;
			
			g_bg.loadGraphic(Assets.room_suburb);
			
			add(g_bg);
			
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
			group_suburb.add(g_laundry);
			
			add(group_suburb);
			add(group_city);
			group_city.exists = false;
			
			Mouse.show();

			
		}
		override public function destroy():void 
		{
			super.destroy();
		}
		override public function update():void 
		{
			
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
			}
			super.update();
		}
		
		private function update_intro():void {
			state = S_SUBURB;
		}
		
		private var jp_mouse:Boolean = false;
		private function update_suburb():void {
			Mouse.cursor = MouseCursor.ARROW;
			jp_mouse = FlxG.mouse.justPressed();
			
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
			}
		}
		
		private function hand():void {
			Mouse.cursor = MouseCursor.HAND;
		}
		private function update_city():void {
			
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