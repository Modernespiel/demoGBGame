#include <gb/gb.h>          //gbdk library
#include <gb/font.h>        //gbdk library
#include <gb/hardware.h>    //gbdk library
#include <Keys.h>           //ZGB library
#include <SpriteManager.h>  //ZGB library
#include "sSprite.c"
#include "assets/sprites.c"

//Defining some Global objects
#define fadeStep 0x10
#define fadeStart (0x06*fadeStep)

//Declaring Global Variables
static UBYTE colour = 0;
UBYTE spriteSize = 8;

//Initializing sprite params from sSprite.c
struct sSprite player;

//Declaring Functions
void fade();
void placeSprite(struct sSprite* sprite, UINT8 x, UINT8 y);
void setupPlayer();

//Fading Screen on and off (From GBDK documentation example)
void fade(){
    if(colour == 0)
        return;
    switch(colour){
        case fadeStart:
        case fadeStart-4*fadeStep:
            BGP_REG = 0xF9U;
            break;
        case fadeStart-fadeStep:
        case fadeStart-3*fadeStep:
            BGP_REG = 0xFEU;
            break;
        case fadeStart-2*fadeStep:
            BGP_REG = 0xFEU;
            break;
        case fadeStart-5*fadeStep:
            BGP_REG = 0xE4U;
            break;
    }
    colour--;
}

//Allows for placing 16x16px sprites.
void placeSprite(struct sSprite* sprite, UINT8 x, UINT8 y){
    move_sprite(sprite->spriteId[0], x, y);
    move_sprite(sprite->spriteId[1], x + spriteSize, y);
    move_sprite(sprite->spriteId[2], x, y + spriteSize);
    move_sprite(sprite->spriteId[3], x + spriteSize, y + spriteSize);
}

//Initalizing Player Tiles and position
void setupPlayer(){
    player.x = 80;
    player.y = 120;
    player.width = 16;
    player.height = 16;

    set_sprite_tile(0, 0);
    player.spriteId[0] = 0;
    set_sprite_tile(1, 1);
    player.spriteId[1] = 1;
    set_sprite_tile(2, 2);
    player.spriteId[2] = 2;
    set_sprite_tile(3, 3);
    player.spriteId[3] = 3;

    placeSprite(&player, player.x, player.y);
}

void main()
{
    UBYTE i;
    disable_interrupts();
    DISPLAY_OFF;

    //Palette
    BGP_REG = OBP0_REG = 0xE4;  //BGP_REG = Background Palette Register, OBP0_REG = Object Palette Register 0
    OBP1_REG = 0xE0;            //OBP1_REG = Object Palette Register 1

    //Initialize Background
    //set_bkg_data();

    //Drawing Background
    //set_bkg_tiles();

    //Intializing Fonts
    font_t ibm_font;
    font_init();

    //Load Font
    ibm_font = font_load(font_ibm); //96 Tiles

    //Sprite Data
    set_sprite_data(0, sizeof(characterSprites) >> 4, characterSprites);
    setupPlayer();

    DISPLAY_ON;
    enable_interrupts();

    //Show Background and Sprites (GBDK documentation on Metasprites)
    SHOW_BKG; SHOW_SPRITES;
	#if sprite_TILE_H == 16 && sprite_TILE_W == 16
		SPRITES_16x16;
    #elif sprite_TILE_H ==16
        SPRITES_8x16;
	#else
		SPRITES_8x8;
	#endif
    fade();

    // Loop forever
    while(1) {
        //Walking
        //Joypad Up
        if (joypad() & J_UP) {
            player.y -= 2;
            placeSprite(&player, player.x, player.y);
        }
        //Joypad Down
        if (joypad() & J_DOWN) {
            player.y += 2;
            placeSprite(&player, player.x, player.y);
        }
        //Joypad Left
        if (joypad() & J_LEFT) {
            player.x -= 2;
            placeSprite(&player, player.x, player.y);
        }
        //Joypad Right
        if (joypad() & J_RIGHT) {
            player.x += 2;
            placeSprite(&player, player.x, player.y);
        }
    
        for(i = 0; i < 5; i++)
            wait_vbl_done();
    }
}

