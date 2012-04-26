package firmament.core;
import nme.display.BitmapData;
import nme.geom.Matrix;
import nme.display.IBitmapDrawable;
import nme.geom.Point;
import nme.events.EventDispatcher;
import nme.display.Tilesheet;
import nme.geom.Rectangle;
/**
 * ...
 * @author jordan
 */
class FTilesheetRenderer extends EventDispatcher ,implements FRenderer 
{

	public function new() 
	{
		super();
	}
	
	public function render(item:FRenderable, camera:FCamera):Void {
		
		
		var bmData = item.getCurrentImage();
		if (bmData == null) {
			trace('bmdata is null');
			return;
		}
		
		
		var cameraPos = camera.getTopLeftPosition();
		//var matrix = new Matrix();
		var ratio = camera.getZoom() / item.getImageScale();
		var pos = item.getPosition();
		var nx = ((pos.x - cameraPos.x) * camera.getZoom());
		var ny = ((pos.y - cameraPos.y) * camera.getZoom());
		//matrix.scale(ratio,ratio);
		
		//trace(cameraPos.y);
		
		
	
		var matrix = new Matrix();
		
		
		matrix.translate( -bmData.width/2, -bmData.height/2);
		matrix.rotate(item.getAngle());
		
		if(ratio!=1)matrix.scale(ratio, ratio);
		matrix.translate(nx, ny);
		
		camera.bitmapData.draw(bmData, matrix,null,null,null,true);
		
		
	}
	
}