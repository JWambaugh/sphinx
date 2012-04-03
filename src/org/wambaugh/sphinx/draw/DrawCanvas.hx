package org.wambaugh.sphinx.draw;
import nme.display.Bitmap;
import nme.display.BitmapData;
import nme.display.Sprite;
import nme.events.MouseEvent;
/**
 * ...
 * @author Jordan Wambaugh
 */

class DrawCanvas extends Sprite
{

	var bitmap:Bitmap;
	var hasDrawn:Bool;
	var startDraw: { x:Int, y:Int };
	public function new(width:Int, height:Int) 
	{
		this.bitmap = new Bitmap(new BitmapData(width,height));
		this.addChild(this.bitmap);
		this.graphics.lineStyle(1,0xFF00FF);
		this.addEventListener(MouseEvent.MOUSE_MOVE, drawTo);
		this.addEventListener(MouseEvent.MOUSE_DOWN, function(e:MouseEvent) { 
			this.graphics.moveTo(e.localX, e.localY);
			this.hasDrawn = true; 
			
		} );
		this.addEventListener(MouseEvent.MOUSE_UP, function(e:MouseEvent) { this.hasDrawn = false; } );
		super();
	}
	
	
	public function drawTo(e:MouseEvent) {
		if (this.hasDrawn) {
			this.graphics.lineTo(e.localX, e.localY);
			this.bitmap.bitmapData.draw(this);
			trace('Draw!');
		}
		
		
	}
	
}