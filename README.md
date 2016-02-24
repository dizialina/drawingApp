#Drawing Application
Application for painting on white canvas by touching your screen

##Your opportunities in this app:
* select size of brush
* select color of brush using RGB color picker
* look preview of size and color in little rect under your canvas
* select eraser for cleaning piece of your picture
* clean all canvas by one click


##In this app I used:
1. Storyboard for making layout and constraints for locating all views.  
2. CGAffineTransform for setting brush size.
3. Also CGAffineTransform and UIView animation block with duration to make animations for picking eraser.
4. CGContextRef for resizing images for buttons.
5. UISliders and its values for setting color by RGB. 
6. Create subclass of UIView and using it as canvas and its redraw after events.  
6. Methods of UIResponder that look after all touches for processing them (touchesBegan, touchesMoved, touchesEnded) combine with CGContextRef, by means of taking every point of touches and paint through them.  
7. Special methods of CGContextRef for setting attributes of brush (color, width, cap).  

