package;

import flixel.FlxGame;
import openfl.Lib;
import openfl.display.Sprite;
import states.PlayState;


class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(160, 144,PlayState, 3)); // ampliado solo para pruebas.//agrego el 3 q es el zoom o escala ya esta
																					 //modificado en el project.xml
	}
}
