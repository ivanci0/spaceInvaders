package;

import flixel.FlxGame;
import openfl.Lib;
import openfl.display.Sprite;
<<<<<<< HEAD
import states.MenuState;
=======
import states.PlayState;

>>>>>>> origin/master

class Main extends Sprite
{
	public function new()
	{
		super();
<<<<<<< HEAD
<<<<<<< HEAD
		addChild(new FlxGame(160, 144, states.MenuState)); // ampliado solo para pruebas.
=======
		addChild(new FlxGame(160, 144, MenuState, 3)); // ampliado solo para pruebas.//agrego el 3 q es el zoom o escala ya esta
=======
		addChild(new FlxGame(160, 144,PlayState, 3)); // ampliado solo para pruebas.//agrego el 3 q es el zoom o escala ya esta
>>>>>>> origin/master
																					 //modificado en el project.xml
>>>>>>> origin/master
	}
}
