package  
{
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSave;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxU;
	public class PlayState  extends FlxState
	{
		
		private var state:int = 0;
		private const S_INTRO:int = 0;
		private const S_SUBURB:int = 1;
		private const S_CITY:int = 2;
		private const S_DONE:int = 3;
		private const S_WINDOW:int = 4;
		private const S_BIG_MARISA:int = 5;
		private const S_BIG_PIC:int = 6;
		private const S_BIG_CLOCK:int = 7;
		private const S_CELLPHONE:int = 8;
		private const S_DIARY:int = 9;
		
		private var g_bg:FlxSprite =  new FlxSprite;
		
		private var g_fish:FlxSprite = new FlxSprite(425, 273);
		private var g_clock:FlxSprite = new FlxSprite(600, 43);
		private var g_book:FlxSprite = new FlxSprite(600, 312);
		private var g_rug:FlxSprite = new FlxSprite(134, 318);
		private var g_key:FlxSprite = new FlxSprite(265, 508, Assets.key);
		private var g_sm_fam_port:FlxSprite = new FlxSprite(463, 18, Assets.familyportrait_small);
		private var g_laundry:FlxSprite = new FlxSprite(324, 392);
		private var g_suburb_door:FlxSprite = new FlxSprite(720, 220);
		private var g_alone_book:FlxSprite = new FlxSprite(605, 394);
		private var g_suburb_carpet:FlxSprite = new FlxSprite(0, 540);
		private var group_suburb:FlxGroup = new FlxGroup;
		
		private var g_city_door:FlxSprite = new FlxSprite(3, 3);
		private var g_city_clock:FlxSprite = new FlxSprite(290, 46);
		private var g_cellphone:FlxSprite = new FlxSprite(272, 266, Assets.cellphone);
		private var g_pictures:FlxSprite = new FlxSprite(112, 69, Assets.pictures);
		private var g_window:FlxSprite = new FlxSprite(715, 58);
		private var text_window:FlxText = new FlxText(300, 200, 300);
		private var g_marisa:FlxSprite = new FlxSprite(152, 152);
		private var g_city_floor:FlxSprite = new FlxSprite(57, 462);
		private var group_city:FlxGroup = new FlxGroup;
		
		private var g_diary_back_arrow:FlxSprite = new FlxSprite(330, 510);
		private var g_diary_forward_arrow:FlxSprite = new FlxSprite(510, 510);
		private var g_cellphone_big_active_region:FlxSprite = new FlxSprite(200, 320);
		private var g_arrow:FlxSprite = new FlxSprite(10, 10);
		private var g_black_overlay:FlxSprite = new FlxSprite(0, 0);
		private var g_lg_fam_port:FlxSprite = new FlxSprite(0, 0, Assets.familyportrait);
		
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
			
			g_marisa.makeGraphic(30, 30, 0x00ffffff);
			group_city.add(g_marisa);
			
			g_city_floor.makeGraphic(687, 119, 0x00ffffff);
			group_city.add(g_city_floor);
			
			// Suburb graphical assets
			g_fish.loadGraphic(Assets.fishup, true, false, 116, 54);
			g_fish.frame = 1;
			
			group_suburb.add(g_fish);
			
			g_clock.loadGraphic(Assets.clock, true, false, 84, 105);
			group_suburb.add(g_clock);
			
			g_book.loadGraphic(Assets.books, true, false, 63, 105);
			g_book.width /= 2;
			g_book.height /= 2;
			g_book.x += 40;
			g_book.offset.x = 40;
			
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
			
			g_alone_book.makeGraphic(50, 25, 0x00ff0f0f);
			group_suburb.add(g_alone_book);
			
			g_suburb_carpet.makeGraphic(FlxG.width, 60, 0x00ff0f0f);
			group_suburb.add(g_suburb_carpet);
			
			add(group_suburb);
			add(group_city);
			group_city.exists = false;
			
			// other
			text_window.visible = false;
			text_window.size = 32;
			add(text_window);
			
			g_diary_back_arrow.loadGraphic(Assets.arrow, true, false, 100, 100);
			g_diary_back_arrow.visible = false;
			g_diary_back_arrow.scale.x = g_diary_back_arrow.scale.y = 0.5;
			add(g_diary_back_arrow);
			
			g_diary_forward_arrow.loadGraphic(Assets.arrow, true, false, 100, 100);
			g_diary_forward_arrow.visible = false;
			g_diary_forward_arrow.scale.x = g_diary_forward_arrow.scale.y = 0.5;
			g_diary_forward_arrow.scale.x = -0.5;	
			add(g_diary_forward_arrow);
			
			g_cellphone_big_active_region.makeGraphic(300, 180, 0x00ffffff);
			add(g_cellphone_big_active_region);
			
			g_black_overlay.makeGraphic(800, 600, 0xcc000000);
			g_black_overlay.visible = false;
			add(g_black_overlay);
			
			g_arrow.loadGraphic(Assets.arrow, true, false, 100, 100);
			g_arrow.visible = false;
			add(g_arrow);
			
			g_lg_fam_port.x = (FlxG.width - g_lg_fam_port.width) / 2;
			g_lg_fam_port.y = (FlxG.height - g_lg_fam_port.height) / 2;
			g_lg_fam_port.visible = false;
			add(g_lg_fam_port);
			
			Mouse.show();
			Assets.init();

			
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
				case S_BIG_MARISA:
					update_marisa();
					break;
				case S_BIG_PIC:
					update_pic();
					break;
				case S_BIG_CLOCK:
					update_clock();
					break;
				case S_CELLPHONE:
					update_cellphone();
					break;
				case S_DIARY:
					update_diary();
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
						Assets.play_sound(Assets.s_fish);
						g_fish.frame = 0;
						g_fish.alive = false;
					}
				} else {
					if (jp_mouse) {
						Assets.play_sound(Assets.s_before_fish);
					}
				}
			} else {
				
				if (mouse_in(g_suburb_carpet)) {
					hand();
					if (jp_mouse) {
						Assets.play_sound(Assets.s_floor_suburb);
					}
				}
				if (mouse_in(g_book) && g_book.alive) {
					hand();
					if (jp_mouse) {
						Assets.play_sound(Assets.s_bookshelf);
						g_book.alive = false;
						g_book.visible = true;
					}
				}
				
				if (g_book.visible && mouse_in(g_alone_book)) {
					hand();
					if (jp_mouse) {
						Assets.play_sound(Assets.s_book);
						state = S_DIARY;
						group_suburb.exists = false;
						g_arrow.visible = true;
						g_diary_back_arrow.visible = g_diary_forward_arrow.visible = true;
						g_bg.loadGraphic(Assets.bookscreen_1, false, false, 800, 600);
					}
				}
				// Clicking rug reveals key
				if (mouse_in(g_rug) && g_rug.alive) {
					hand();
					if (jp_mouse) {
						Assets.play_sound(Assets.s_on_rug);
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
						Assets.play_sound(Assets.s_on_key);
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
					if (jp_mouse) {
						g_black_overlay.visible = true;
						g_arrow.visible = true;
						g_lg_fam_port.visible = true;
						state = S_BIG_PIC;
					}
				}
				
				if (g_laundry.alive && mouse_in(g_laundry)) {
					hand();
					if (jp_mouse) {
						Assets.play_sound(Assets.s_laundry);
						g_laundry.frame = 0;
						g_laundry.height = 50;
						g_laundry.width = 50;
						g_laundry.y += 60;
						g_laundry.offset.x -= 80;
						g_laundry.offset.y += 60;
						g_laundry.alive = false;
					}
				} else if (mouse_in(g_laundry)) {
					hand();
					if (jp_mouse) {
						Assets.play_sound(Assets.s_jersey);
					}
				}
				
				if (R.gs[R.GS_GOT_KEY] && mouse_in(g_suburb_door)) {
					hand();
					if (jp_mouse) {
						Assets.start_song();
						Assets.play_sound(Assets.s_enter_city);
						group_suburb.exists = false;
						group_city.exists = true;
						state = S_CITY;
						g_bg.loadGraphic(Assets.room_city, false, false, 800, 600);
					}
				} else if (mouse_in(g_suburb_door)) {
					hand();
					if (jp_mouse) {
						Assets.play_sound(Assets.s_door_before_key);
					}
				}
			}
		}
		
		private function hand():void {
			Mouse.cursor = MouseCursor.HAND;
		}
		private function update_city():void {
			
			if (mouse_in(g_city_floor)) {
				hand();
				if (jp_mouse) {
					Assets.play_sound(Assets.s_city_floor);
				}
			}
			
			if (mouse_in(g_city_door)) {
				hand();
				if (jp_mouse) {
						Assets.stop_song();
					group_city.exists = false;
					group_suburb.exists = true;
					state = S_SUBURB;
					g_bg.loadGraphic(Assets.room_suburb, false, false, 800, 600);
				}
			}
			
			if (mouse_in(g_cellphone)) {
				hand();
				if (jp_mouse) {
					state = S_CELLPHONE;
					group_city.exists = false;
					Assets.play_sound(Assets.s_cellphone);
					g_bg.loadGraphic(Assets.phonescreen_on, false, false, 800, 600);
					g_arrow.visible = true;
				}
			}
			
			if (mouse_in(g_city_clock)) {
				hand();
				if (jp_mouse) {
					state = S_BIG_CLOCK;
					group_city.exists = false;
					g_bg.loadGraphic(Assets.screen_clock, false, false, 800, 600);
					g_arrow.visible = true;
				}
			}
			//
			//if (mouse_in(g_pictures)) {
				//hand();
				//if (jp_mouse) {
					//
				//}
			//}
			//
			if (mouse_in(g_window)) {
				hand();
				if (jp_mouse) {
					state = S_WINDOW;
					Assets.play_sound(Assets.s_window);
					group_city.exists = false;
					g_arrow.visible = true;
					text_window.visible = true;
					g_bg.loadGraphic(Assets.windowclose, false, false, 800, 600);
				}
			}
			
			if (mouse_in(g_marisa)) {
				hand();
				if (jp_mouse) {
					state = S_BIG_MARISA;
					group_city.exists = false;
					g_arrow.visible = true;
					g_bg.loadGraphic(Assets.marisa_picture, false, false, 800, 600);
				}
			}
			
		}
		
		private function update_marisa():void {
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
		
		private var cur_code:String = "";
		private var nrs:Array = new Array("ZERO", "ONE", "TWO", "THREE", "FOUR", "FIVE", "SIX", "SEVEN", "EIGHT", "NINE");
		private var nr_map:Object = { "ZERO":0, "ONE":1, "TWO":2, "THREE":3, "FOUR":4, "FIVE":5, "SIX":6, "SEVEN":7, "EIGHT":8, "NINE":9 };
		private function update_window():void {
			if (mouse_in(g_arrow)) {
				g_arrow.frame = 1;
				hand();
				if (jp_mouse) {
					state = S_CITY;
					group_city.exists = true;
					g_arrow.visible = false;
					text_window.visible = false;
					g_bg.loadGraphic(Assets.room_city, false, false, 800, 600);
					cur_code = "";
				}
			} else {
				g_arrow.frame = 0;
			}
			
			text_window.text = "Enter Code\n\n" + cur_code + "\n-------------";
			
			for each (var s:String in nrs) {
				if (FlxG.keys.justPressed(s)) {
					if (cur_code.length < 10) {
						if (cur_code == "Incorrect") cur_code = "";
						cur_code += nr_map[s].toString();
					}
					break;
				}
			}
			
			if (cur_code.length > 0 && FlxG.keys.justPressed("BACKSPACE")) {
				cur_code = cur_code.slice(0, cur_code.length -1);
			}
			
			if (FlxG.keys.justPressed("ENTER")) {
				if (cur_code == "0000000000") {
					g_bg.loadGraphic(Assets.windowopen);
					text_window.text = "\n\nClick to continue";
					state = S_DONE;
				} else {
					cur_code = "Incorrect";
				}
			}
		}
		
		private function update_clock():void {
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

		private function update_pic():void {
			if (mouse_in(g_arrow)) {
				g_arrow.frame = 1;
				hand();
				if (jp_mouse) {
					state = S_SUBURB;
					group_suburb.exists = true;
					g_arrow.visible = false;
					g_black_overlay.visible = false;
					g_lg_fam_port.visible = false;
				}
			} else {
				g_arrow.frame = 0;
			}
			
		}
		
		private function update_cellphone():void {
			if (mouse_in(g_arrow)) {
				g_arrow.frame = 1;
				hand();
				if (jp_mouse) {
					state = S_CITY;
					group_city.exists = true;
					Assets.stop_sound();
					g_arrow.visible = false;
					g_bg.loadGraphic(Assets.room_city, false, false, 800, 600);
				}
			} else {
				g_arrow.frame = 0;
			}
			
			if (mouse_in(g_cellphone_big_active_region)) {
				hand();
				if (jp_mouse) {
					Assets.play_sound(Assets.s_cellphone_message);
				}
			}
		}
		
		private var diary_page:int = 0;
		private function update_diary():void {
			if (mouse_in(g_arrow)) {
				g_arrow.frame = 1;
				hand();
				if (jp_mouse) {
					state = S_SUBURB;
					group_suburb.exists = true;
					g_arrow.visible = false;
					g_diary_back_arrow.visible = g_diary_forward_arrow.visible = false;
					g_bg.loadGraphic(Assets.room_suburb, false, false, 800, 600);
					diary_page = 0;
					return;
				}
			} else {
				g_arrow.frame = 0;
			}
			
			if (diary_page == 0) {
				g_diary_back_arrow.visible = false;
			} else {
				g_diary_back_arrow.visible = true;
			}
			
			if (diary_page == 3) {
				g_diary_forward_arrow.visible = false;
			} else {
				g_diary_forward_arrow.visible = true;
			}
			
			if (mouse_in(g_diary_back_arrow)) {
				g_diary_back_arrow.frame = 1;
				hand();
				if (jp_mouse && diary_page > 0) {
					diary_page -= 1;
					set_diary_page();
				}
			} else {
				g_diary_back_arrow.frame = 0;
			}
			
			if (mouse_in(g_diary_forward_arrow)) {
				g_diary_forward_arrow.frame = 1;
				hand();
				if (jp_mouse && diary_page < 3) {
					diary_page += 1;
					set_diary_page();
				}
			} else {
				g_diary_forward_arrow.frame = 0;
			}
		}
		
		private function set_diary_page():void {
			if (diary_page == 0) {
				g_bg.loadGraphic(Assets.bookscreen_1, false, false, 800, 600);
			} else if (diary_page == 1) {
				g_bg.loadGraphic(Assets.bookscreen_2, false, false, 800, 600);
			} else if (diary_page == 2) {
				g_bg.loadGraphic(Assets.bookscreen_3, false, false, 800, 600);
			} else {
				g_bg.loadGraphic(Assets.bookscreen_4, false, false, 800, 600);
			}
		}
		private function update_done():void {
			if (mouse_in(text_window)) {
				hand();
				if (jp_mouse) {
					FlxU.openURL("http://luciditygame.com/video2.html");
				}
			}
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