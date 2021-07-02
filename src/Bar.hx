import h2d.Tile;

enum State {
    PLAYER;
    CPU;
}
class Bar {
    var bmp : h2d.Bitmap;
    var tile : h2d.Tile;
    

    function new(x,y) {
        tile = h2d.Tile.fromColor(0xFFFFFF, 20, 150);
        bmp = new h2d.Bitmap(tile, s2d);
    }
}