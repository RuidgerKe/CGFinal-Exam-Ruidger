# Shader 1: Color Correction
The first shader I made was the color correction shader, but what was the implementation process for what I did and why I decided to implement it the way I did.
Diagram:

Task: Implement Color Correction Shader for Yoshi Game -> What art style I wanted to make out of it -> realistic -> basic color correction shader was implemented referencing lecture content -> when should an object be color corrected within the game? -> when yoshi needs to rest due to excessive attacking -> adds a sinetime to the color correction specifically for the alpha variable -> makes yoshi flash a color while maintaining yoshi's texture but tells the player yoshi can't shoot 

This was the basic breakdown on what I did with the color correction shader and the diagram in which I tackled issues when and why I made it the way I did. 
Now for a more indepth explanation of how the shader operates and why I made this decision. 
The first decision I made was to determine for what purpose was this color correction shader be used for. After pondering, I decided to use it for when the player fires too rapidly causing them to be placed in a vulnerable state. 
After that decision I went to work with implementing the shader. 
![alt text](image.png)
The shader's code is relatively straightforward. The properties for it are just the main texture and the color tint. Due to the realistic nature of this graphical update, ensuring that the player can still see the yoshi texture throughout the state make it more readible and subtle as it isn't a giant blotch of color in the middle of the screen.
Then I went to work for ensuring that the color correction doesn't take over the textures. Within that same implementation, I added the SinTime function. The purpose of this function is to make the yoshi flash the color red, to show it as a debuff and alerts the player. 
Sometimes players won't realize their character has changed color, by adding this sintime, which only affects the alpha, it ensures that the player will be alerted of their current state within the game. 

# Shader 2: Scrolling Shader
The next mandetory shader for me to implement was the scrolling shader. With the direction I was going, I wanted to use it to make the player feel as if the grass and forest are movin around the player. 
Even if the player themselves aren't actually moving and are static. By implementing this scrolling shader, it gives the illusion of movement rather than actually make them move around an open level. 
For the type of game this is, it's more optimal and resource saving to have everything move around th player rather than the player move themselve. As the perspective of the player stays consistent throughout the playthrough. 
It was during the implementation of this shader that I wanted to go a more spooky atmosphere. By adding a wind effect similar to that of the foam from the wave shader, it gives a more ominous atmosphere that I really liked. 
This can be for the level in which Mario is dealing with the Boo type enemines, which are ghosts themselves. 
![alt text](image-1.png)
The second implementation I tried to add was the bump mapping.
![alt text](image-3.png)
The main decision behind this addition was to make it more realistic. By having the trees appear as if they were 3D, despite being a 2D image. It would give the sense of realism. 
I also add the scrolling effect onto the normal and the bump mapping to ensure that the 3D effect is applied to th scrolling effect as well.
It would look incredible awkward if the normals are static andeverything else was moving by the player. 
Which works for my level of this game, which is the running through the forest and shooting Boos!
