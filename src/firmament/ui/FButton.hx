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
	var text:TextField;
	public function new(bitmapD:BitmapData,text:String = '') 
	{
		super();
		this.bitmap = new Bitmap(bitmapD);
		this.text = new TextField();
		this.text.text = text;

		

		this.addChild(this.bitmap);
		this.addChild(this.text);
		

		
	}
	
	
	
	
	
}