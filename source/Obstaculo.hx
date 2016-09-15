package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class Obstaculo extends FlxSprite{
	var danio:Int = 5;
	public function new(?X:Float=0, ?Y:Float=0){
		super(X, Y);
		loadGraphic(AssetPaths.basesDestructibles__png, true, 16, 8);
		animation.add("damage1", [1], 30, true);
		animation.add("damage2", [2], 30, true);
		animation.add("damage3", [3], 30, true);
		animation.add("damage4", [4], 30, true);
	}
	override public function update(elapsed:Float):Void{
		verificarDanio();
		super.update(elapsed);
	}
	public function verificarDanio(){
		switch (danio){
			case 4:
				animation.play("damage1");
			case 3:
				animation.play("damage2");
			case 2:
				animation.play("damage3");
			case 1:
				animation.play("damage4");
			case 0:
				animation.stop();
				kill();
		}
	}
	public function hacerDanio(){
		if (danio > 0){
			danio--;
		}
	}
}