import h2d.Bitmap;
import h2d.Tile;

enum State {
    PLAYER;
    CPU;
}
class Bar {

    var game : Pong;

    //* Graphics Handling
    var bmp : h2d.Bitmap;
    var tile : h2d.Tile;

    public function new(x,y,state) {
        //get the game instance
        game = Pong.inst;
        //draw the sprite onto the screen
        tile = h2d.Tile.fromColor(0xFFFFFF, 20, 150);
        bmp = new h2d.Bitmap(tile,game.s2d);
    }

}