# Virtual-Tour-Guide
Designed to assist in explaining the contents of museum exhibits.

Written by Justin Stucki

Project team: Shawn Sandberg, Justin Stucki, Matt Tomlinson, 
Cody Weller, and Page Wiberg

### Task
The Department of Computer Science and Electrical Engineering solicited the Museum of Idaho, located in Idaho Falls, for the opportunity to apply our studies into a project for the benefit of the museum. The Museum of Idaho is a non-profit organization and willingly accepted the offer.

Our team wanted to strengthen the experience of a few exhibits by developing a device that could elaborate on the contents of the exhibit in uninstructive way. As a person approaches the exhibit the tour guide controller will audibly welcome them to the specific exhibit, followed by a brief explanation of what the exhibit generally is and how to get further information. If the visitor moves on to another exhibit, the controller will go into standby and wait for another visitor. If the visitor does want further explanation about an object, they merely have to point at that object. The controller will visually acknowledge which object to explain and then continue to play another recording about that object specifically. The visitor can continue to seek explanations about a variety of objects and the controller will respond.

### Design Description
##### Hand-Tracking
The finger-detection of the tour guide is accomplished using the Leap Motion. At about $80 and about the size of a pack of gum, the Leap Motion is a high-precision USB hand-tracking device. Using two high resolution cameras and three infrared LEDs it claims to track the position of all ten fingers to less than a millimeter of accuracy. After installing the driver software and an add-on package called Touchless, the Leap Motion can be used as an effective mouse on a Window or Mac system. The only drawback to this sensor is the practice required to become comfortable with the tracking motion; however, by moving their finger around a museum visitor can control a spotlight on the exhibit. When they find something they want to learn more about, they simply jab their finger toward to it and an audio recording begins to play.
##### Projection
The system uses a projector to create a moving spotlight on the exhibit. This provides a visual indicator to the user of what they’re about to select in the exhibit. The major benefit of the projector is the ability to cover the entire exhibit with no moving parts. If the projected image is a black screen with just one circle of white light, the projector becomes a reliable and easily directed spotlight.
##### Processing Unit
The final design of our tour guide used the [The particular Windows machine we used] running the developer’s trial of Windows 10. This computer offers a very small form factor and using Windows gave drivers and large availability of programs that we would need. 
##### Spotlight
One of these programs was PointerFocus; a product of Easy-to-Use Software. As described on their website, “PointerFocus is a handy Windows application designed for presenters, trainers and teachers who want to highlight their mouse pointer. The application offers some easy-to-use functions such as highlight cursor, mouse spotlight, keystroke visualization, magnifier and on-screen annotation.” The system utilized the spotlight function. After adjusting the settings of the spotlight feature, the screen only displays the area around the mouse to a radius of 250 pixels; the rest is made black. 

In order to make the mouse into a perfect spotlight, the cursor had to be changed to “nothing”. In actuality it’s a single red pixel called “dot”. When projected onto a large area, the single pixel becomes invisible leaving a perfect mouse-controlled spotlight.
##### Control Program
The entire tour guide was controlled by the scripting program AutoIt. AutoIt has a large selection of functions and GUI interfaces to essentially let a program use the computer by itself. The scripting environment can also build the project into an executable, which can be listed to execute on startup. This means that the entire setup can be run and restarted by just pressing the start button. This control program followed this general outline:
 1. An optional dialog box appears asking if you would like to continue or exit.
Upon execution, all input of the computer is blocked to avoid accidental detours. Note: AutoIt controls computer execution by keyboard and mouse input in the same way the user does. A keystroke or click in the wrong place, can throw off the direction of the script.
 2. The script opens the mouse properties and changes the cursor to the “dot.cur”.
PointerFocus is opened. Note: PointerFocus “remembers” its state when it was last run. By leaving the spotlight running when the program was last closed, the spotlight will automatically launch again. 
 3. A white GUI button screen convers the entire screen. The buttons of this screen are predetermined and correspond to the objects in the museum exhibit. 
 4. The program continually loops checking for two things: if a left-click happened or if “Q” was pressed. 
 5. If a left-click was deteched from the Touchless / Leap Motion software, the button that was clicked directs the program to select the appropriate mp3 recording from a switch table. 
 6. If the user clicks another button before the current one finished the program stops that audio file and starts the new one. 
 7. If “Q” was pressed, the program “cleans up” the system.
 8. The first step of the clean-up is to close the PointerFocus program. 
 9. The cursor is then changed back the default for the user. 
 10. The program terminates. 

