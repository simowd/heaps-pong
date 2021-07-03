import hxd.Key;
import h2d.Bitmap;
import h2d.Tile;

enum State {
    PLAYER1;
    PLAYER2;
    CPU;
}

class Bar {

    //* Static Variables
    static var BAR_WIDTH = 20;
    static var BAR_HEIGHT = 150;
    static var SPEED:Float = 200;

    var game : Pong;
    var state : State;

    //* Graphics Handling
    var bmp : h2d.Bitmap;
    var tile : h2d.Tile;
    public var col : h2d.col.Bounds;
    
    //* Position
    var x : Float;
    var y : Float;

    public function new(x,y,state) {
        //get the game instance
        game = Pong.inst;
        //set the position variables
        this.x = x;
        this.y = y;
        //set state
        this.state = state;
        //draw the sprite onto the screen
        tile = h2d.Tile.fromColor(0xFFFFFF, BAR_WIDTH, BAR_HEIGHT);
        bmp = new h2d.Bitmap(tile,game.s2d);

        col = bmp.getBounds();

        //Set bar position
        if(this.state == State.PLAYER2 || this.state == State.CPU){
            this.x = this.x - BAR_WIDTH;
            bmp.x = this.x;
            
        }
        else{
            bmp.x = this.x;
        }
        this.y = this.y - (BAR_HEIGHT/2);
        bmp.y = this.y;
    }

    public function update(dt : Float) {
        InputSystem(dt);
        MovementSystem();
    }

    //Verify Input for both players
    function InputSystem(dt : Float){
        if(y >= 0 && y <= (game.windowHeight - BAR_HEIGHT)){
            if(state == State.PLAYER1){
                if(Key.isDown(Key.W)){
                    y = y - (SPEED * dt);
                }
                if(Key.isDown(Key.S)){
                    y = y + (SPEED * dt);
                }
            }
            else if(state == State.PLAYER2){
                if(Key.isDown(Key.UP)){
                    y = y - (SPEED * dt);
                }
                if(Key.isDown(Key.DOWN)){
                    y = y + (SPEED * dt);
                }
            }   
        }
        if(y < 0){
            y = 0;
        }
        else if(y > (game.windowHeight - BAR_HEIGHT)){
            y = (game.windowHeight - BAR_HEIGHT);
        }
    }

    //Update the bitmap position
    function MovementSystem(){
        bmp.x = x;
        bmp.y = y;
        col = bmp.getBounds();
    }
}