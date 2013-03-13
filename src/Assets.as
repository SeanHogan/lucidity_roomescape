package  
{
	import org.flixel.FlxSound;
	public class Assets 
	{
		[Embed(source = "../res/ok_fishdown.png")] public static const fishdown:Class;
		[Embed(source = "../res/ok_fishup.png")] public static const fishup:Class;
		
		[Embed(source = "../res/phonescreen.png")] public static const phonescreen_on:Class;
		[Embed(source = "../res/phonescreeninactive.png")] public static const phonescreen_off:Class;
		
		[Embed(source = "../res/windowclose.png")] public static const windowclose:Class;
		[Embed(source = "../res/windowopen.png")] public static const windowopen:Class;
		
		[Embed(source = "../res/clockbig_bw.png")] public static const screen_clock:Class;
		
		[Embed(source = "../res/familyportrait.png")] public static const familyportrait:Class;
		[Embed(source = "../res/familyportrait_small.png")] public static const familyportrait_small:Class;
		
		[Embed(source = "../res/marisa.png")] public static const marisa_picture:Class;
		
		[Embed(source = "../res/ok_bookfall.png")] public static const books:Class;
		
		[Embed(source = "../res/ok_celldown.png")] public static const cellphone:Class;
		[Embed(source = "../res/ok_clock.png")] public static const  clock:Class;
		[Embed(source = "../res/ok_key.png")] public static const key:Class;
		[Embed(source = "../res/ok_laundry.png")] public static const laundry:Class;
		[Embed(source = "../res/ok_pictures.png")] public static const pictures:Class;
		
		[Embed(source = "../res/ok_rug.png")] public static const rug:Class;
		
		[Embed(source = "../res/bookscreen01.png")] public static const bookscreen_1:Class;
		[Embed(source = "../res/bookscreen02.png")] public static const bookscreen_2:Class;
		[Embed(source = "../res/bookscreen03.png")] public static const bookscreen_3:Class;
		[Embed(source = "../res/bookscreen04.png")] public static const bookscreen_4:Class;
		[Embed(source = "../res/bookscreen05.png")] public static const bookscreen_5:Class;
		[Embed(source = "../res/bookscreen06.png")] public static const bookscreen_6:Class;
		[Embed(source = "../res/bookscreen07.png")] public static const bookscreen_7:Class;
		
		[Embed(source = "../res/cityroom.png")] public static const room_city:Class;
		[Embed(source = "../res/suburbroom_empty.png")] public static const room_suburb:Class;
		
		
		[Embed(source = "../res/arrow.png")] public static const arrow:Class;
		
		//
		
		[Embed(source = "../res/mp3/oh that's my old diary.mp3")] public static const s_book:Class;
		[Embed(source = "../res/mp3/I keep my books here.mp3")] public static const  s_bookshelf:Class;
		[Embed(source = "../res/mp3/that's better I can move now.mp3")] public static const s_fish:Class;
		[Embed(source = "../res/mp3/I can't move.mp3")] public static const s_before_fish:Class;
		[Embed(source = "../res/mp3/oops I was always a little neater.mp3")] public static const s_laundry:Class;
		[Embed(source = "../res/mp3/that was rico's number.mp3")] public static const  s_jersey:Class;
		[Embed(source = "../res/mp3/locked door.mp3")] public static const s_door_before_key:Class;
		[Embed(source = "../res/mp3/the carpet was always so soft here 1.mp3")] public static const  s_floor_suburb:Class;
		[Embed(source = "../res/mp3/oh look under the rug.mp3")] public static const s_on_rug:Class;
		[Embed(source = "../res/mp3/I wonder what this opens.mp3")] public static const  s_on_key:Class;
		[Embed(source = "../res/mp3/the room at my dad's house.mp3")] public static const  s_enter_city:Class;
		[Embed(source = "../res/mp3/I haven't seen this room in so long.mp3")] public static const s_city_floor:Class;
		[Embed(source = "../res/mp3/my old cellphone.mp3")] public static const s_cellphone:Class;
		[Embed(source = "../res/mp3/this window is stuck!.mp3")] public static const  s_window:Class;
		[Embed(source = "../res/mp3/Zaria Girl.mp3")] public static const  s_cellphone_message:Class;
		[Embed(source = "../res/mp3/Father's Room Soundtrack.mp3")] public static const  s_city_song:Class;
		
		private static var snd:FlxSound;
		private static var song:FlxSound;
		
		public static function init():void {
			snd = new FlxSound;
			song = new FlxSound;
		}
		public static function play_sound(embed:Class):void {
			snd.loadEmbedded(embed);
			snd.play(true);
		}
		
		public static function stop_sound():void {
			snd.stop();
		}
		
		public static function stop_song():void {
			song.stop();
		}
		public static function start_song():void {
			song.loadEmbedded(s_city_song, true);
			song.volume = 0.5;
			song.play(true);
		}
	}

}