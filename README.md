# ShotCut UI for fisheye correction plugin

updated Shotcut UI filter for defish0r plugin.
place both mtl files in /Shotcut/share/shotcut/qml/filters/fisheye

### version 1
* -changed Interpolation quality slider to integer
* -changed UI presets(scale + A/R) from slider to radio buttons
* -user set sliders are hidden when scale or A/R presets are used
* -added buttons for pre-configured cameras. eg gopro..
* -changed UI names to be more intuitive
* -added UI values into global variables, in case plug-in changes.

### version 2
requires new defish0r.dll (Shotcut above version 22.04.25)
.dll and .qml should be implemented in shotcut soon

* -added elastic scale feature to fix superview upscale
* -added crop to remove distorted edges
* -added an independent Y scale option
* -added 1440p presets
* -added dynamic scrollbar
* -general optimizations to script 

original source from forum user TwitchyMcJoe

https://forum.shotcut.org/t/using-defish0r-as-a-filter-code-for-a-useful-defisheye-effect/181

![UI sample](/images/plugin_example_v3.gif)


