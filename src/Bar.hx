import h2d.Bitmap;
import h2d.Tile;

enum State {
    PLAYER;
    CPU;
}
class Bar {

    //* Static Variables
    static var BAR_WIDTH = 20;
    static var BAR_HEIGHT = 150;

    var game : Pong;

    //* Graphics Handling
    var bmp : h2d.Bitmap;
    var tile : h2d.Tile;
    
    //* Position
    var x : Float;
    var y : Float;

    public function new(x,y,state) {
        //get the game instance
        game = Pong.inst;
        //set the position variables
        this.x = x;
        this.y = y;
        //draw the sprite onto the screen
        tile = h2d.Tile.fromColor(0xFFFFFF, BAR_WIDTH, BAR_HEIGHT);
        bmp = new h2d.Bitmap(tile,game.s2d);
        //Set bar position
        bmp.x = this.x;
        bmp.y = this.y - (BAR_HEIGHT/2);
    }

}