package;

/**
 * ...
 * @author ...
 */
class AntiBala extends Bala // porque si
{
	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		loadGraphic(AssetPaths.fish__png, false, 5, 12); // va, en realidad por estas dos cositas.
		flipY = true;//da vuelta la imagen porque estaba mirando a arriba.
	}
}