package firmament.ui;
import nme.display.Bitmap;
import nme.display.BitmapData;
import nme.display.Sprite;
import nme.text.TextField;

/**
 * ...
 * @author Jordan Wambaugh
 */

class FButton extends Sprite
{
	var bitmap:Bitmap;
	var textF:TextField;
	public function new(bitmapD:BitmapData, text:String = '') 
	{
		super();
		this.bitmap = new Bitmap(bitmapD);
		this.textF = new TextField();
		this.textF.text = text;
		this.addChild(this.bitmap);
		this.addChild(this.textF);
		

		
	}
	
	
}