##### AutoIt Specifics
Many of the functions of AutoIt accomplish difficult task and are very helpful, but do require some research and a few trials. The following functions were extremely useful in the final product:
* Send() – sends keystrokes to the computer as you would with the keyboard
Using “Send("#r")” opens the Run prompt. From here, one can send the filepath of any program, followed by “ENTER” to execute it. 
 - By sending tabs, arrow keys, and letters one can effectively navigate any dialog box or prompt.
* GUICtrlCreateButton() and GUICtrlSetImage() – allow the user to define an area of the desktop as a clickable button. 
 - By setting the button image as a white square, the screen became the white for the spotlight. 
 - By projecting the desktop of the system onto the exhibit and using the example function “MouseGetPos()”, the corresponding coordinates of each object in the exhibit can be mapped out and defined in the buttons.  
* _IsPressed() – Checks if the specified input was clicked / pressed
 - This checks the left mouse button and the “Q” key
* SoundPlay() – Plays the audio at the specified filepath. 
 - By preceding this function with “SoundPlay(“”)”, any previous audio file is stopped before a new one begins. 
 - One of these was tagged onto each of the buttons defined for each of the objects in the exhibit. 

##### Audio
The audio playing the museum has to be audible but shouldn’t disturb other patrons.  A parametric speaker uses an array of transducers as opposed to a traditional sound cone. A transducer can be made to project a narrow beam of modulated ultrasound that is powerful enough to substantially change the speed of sound in the air that it passes through. The air within the beam behaves nonlinearly and results in sound that can be heard only along the path of the beam, or that appears to radiate from any surface that the beam strikes. This technology allows a beam of sound to be projected over a long distance to be heard only in a small well-defined area. A listener outside the beam hears nothing.

For this system, the cheapest parametric speaker available was a kit listed on eBay for $98. There’s not a lot of information on the makers website, but the instructional PDF file is available with the AutoIt code in this repository.

##### Additional Features
One more feature that worked well in this particular instance of the project was the interfacing to the Moppy musical floppy drive controller. The controller was built previously be a group member from the instructions and code provided by SammyIAm on GitHub. Getting the GUI for the Moppy setup on a second monitor allowed the AutoIt code to trigger the external actions when queued by the virtual tour guide. 

This is a perfect example of using this control program to trigger not only audio descriptions of objects, but to also trigger possibly interactive aspects of the exhibit. While explaining the importance of a railroad, the program would trigger the activation of a model train to circle a track. If a special map were on display, the program could illuminate light pinpointing certain locations on the map to visually add to the explanation. 

One additional feature that failed to be incorporated into this version of the project was a proximity sensor to detect the presence of a patron.  Because it isn’t inherently obvious how to control the Leap Motion, it could be advantageous to play a welcome recording which briefly explains how to use the system to the user. AutoIt has the capability to read serial data from an Arduino microprocessor monitoring an ultrasonic sensor. In several instances, the sensor successfully notified the program of an approaching person. The halting obstacle arose when converting the code from Windows 7 (where it ran successfully) to Windows 10. 

### Final Notes
Many different avenues were pursued in the making of this design; a few of them are described here along with suggestions for future improvements:
* Originally, many attempts were made to make the Raspberry Pi 2 the platform for this project because of how simple it would be to hide it in a museum exhibit. The major issue with the Pi was the lack of interface with the Leap Motion with a Linux system. Online posts and forums said it was possible, but success stories were nearly impossible to find. 
* Given the vast functionality of the AutoIt code libraries, it seems that it should be able to mask the cursor and make a spotlight locally within the script. Doing this would require less startup time and avoid bugs that reside in external programs. Given the limited time for this project, the programs used were sufficient for proof-of-concept. Discovering a way to do all this internally might also help with the noticeable lag of the spotlight were operating the system. As the cursor tracked away, the spotlight would occasionally maintain its location.
* Because this project was demonstrated in a large gymnasium, the parametric speaker was far too quiet and forced the use of loudspeakers. In a museum scenario, the parametric speaker would have been much more ideal and could possibly be used to set up multiple tour guides simultaneously. By somehow distinguishing each spotlight to its user, the parametric speaker would allow multiple explanations to be given at the same exhibit without interference. 
* The Leap Motion in this setup was set on top of a small platform. Many users extended their hands too far forward, not realizing the depth range of the sensor. Mounting the sensor to the lip of a window would force the user to stay within the range of the sensor and jabbing all the way to the glass would execute the necessary “click”.
* For this version, the projector was simply bright enough to be seen with the room lights on. The effect may be enhanced by dimming as the spotlight is introduced.
