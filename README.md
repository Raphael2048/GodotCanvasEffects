# GodotCanvasEffects
## Some canvas effects may be useful to you project


![Image](https://github.com/raphael10241024/PicturesToUse/blob/master/all.png?raw=true)


| Effect   | Screentshoot  |  params | extra|
|:----------:|:-------------:|:----------:|:-------:|
| Vignette   |  ![Image](https://github.com/raphael10241024/PicturesToUse/blob/master/Vignette.png?raw=true)   | effect_color, radius, width ||
| Grayscale  |    ![Image](https://github.com/raphael10241024/PicturesToUse/blob/master/Grayscale.png?raw=true)   |   effect_factor ||
|  Pixel     | ![Image](https://github.com/raphael10241024/PicturesToUse/blob/master/Pixel.png?raw=true) |    effect_factor||
| Spedia     |  ![Image](https://github.com/raphael10241024/PicturesToUse/blob/master/Spedia.png?raw=true) |  effect_color, effect_factor||
| Nega      | ![Image](https://github.com/raphael10241024/PicturesToUse/blob/master/Nega.png?raw=true)| effect_factor||
|Gradient| ![Image](https://github.com/raphael10241024/PicturesToUse/blob/master/Gradient.png?raw=true)|color_ul, color_ur, color_bl, color_br, effect_factor||
|Dissolve|![Image](https://github.com/raphael10241024/PicturesToUse/blob/master/Dissolve.png?raw=true) | color, width, noise_texture| need a noise texture, there are one in the demo|
|Shiny|![Image](https://github.com/raphael10241024/PicturesToUse/blob/master/Shiny.png?raw=true) | effect_color, effect_strength, effect_offset, rotation, width, softness|change shader param effect_offset with time to make animation effect|
|Blur|![Image](https://github.com/raphael10241024/PicturesToUse/blob/master/Blur.png?raw=true)| strength| may cost a lot of time on mobile ||
|Outline|![Image](https://github.com/raphael10241024/PicturesToUse/blob/master/Outline.png?raw=true)|effect_color, border||
|Shadow|![Image](https://github.com/raphael10241024/PicturesToUse/blob/master/Shadow.png?raw=true)|effect_color, x_offset, y_offset||

## Usage

Download the shader files and put it in your project, select the canvas node in your project , create a new material for it, add load shader from file(for dissolve effect, you can use the dissolve material direct and assign youself's noise texture).
