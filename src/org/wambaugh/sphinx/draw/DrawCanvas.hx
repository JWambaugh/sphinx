package org.wambaugh.sphinx.draw;
import nme.display.Bitmap;
import nme.display.BitmapData;
import nme.display.Sprite;
import nme.events.MouseEvent;
import firmament.utils.FBitmapTracer;
import firmament.utils.FTriangulator;
import nme.events.Event;
/**
 * ...
 * @author Jordan Wambaugh
 */

class DrawCanvas extends Sprite
{

	public var bitmap:Bitmap;
	var hasDrawn:Bool;
	var startDraw: { x:Float, y:Float };
	public static inline var DONE_DRAW = 'doneDraw';
	var drawSprite:Sprite;
	public function new(width:Int, height:Int) 
	{
		super();

		
		this.bitmap = new Bitmap(new BitmapData(width, height, true, 0));
		
		this.drawSprite = new Sprite();
		this.addChild(this.bitmap);
		this.graphics.lineStyle(25,0xFF0010DD);
		this.addEventListener(MouseEvent.MOUSE_MOVE, drawTo);
		this.addEventListener(MouseEvent.MOUSE_DOWN, function(e:MouseEvent) { 
			trace('down');
			this.graphics.moveTo(e.localX, e.localY);
			this.hasDrawn = true; 
			this.startDraw = { x:e.localX, y:e.localY };
			trace('end_down');
		} );
		this.addEventListener(MouseEvent.MOUSE_UP, function(e:MouseEvent) { 
			if (this.hasDrawn && this.startDraw!=null) {
				trace('drawing closing line');
				this.graphics.lineTo(startDraw.x, startDraw.y);
				this.bitmap.bitmapData.draw(this);
				this.hasDrawn = false;
				this.dispatchEvent(new Event(DONE_DRAW));
			}
			this.hasDrawn = false;
			
			} );
		
	}
	
	
	public function drawTo(e:MouseEvent) {
		if (this.hasDrawn) {
		
			this.graphics.lineTo(e.localX, e.localY);

			trace(e.localX + " " + e.localY);
		
			if (this.bitmap.bitmapData == null) trace('bm data is null');
			this.bitmap.bitmapData.draw(this,null,null,null,null,true);

		}
		
		
	}
	
	
	public function getShapes(shapeDef:Dynamic) {
		var tracer = new FBitmapTracer(this.bitmap.bitmapData);
		trace('done. Tracing...');
		var poly = tracer.getPolys();
		trace('done Tracing.');
		if (poly == null) return null;
		var triangles = FTriangulator.getTriangles(poly);
		if(triangles == null){
			trace('triangles is null!');
			return null;
		}
		var shapes = new Array<Dynamic>() ;
		for (triangle in triangles) {
			var shape = Reflect.copy(shapeDef);
			shape.type = 'polygon';
			shape.vectors = triangle;
			shapes.push(shape);
		}
		return shapes;
		
	}
}