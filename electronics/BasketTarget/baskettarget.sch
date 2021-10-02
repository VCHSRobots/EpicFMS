<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.6.2">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="yes" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="yes" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="yes" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="yes" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="yes" active="no"/>
<layer number="20" name="Dimension" color="24" fill="1" visible="yes" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="yes" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="yes" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="yes" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="yes" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="yes" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="yes" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="yes" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="yes" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="yes" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="yes" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="yes" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="yes" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="yes" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="yes" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="yes" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="yes" active="no"/>
<layer number="88" name="SimResults" color="9" fill="1" visible="yes" active="yes"/>
<layer number="89" name="SimProbes" color="9" fill="1" visible="yes" active="yes"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="99" name="SpiceOrder" color="5" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="Dal_V2">
<description>QFN-48  Flat 48 Pin Package 0.4mm Pitch, 0.6x0.6
Trace Sizes: 0.16mm, 0.14mm = 6.2mils, 5.5 mils
Text size: 0.8mm, 20% ratio</description>
<packages>
<package name="R1X38">
<description>Large Device: 1" by 3/8"</description>
<wire x1="1.27" y1="5.08" x2="1.27" y2="-5.08" width="0.254" layer="21"/>
<wire x1="1.27" y1="-5.08" x2="24.13" y2="-5.08" width="0.254" layer="21"/>
<wire x1="24.13" y1="-5.08" x2="24.13" y2="5.08" width="0.254" layer="21"/>
<wire x1="24.13" y1="5.08" x2="1.27" y2="5.08" width="0.254" layer="21"/>
<pad name="1" x="0" y="0" drill="1.1"/>
<pad name="2" x="25.4" y="0" drill="1.1"/>
<text x="3.81" y="2.54" size="1.27" layer="25" font="vector" ratio="12">&gt;NAME</text>
<text x="3.81" y="-3.81" size="1.27" layer="27" font="fixed" ratio="12">&gt;VALUE</text>
</package>
<package name="R300">
<wire x1="1.27" y1="0.635" x2="6.35" y2="0.635" width="0.1524" layer="21"/>
<wire x1="6.35" y1="0.635" x2="6.35" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="6.35" y1="-0.635" x2="1.27" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-0.635" x2="1.27" y2="0.635" width="0.1524" layer="21"/>
<pad name="P$1" x="0" y="0" drill="1"/>
<pad name="P$2" x="7.62" y="0" drill="1"/>
<text x="1.143" y="1.27" size="1.143" layer="25" font="vector" ratio="12">&gt;Name</text>
<text x="1.016" y="-2.413" size="1.143" layer="27" font="vector" ratio="12">&gt;Value</text>
</package>
<package name="D14MM">
<pad name="P$1" x="0" y="0" drill="1" shape="square"/>
<pad name="P$2" x="14" y="0" drill="1"/>
<wire x1="-2" y1="2" x2="-2" y2="-2" width="0.127" layer="21"/>
<wire x1="-2" y1="-2" x2="16" y2="-2" width="0.127" layer="21"/>
<wire x1="16" y1="-2" x2="16" y2="2" width="0.127" layer="21"/>
<wire x1="16" y1="2" x2="-2" y2="2" width="0.127" layer="21"/>
<text x="3" y="3" size="1.27" layer="25" ratio="12">&gt;NAME</text>
<text x="3" y="-4" size="1.27" layer="27" ratio="12">&gt;VALUE</text>
</package>
<package name="R0805">
<description>INCH=0805, METRIC=2012. Reflow.
Taken from Vishay layout for reflow soldering.
Documnet RGF e3, Thick Film, Rectangular Chip Resistors.</description>
<smd name="1" x="-1" y="0" dx="1.3" dy="1.6" layer="1"/>
<smd name="2" x="1" y="0" dx="1.3" dy="1.6" layer="1"/>
<text x="-1.8" y="1.283" size="0.8" layer="25" ratio="15">&gt;NAME</text>
<text x="-2.1" y="-1.989" size="0.8" layer="27" ratio="15">&gt;VALUE</text>
<wire x1="-1.02" y1="0.62" x2="1" y2="0.62" width="0.127" layer="51"/>
<wire x1="1" y1="0.62" x2="1" y2="-0.62" width="0.127" layer="51"/>
<wire x1="1" y1="-0.62" x2="-1.02" y2="-0.62" width="0.127" layer="51"/>
<wire x1="-1.02" y1="-0.62" x2="-1.02" y2="0.62" width="0.127" layer="51"/>
<wire x1="-0.5" y1="0.9" x2="-1.8" y2="0.9" width="0.16" layer="21"/>
<wire x1="-1.8" y1="0.9" x2="-1.8" y2="-0.9" width="0.16" layer="21"/>
<wire x1="-1.8" y1="-0.9" x2="-0.5" y2="-0.9" width="0.16" layer="21"/>
<wire x1="0.5" y1="0.9" x2="1.8" y2="0.9" width="0.16" layer="21"/>
<wire x1="1.8" y1="0.9" x2="1.8" y2="-0.9" width="0.16" layer="21"/>
<wire x1="1.8" y1="-0.9" x2="0.5" y2="-0.9" width="0.16" layer="21"/>
</package>
<package name="R0603">
<description>INCH = 0603, METRIC=1608.  Reflow.
Taken from Vishay layout for reflow soldering.
Documnet RGF e3, Thick Film, Rectangular Chip Resistors.</description>
<smd name="P$1" x="-0.75" y="0" dx="0.5" dy="0.9" layer="1"/>
<smd name="P$2" x="0.75" y="0" dx="0.5" dy="0.9" layer="1"/>
<wire x1="-0.77" y1="0.42" x2="0.77" y2="0.42" width="0.05" layer="51"/>
<wire x1="0.77" y1="0.42" x2="0.77" y2="-0.42" width="0.05" layer="51"/>
<wire x1="0.77" y1="-0.42" x2="-0.77" y2="-0.42" width="0.05" layer="51"/>
<wire x1="-0.77" y1="-0.42" x2="-0.77" y2="0.42" width="0.05" layer="51"/>
<text x="-1.8" y="0.9" size="0.8" layer="25" ratio="15">&gt;NAME</text>
<text x="-2" y="-1.8" size="0.8" layer="27" ratio="15">&gt;VALUE</text>
<wire x1="-0.6" y1="0.6" x2="-1.2" y2="0.6" width="0.16" layer="21"/>
<wire x1="-1.2" y1="0.6" x2="-1.2" y2="-0.6" width="0.16" layer="21"/>
<wire x1="-1.2" y1="-0.6" x2="-0.6" y2="-0.6" width="0.16" layer="21"/>
<wire x1="0.6" y1="0.6" x2="1.2" y2="0.6" width="0.16" layer="21"/>
<wire x1="1.2" y1="0.6" x2="1.2" y2="-0.6" width="0.16" layer="21"/>
<wire x1="1.2" y1="-0.6" x2="0.6" y2="-0.6" width="0.16" layer="21"/>
</package>
<package name="R1206">
<description>INCH=1206, METRIC=3216.  Reflow.
Taken from Vishay layout for reflow soldering. 
Documnet RGF e3, Thick Film, Rectangular Chip Resistors.</description>
<smd name="P$1" x="-1.45" y="0" dx="0.9" dy="1.7" layer="1"/>
<smd name="P$2" x="1.45" y="0" dx="0.9" dy="1.7" layer="1"/>
<wire x1="-1.6" y1="0.8" x2="1.6" y2="0.8" width="0.1524" layer="51"/>
<wire x1="1.6" y1="0.8" x2="1.6" y2="-0.8" width="0.1524" layer="51"/>
<wire x1="1.6" y1="-0.8" x2="-1.6" y2="-0.8" width="0.1524" layer="51"/>
<wire x1="-1.6" y1="-0.8" x2="-1.6" y2="0.8" width="0.1524" layer="51"/>
<wire x1="-1.1" y1="1.127" x2="-2.127" y2="1.127" width="0.1524" layer="21"/>
<wire x1="-2.127" y1="1.127" x2="-2.127" y2="-1.127" width="0.1524" layer="21"/>
<wire x1="-2.127" y1="-1.127" x2="-1.1" y2="-1.127" width="0.1524" layer="21"/>
<wire x1="1.1" y1="1.127" x2="2.127" y2="1.127" width="0.1524" layer="21"/>
<wire x1="2.127" y1="1.127" x2="2.127" y2="-1.127" width="0.1524" layer="21"/>
<wire x1="2.127" y1="-1.127" x2="1.1" y2="-1.127" width="0.1524" layer="21"/>
<text x="-1.7" y="1.4" size="1.016" layer="25" font="vector" ratio="12">&gt;NAME</text>
<text x="-2.1" y="-2.354" size="1.016" layer="27" font="vector" ratio="12">&gt;VALUE</text>
</package>
<package name="TRIMPOT_SIP_100">
<pad name="P$1" x="0" y="0" drill="0.75"/>
<pad name="P$2" x="2.54" y="0" drill="0.75"/>
<pad name="P$3" x="5.08" y="0" drill="0.75"/>
<wire x1="-2.54" y1="-2.54" x2="7.62" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-2.54" x2="7.62" y2="2.54" width="0.1524" layer="21"/>
<wire x1="7.62" y1="2.54" x2="-2.54" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="2.54" x2="-2.54" y2="-2.54" width="0.1524" layer="21"/>
<text x="-2.54" y="3.81" size="1.27" layer="25" font="vector" ratio="12">&gt;Name</text>
<text x="-2.54" y="-4.318" size="1.27" layer="27" font="vector" ratio="12">&gt;Value</text>
<circle x="-1.524" y="1.397" radius="0.762" width="0.1524" layer="21"/>
<wire x1="-2.032" y1="0.762" x2="-1.016" y2="1.905" width="0.1524" layer="21"/>
</package>
<package name="LED-TH-3MM">
<wire x1="-3.81" y1="1.27" x2="-2.54" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.905" x2="-3.175" y2="0.635" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="2.54" width="0.1524" layer="21"/>
<pad name="ANODE" x="-1.27" y="0" drill="1" shape="square"/>
<pad name="CATHODE" x="1.27" y="0" drill="1"/>
<text x="-2.664" y="-3.899" size="1.143" layer="25" font="vector" ratio="12">&gt;Name</text>
</package>
<package name="LED-TH-5MM">
<wire x1="-5.05" y1="2.54" x2="-3.51" y2="2.54" width="0.4064" layer="21"/>
<wire x1="-4.28" y1="1.67" x2="-4.28" y2="3.31" width="0.4064" layer="21"/>
<circle x="0" y="0" radius="3.81" width="0.3048" layer="21"/>
<pad name="ANODE" x="-1.27" y="0" drill="1" shape="square"/>
<pad name="CATHODE" x="1.27" y="0" drill="1"/>
<text x="-1.875" y="-5.115" size="0.8" layer="25" font="vector" ratio="15">&gt;Name</text>
</package>
<package name="CHIPLED_1206">
<description>&lt;b&gt;CHIPLED&lt;/b&gt;&lt;p&gt;
Source: http://www.osram.convergy.de/ ... LG_LY N971.pdf</description>
<wire x1="1.6" y1="0.4" x2="1.6" y2="-0.4" width="0.1016" layer="51" curve="172.619069"/>
<wire x1="-0.95" y1="0.8" x2="0.95" y2="0.8" width="0.1016" layer="51"/>
<wire x1="0.95" y1="-0.8" x2="-0.95" y2="-0.8" width="0.1016" layer="51"/>
<circle x="1.425" y="0.55" radius="0.1" width="0.1016" layer="51"/>
<smd name="CATHODE(-)" x="1.75" y="0" dx="1.5" dy="1.5" layer="1" rot="R270"/>
<smd name="ANODE(+)" x="-1.75" y="0" dx="1.5" dy="1.5" layer="1" rot="R270"/>
<text x="-1.57" y="1.37" size="0.8" layer="25" ratio="15">&gt;NAME</text>
<text x="-1.77" y="-2.04" size="0.8" layer="27" ratio="15">&gt;VALUE</text>
<rectangle x1="1.3375" y1="0.5375" x2="1.8375" y2="0.6625" layer="51" rot="R270"/>
<rectangle x1="1.275" y1="0.575" x2="1.5" y2="0.9" layer="51" rot="R270"/>
<rectangle x1="1.275" y1="0.275" x2="1.4" y2="0.5" layer="51" rot="R270"/>
<rectangle x1="1.075" y1="0.375" x2="1.5" y2="0.5" layer="51" rot="R270"/>
<rectangle x1="1.225" y1="-0.775" x2="1.725" y2="-0.425" layer="51" rot="R270"/>
<rectangle x1="0.9875" y1="-0.6125" x2="1.5875" y2="-0.4875" layer="51" rot="R270"/>
<rectangle x1="0.25" y1="-0.15" x2="1.95" y2="0.15" layer="51" rot="R270"/>
<rectangle x1="-2.15" y1="-0.35" x2="-0.45" y2="0.35" layer="51" rot="R270"/>
<rectangle x1="0.4" y1="0.475" x2="0.725" y2="0.9" layer="21" rot="R270"/>
<rectangle x1="0.4" y1="-0.9" x2="0.725" y2="-0.475" layer="21" rot="R270"/>
<rectangle x1="0" y1="-0.175" x2="0.35" y2="0.175" layer="21" rot="R270"/>
<wire x1="-2.3" y1="1.7" x2="-2.3" y2="1.1" width="0.127" layer="21"/>
<wire x1="-2.6" y1="1.4" x2="-2" y2="1.4" width="0.127" layer="21"/>
</package>
<package name="LED-TH100">
<description>2 Pin TH, 4mm Dia Circle, with polatery marking</description>
<pad name="P$1" x="-1.27" y="0" drill="1" shape="square"/>
<pad name="P$2" x="1.27" y="0" drill="1"/>
<text x="-2.1" y="-3.3" size="0.8" layer="27" ratio="15">&gt;VALUE</text>
<text x="-1.8" y="2.5" size="0.8" layer="25" ratio="15">&gt;NAME</text>
<circle x="0" y="0" radius="2.20226875" width="0.127" layer="21"/>
<wire x1="-2.7" y1="1.4" x2="-2.1" y2="1.4" width="0.127" layer="21"/>
<wire x1="-2.4" y1="1.7" x2="-2.4" y2="1.1" width="0.127" layer="21"/>
</package>
<package name="LED_0603">
<smd name="ANODE(+)" x="-0.825" y="0" dx="0.8" dy="0.8" layer="1"/>
<smd name="CATHODE(-)" x="0.825" y="0" dx="0.8" dy="0.8" layer="1"/>
<wire x1="-0.8" y1="0.4" x2="-0.5" y2="0.4" width="0.127" layer="51"/>
<wire x1="-0.5" y1="0.4" x2="0.5" y2="0.4" width="0.127" layer="51"/>
<wire x1="0.5" y1="0.4" x2="0.8" y2="0.4" width="0.127" layer="51"/>
<wire x1="0.8" y1="0.4" x2="0.8" y2="-0.4" width="0.127" layer="51"/>
<wire x1="0.8" y1="-0.4" x2="0.5" y2="-0.4" width="0.127" layer="51"/>
<wire x1="0.5" y1="-0.4" x2="-0.5" y2="-0.4" width="0.127" layer="51"/>
<wire x1="-0.5" y1="-0.4" x2="-0.8" y2="-0.4" width="0.127" layer="51"/>
<wire x1="-0.8" y1="-0.4" x2="-0.8" y2="0.4" width="0.127" layer="51"/>
<wire x1="-0.5" y1="0.4" x2="-0.5" y2="-0.4" width="0.127" layer="51"/>
<wire x1="0.5" y1="0.4" x2="0.5" y2="-0.4" width="0.127" layer="51"/>
<wire x1="-0.9" y1="0.8" x2="-0.5" y2="0.8" width="0.127" layer="21"/>
<wire x1="-0.7" y1="0.6" x2="-0.7" y2="1" width="0.127" layer="21"/>
<text x="-1.5" y="1.2" size="0.8" layer="25" ratio="15">&gt;NAME</text>
<text x="-1.7" y="-1.5" size="0.8" layer="27" ratio="15">&gt;VALUE</text>
<wire x1="0.6" y1="0.6" x2="1.4" y2="0.6" width="0.127" layer="21"/>
<wire x1="1.4" y1="0.6" x2="1.4" y2="-0.6" width="0.127" layer="21"/>
<wire x1="1.4" y1="-0.6" x2="0.6" y2="-0.6" width="0.127" layer="21"/>
<wire x1="-1.2" y1="0.6" x2="-1.4" y2="0.6" width="0.127" layer="21"/>
<wire x1="-1.4" y1="0.6" x2="-1.4" y2="-0.6" width="0.127" layer="21"/>
<wire x1="-1.4" y1="-0.6" x2="-0.6" y2="-0.6" width="0.127" layer="21"/>
</package>
<package name="LED_1206">
<description>INCH=1206, METRIC=3216.  Reflow.
Taken from Vishay layout for reflow soldering. 
Documnet RGF e3, Thick Film, Rectangular Chip Resistors.</description>
<smd name="ANODE(+)" x="-1.45" y="0" dx="0.9" dy="1.7" layer="1"/>
<smd name="CATHODE(-)" x="1.45" y="0" dx="0.9" dy="1.7" layer="1"/>
<wire x1="-1.735" y1="1.127" x2="-2.127" y2="1.127" width="0.1524" layer="21"/>
<wire x1="-2.127" y1="1.127" x2="-2.127" y2="-1.127" width="0.1524" layer="21"/>
<wire x1="-2.127" y1="-1.127" x2="-1.1" y2="-1.127" width="0.1524" layer="21"/>
<wire x1="1.1" y1="1.127" x2="2.127" y2="1.127" width="0.1524" layer="21"/>
<wire x1="2.127" y1="1.127" x2="2.127" y2="-1.127" width="0.1524" layer="21"/>
<wire x1="2.127" y1="-1.127" x2="1.1" y2="-1.127" width="0.1524" layer="21"/>
<text x="-1.827" y="2.162" size="1.016" layer="25" font="vector" ratio="12">&gt;NAME</text>
<text x="-2.1" y="-2.354" size="1.016" layer="27" font="vector" ratio="12">&gt;VALUE</text>
<wire x1="-1.016" y1="1.778" x2="-1.016" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="1.524" x2="-0.762" y2="1.524" width="0.1524" layer="21"/>
</package>
<package name="ESP8266_MODULE">
<pad name="P$1" x="0" y="0" drill="0.9"/>
<pad name="P$2" x="2.54" y="0" drill="0.9"/>
<pad name="P$3" x="5.08" y="0" drill="0.9"/>
<pad name="P$4" x="7.62" y="0" drill="0.9"/>
<pad name="P$5" x="10.16" y="0" drill="0.9"/>
<pad name="P$6" x="12.7" y="0" drill="0.9"/>
<pad name="P$7" x="15.24" y="0" drill="0.9"/>
<pad name="P$8" x="17.78" y="0" drill="0.9"/>
<pad name="P$9" x="20.32" y="0" drill="0.9"/>
<pad name="P$10" x="22.86" y="0" drill="0.9"/>
<pad name="P$11" x="25.4" y="0" drill="0.9"/>
<pad name="P$12" x="27.94" y="0" drill="0.9"/>
<pad name="P$13" x="30.48" y="0" drill="0.9"/>
<pad name="P$14" x="33.02" y="0" drill="0.9"/>
<pad name="P$15" x="35.56" y="0" drill="0.9"/>
<pad name="P$16" x="35.56" y="22.86" drill="0.9"/>
<pad name="P$17" x="33.02" y="22.86" drill="0.9"/>
<pad name="P$18" x="30.48" y="22.86" drill="0.9"/>
<pad name="P$19" x="27.94" y="22.86" drill="0.9"/>
<pad name="P$20" x="25.4" y="22.86" drill="0.9"/>
<pad name="P$21" x="22.86" y="22.86" drill="0.9"/>
<pad name="P$22" x="20.32" y="22.86" drill="0.9"/>
<pad name="P$23" x="17.78" y="22.86" drill="0.9"/>
<pad name="P$24" x="15.24" y="22.86" drill="0.9"/>
<pad name="P$25" x="12.7" y="22.86" drill="0.9"/>
<pad name="P$26" x="10.16" y="22.86" drill="0.9"/>
<pad name="P$27" x="7.62" y="22.86" drill="0.9"/>
<pad name="P$28" x="5.08" y="22.86" drill="0.9"/>
<pad name="P$29" x="2.54" y="22.86" drill="0.9"/>
<pad name="P$30" x="0" y="22.86" drill="0.9"/>
<hole x="-4.064" y="21.9456" drill="3.175"/>
<hole x="-4.064" y="0.889" drill="3.175"/>
<hole x="39.624" y="21.9456" drill="3.175"/>
<hole x="39.624" y="0.9144" drill="3.175"/>
<wire x1="-6.35" y1="-1.27" x2="41.91" y2="-1.27" width="0.127" layer="21"/>
<wire x1="41.91" y1="-1.27" x2="41.91" y2="24.13" width="0.127" layer="21"/>
<wire x1="41.91" y1="24.13" x2="-6.35" y2="24.13" width="0.127" layer="21"/>
<wire x1="-6.35" y1="24.13" x2="-6.35" y2="15.24" width="0.127" layer="21"/>
<wire x1="-6.35" y1="15.24" x2="-6.35" y2="7.62" width="0.127" layer="21"/>
<wire x1="-6.35" y1="7.62" x2="-6.35" y2="-1.27" width="0.127" layer="21"/>
<wire x1="-7.62" y1="15.24" x2="-7.62" y2="7.62" width="0.127" layer="51"/>
<wire x1="-7.62" y1="7.62" x2="-6.35" y2="7.62" width="0.127" layer="51"/>
<circle x="-3.81" y="6.35" radius="0.508" width="0.127" layer="51"/>
<circle x="-3.81" y="16.51" radius="0.508" width="0.127" layer="51"/>
<wire x1="-7.62" y1="15.24" x2="-6.35" y2="15.24" width="0.127" layer="51"/>
<wire x1="20.32" y1="17.78" x2="34.29" y2="17.78" width="0.127" layer="51"/>
<wire x1="34.29" y1="17.78" x2="34.29" y2="5.08" width="0.127" layer="51"/>
<wire x1="34.29" y1="5.08" x2="20.32" y2="5.08" width="0.127" layer="51"/>
<wire x1="20.32" y1="5.08" x2="20.32" y2="17.78" width="0.127" layer="51"/>
<wire x1="35.56" y1="6.35" x2="35.56" y2="17.78" width="0.127" layer="51"/>
<wire x1="35.56" y1="17.78" x2="40.64" y2="17.78" width="0.127" layer="51"/>
<wire x1="40.64" y1="17.78" x2="40.64" y2="15.24" width="0.127" layer="51"/>
<wire x1="40.64" y1="15.24" x2="36.83" y2="15.24" width="0.127" layer="51"/>
<wire x1="36.83" y1="15.24" x2="36.83" y2="12.7" width="0.127" layer="51"/>
<wire x1="36.83" y1="12.7" x2="40.64" y2="12.7" width="0.127" layer="51"/>
<wire x1="40.64" y1="12.7" x2="40.64" y2="10.16" width="0.127" layer="51"/>
<wire x1="40.64" y1="10.16" x2="36.83" y2="10.16" width="0.127" layer="51"/>
<wire x1="36.83" y1="10.16" x2="36.83" y2="7.62" width="0.127" layer="51"/>
<wire x1="36.83" y1="7.62" x2="40.64" y2="7.62" width="0.127" layer="51"/>
<text x="3.81" y="16.51" size="1.4224" layer="25" font="vector" ratio="12">&gt;NAME</text>
<text x="3.81" y="8.89" size="1.4224" layer="27" font="vector" ratio="12">&gt;VALUE</text>
</package>
<package name="TO252-3">
<description>&lt;b&gt;SMALL OUTLINE TRANSISTOR&lt;/b&gt;&lt;p&gt;
TS-003 T0252, TO252-3 
DPAK Recommended footport from ST</description>
<wire x1="3.2766" y1="3.8354" x2="3.277" y2="-2.159" width="0.2032" layer="51"/>
<wire x1="3.277" y1="-2.159" x2="-3.277" y2="-2.159" width="0.2032" layer="51"/>
<wire x1="-3.277" y1="-2.159" x2="-3.2766" y2="3.8354" width="0.2032" layer="51"/>
<wire x1="-3.277" y1="3.835" x2="3.2774" y2="3.8346" width="0.2032" layer="51"/>
<wire x1="-2.5654" y1="3.937" x2="-2.5654" y2="4.6482" width="0.2032" layer="51"/>
<wire x1="-2.5654" y1="4.6482" x2="-2.1082" y2="5.1054" width="0.2032" layer="51"/>
<wire x1="-2.1082" y1="5.1054" x2="2.1082" y2="5.1054" width="0.2032" layer="51"/>
<wire x1="2.1082" y1="5.1054" x2="2.5654" y2="4.6482" width="0.2032" layer="51"/>
<wire x1="2.5654" y1="4.6482" x2="2.5654" y2="3.937" width="0.2032" layer="51"/>
<wire x1="2.5654" y1="3.937" x2="-2.5654" y2="3.937" width="0.2032" layer="51"/>
<smd name="FIN" x="0" y="2.5" dx="6.3" dy="6.1" layer="1"/>
<smd name="1" x="-2.28" y="-3.8" dx="1.5" dy="2.8" layer="1"/>
<smd name="3" x="2.28" y="-3.8" dx="1.5" dy="2.8" layer="1"/>
<text x="-3.81" y="-2.54" size="1.27" layer="25" font="vector" ratio="12" rot="R90">&gt;NAME</text>
<text x="5.08" y="-2.54" size="1.27" layer="27" font="vector" ratio="12" rot="R90">&gt;VALUE</text>
<rectangle x1="-2.7178" y1="-5.1562" x2="-1.8542" y2="-2.2606" layer="51"/>
<rectangle x1="1.8542" y1="-5.1562" x2="2.7178" y2="-2.2606" layer="51"/>
<rectangle x1="-0.4318" y1="-3.0226" x2="0.4318" y2="-2.2606" layer="51"/>
<polygon width="0.1998" layer="51">
<vertex x="-2.5654" y="3.937"/>
<vertex x="-2.5654" y="4.6482"/>
<vertex x="-2.1082" y="5.1054"/>
<vertex x="2.1082" y="5.1054"/>
<vertex x="2.5654" y="4.6482"/>
<vertex x="2.5654" y="3.937"/>
</polygon>
</package>
<package name="CAP200">
<wire x1="1.27" y1="0" x2="1.905" y2="0" width="0.4064" layer="21"/>
<wire x1="1.905" y1="0" x2="1.905" y2="0.635" width="0.4064" layer="21"/>
<wire x1="1.905" y1="0" x2="1.905" y2="-0.635" width="0.4064" layer="21"/>
<wire x1="3.81" y1="0" x2="3.175" y2="0" width="0.4064" layer="21"/>
<wire x1="3.175" y1="0" x2="3.175" y2="0.635" width="0.4064" layer="21"/>
<wire x1="3.175" y1="0" x2="3.175" y2="-0.635" width="0.4064" layer="21"/>
<pad name="1" x="0" y="0" drill="0.9"/>
<pad name="2" x="5.08" y="0" drill="0.9"/>
<text x="0.73" y="1.54" size="0.8" layer="25" font="vector" ratio="15">&gt;Name</text>
<text x="0.53" y="-2.21" size="0.8" layer="27" font="vector" ratio="15">&gt;Value</text>
</package>
<package name="CAP300">
<wire x1="1.27" y1="0" x2="3.175" y2="0" width="0.4064" layer="21"/>
<wire x1="3.175" y1="0" x2="3.175" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="3.175" y1="0" x2="3.175" y2="1.27" width="0.4064" layer="21"/>
<wire x1="4.445" y1="1.27" x2="4.445" y2="0" width="0.4064" layer="21"/>
<wire x1="4.445" y1="0" x2="4.445" y2="-1.27" width="0.4064" layer="21"/>
<wire x1="4.445" y1="0" x2="6.35" y2="0" width="0.4064" layer="21"/>
<pad name="1" x="0" y="0" drill="0.9"/>
<pad name="2" x="7.62" y="0" drill="0.9"/>
<text x="2.03" y="2.04" size="0.8" layer="25" font="vector" ratio="15">&gt;Name</text>
<text x="1.63" y="-2.81" size="0.8" layer="27" font="vector" ratio="15">&gt;Value</text>
</package>
<package name="C0402">
<description>INCH=0402, METRIC=1005
From TDK Land Recommendation for Commercial Grade, up to 630 Volts.</description>
<smd name="1" x="-0.5" y="0" dx="0.4" dy="0.6" layer="1"/>
<smd name="2" x="0.5" y="0" dx="0.4" dy="0.6" layer="1"/>
<text x="-1.735" y="0.635" size="0.8" layer="25" ratio="15">&gt;NAME</text>
<text x="-2.135" y="-1.405" size="0.8" layer="27" ratio="15">&gt;VALUE</text>
<rectangle x1="-0.15" y1="-0.3" x2="0.15" y2="0.3" layer="35"/>
<wire x1="-0.3" y1="0.4" x2="-0.8" y2="0.4" width="0.16" layer="21"/>
<wire x1="-0.8" y1="0.4" x2="-0.8" y2="-0.4" width="0.16" layer="21"/>
<wire x1="-0.8" y1="-0.4" x2="-0.3" y2="-0.4" width="0.16" layer="21"/>
<wire x1="0.3" y1="0.4" x2="0.8" y2="0.4" width="0.16" layer="21"/>
<wire x1="0.8" y1="0.4" x2="0.8" y2="-0.4" width="0.16" layer="21"/>
<wire x1="0.8" y1="-0.4" x2="0.3" y2="-0.4" width="0.16" layer="21"/>
<wire x1="-0.5" y1="0.25" x2="-0.4" y2="0.25" width="0.1" layer="51"/>
<wire x1="-0.4" y1="0.25" x2="0.4" y2="0.25" width="0.1" layer="51"/>
<wire x1="0.4" y1="0.25" x2="0.5" y2="0.25" width="0.1" layer="51"/>
<wire x1="0.5" y1="0.25" x2="0.5" y2="-0.25" width="0.1" layer="51"/>
<wire x1="0.5" y1="-0.25" x2="0.4" y2="-0.25" width="0.1" layer="51"/>
<wire x1="0.4" y1="-0.25" x2="-0.4" y2="-0.25" width="0.1" layer="51"/>
<wire x1="-0.4" y1="-0.25" x2="-0.5" y2="-0.25" width="0.1" layer="51"/>
<wire x1="-0.5" y1="-0.25" x2="-0.5" y2="0.25" width="0.1" layer="51"/>
<wire x1="-0.4" y1="0.25" x2="-0.4" y2="-0.25" width="0.1" layer="51"/>
<wire x1="0.4" y1="0.25" x2="0.4" y2="-0.25" width="0.1" layer="51"/>
</package>
<package name="C0603">
<description>INCH=0603, METRIC=1608
From TDK Land Recommendation for Commercial Grade, up to 630 Volts.</description>
<smd name="1" x="-0.8" y="0" dx="0.8" dy="0.8" layer="1"/>
<smd name="2" x="0.8" y="0" dx="0.8" dy="0.8" layer="1"/>
<text x="-1.735" y="0.835" size="0.8" layer="25" ratio="15">&gt;NAME</text>
<text x="-2.035" y="-1.605" size="0.8" layer="27" ratio="15">&gt;VALUE</text>
<rectangle x1="-0.1999" y1="-0.3" x2="0.1999" y2="0.3" layer="35"/>
<wire x1="-0.5" y1="0.6" x2="-1.3" y2="0.6" width="0.16" layer="21"/>
<wire x1="-1.3" y1="0.6" x2="-1.3" y2="-0.6" width="0.16" layer="21"/>
<wire x1="-1.3" y1="-0.6" x2="-0.5" y2="-0.6" width="0.16" layer="21"/>
<wire x1="0.5" y1="0.6" x2="1.3" y2="0.6" width="0.16" layer="21"/>
<wire x1="1.3" y1="0.6" x2="1.3" y2="-0.6" width="0.16" layer="21"/>
<wire x1="1.3" y1="-0.6" x2="0.5" y2="-0.6" width="0.16" layer="21"/>
<wire x1="-0.8" y1="0.4" x2="-0.6" y2="0.4" width="0.1" layer="51"/>
<wire x1="-0.6" y1="0.4" x2="0.6" y2="0.4" width="0.1" layer="51"/>
<wire x1="0.6" y1="0.4" x2="0.8" y2="0.4" width="0.1" layer="51"/>
<wire x1="0.8" y1="0.4" x2="0.8" y2="-0.4" width="0.1" layer="51"/>
<wire x1="0.8" y1="-0.4" x2="0.6" y2="-0.4" width="0.1" layer="51"/>
<wire x1="0.6" y1="-0.4" x2="-0.6" y2="-0.4" width="0.1" layer="51"/>
<wire x1="-0.6" y1="-0.4" x2="-0.8" y2="-0.4" width="0.1" layer="51"/>
<wire x1="-0.8" y1="-0.4" x2="-0.8" y2="0.4" width="0.1" layer="51"/>
<wire x1="-0.6" y1="0.4" x2="-0.6" y2="-0.4" width="0.1" layer="51"/>
<wire x1="0.6" y1="0.4" x2="0.6" y2="-0.4" width="0.1" layer="51"/>
</package>
<package name="C0805">
<description>INCH=0805, METRIC=2012
From TDK Land Recommendation for Commercial Grade, up to 630 Volts.</description>
<smd name="1" x="-0.9" y="0" dx="0.9" dy="1.2" layer="1"/>
<smd name="2" x="0.9" y="0" dx="0.9" dy="1.2" layer="1"/>
<text x="-1.77" y="1.17" size="0.8" layer="25" ratio="15">&gt;NAME</text>
<text x="-2.17" y="-1.84" size="0.8" layer="27" ratio="15">&gt;VALUE</text>
<rectangle x1="-0.2" y1="-0.6" x2="0.2" y2="0.6" layer="35"/>
<wire x1="-0.6" y1="0.8" x2="-1.5" y2="0.8" width="0.16" layer="21"/>
<wire x1="-1.5" y1="0.8" x2="-1.5" y2="-0.8" width="0.16" layer="21"/>
<wire x1="-1.5" y1="-0.8" x2="-0.6" y2="-0.8" width="0.16" layer="21"/>
<wire x1="0.6" y1="0.8" x2="1.5" y2="0.8" width="0.16" layer="21"/>
<wire x1="1.5" y1="0.8" x2="1.5" y2="-0.8" width="0.16" layer="21"/>
<wire x1="1.5" y1="-0.8" x2="0.5" y2="-0.8" width="0.16" layer="21"/>
<wire x1="-1" y1="0.62" x2="-0.8" y2="0.62" width="0.1" layer="51"/>
<wire x1="-0.8" y1="0.62" x2="0.8" y2="0.62" width="0.1" layer="51"/>
<wire x1="0.8" y1="0.62" x2="1" y2="0.62" width="0.1" layer="51"/>
<wire x1="1" y1="0.62" x2="1" y2="-0.62" width="0.1" layer="51"/>
<wire x1="1" y1="-0.62" x2="0.8" y2="-0.62" width="0.1" layer="51"/>
<wire x1="0.8" y1="-0.62" x2="-0.8" y2="-0.62" width="0.1" layer="51"/>
<wire x1="-0.8" y1="-0.62" x2="-1" y2="-0.62" width="0.1" layer="51"/>
<wire x1="-1" y1="-0.62" x2="-1" y2="0.62" width="0.1" layer="51"/>
<wire x1="-0.8" y1="0.62" x2="-0.8" y2="-0.62" width="0.1" layer="51"/>
<wire x1="0.8" y1="0.62" x2="0.8" y2="-0.62" width="0.1" layer="51"/>
</package>
<package name="C1206">
<description>INCH=1206, METRIC=3216
From TDK Land Recommendation for Commercial Grade, up to 630 Volts.</description>
<wire x1="-1.6" y1="0.8" x2="-1.4" y2="0.8" width="0.1" layer="51"/>
<wire x1="-1.4" y1="0.8" x2="1.4" y2="0.8" width="0.1" layer="51"/>
<wire x1="1.4" y1="0.8" x2="1.6" y2="0.8" width="0.1" layer="51"/>
<wire x1="1.6" y1="0.8" x2="1.6" y2="-0.8" width="0.1" layer="51"/>
<wire x1="1.6" y1="-0.8" x2="1.4" y2="-0.8" width="0.1" layer="51"/>
<wire x1="1.4" y1="-0.8" x2="-1.4" y2="-0.8" width="0.1" layer="51"/>
<wire x1="-1.4" y1="-0.8" x2="-1.6" y2="-0.8" width="0.1" layer="51"/>
<wire x1="-1.6" y1="-0.8" x2="-1.6" y2="0.8" width="0.1" layer="51"/>
<wire x1="-1.4" y1="0.8" x2="-1.4" y2="-0.8" width="0.1" layer="51"/>
<wire x1="1.4" y1="0.8" x2="1.4" y2="-0.8" width="0.1" layer="51"/>
<smd name="P$1" x="-1.7" y="0" dx="1.2" dy="1.6" layer="1"/>
<smd name="P$2" x="1.7" y="0" dx="1.2" dy="1.6" layer="1"/>
<wire x1="-1" y1="0.9" x2="-2.4" y2="0.9" width="0.1" layer="21"/>
<wire x1="-2.4" y1="0.9" x2="-2.4" y2="-0.9" width="0.1" layer="21"/>
<wire x1="-2.4" y1="-0.9" x2="-1" y2="-0.9" width="0.1" layer="21"/>
<wire x1="1" y1="0.9" x2="2.4" y2="0.9" width="0.1" layer="21"/>
<wire x1="2.4" y1="0.9" x2="2.4" y2="-0.9" width="0.1" layer="21"/>
<wire x1="2.4" y1="-0.9" x2="1" y2="-0.9" width="0.1" layer="21"/>
<text x="-1.7" y="1.1" size="0.8" layer="21" ratio="15">&gt;NAME</text>
<text x="-2" y="-1.9" size="0.8" layer="21" ratio="15">&gt;VALUE</text>
</package>
<package name="PINHDR_TH_098_1X3">
<wire x1="4" y1="1.6" x2="-4" y2="1.6" width="0.254" layer="21"/>
<wire x1="-4" y1="1.6" x2="-4" y2="-1.5" width="0.254" layer="21"/>
<wire x1="-4" y1="-1.5" x2="4" y2="-1.5" width="0.254" layer="21"/>
<wire x1="4" y1="-1.5" x2="4" y2="1.6" width="0.254" layer="21"/>
<pad name="1" x="-2.5" y="0" drill="1"/>
<pad name="2" x="0" y="0" drill="1"/>
<pad name="3" x="2.5" y="0" drill="1"/>
<text x="0.1664" y="1.9974" size="0.8" layer="25" ratio="15">&gt;NAME</text>
<text x="-2.64" y="-2.621" size="1.27" layer="21" ratio="12" rot="R90">1</text>
<text x="-0.4" y="-2.8" size="0.8" layer="27" ratio="15">&gt;VALUE</text>
</package>
<package name="PINHDR_TH_100_1X3">
<pad name="1" x="-2.54" y="0" drill="1"/>
<pad name="2" x="0" y="0" drill="1"/>
<pad name="3" x="2.54" y="0" drill="1"/>
<text x="-2.43" y="-2.675" size="1.27" layer="21" ratio="12" rot="R90">1</text>
<text x="-4.44" y="-1.77" size="0.8" layer="25" ratio="15" rot="R90">&gt;NAME</text>
<wire x1="-4.054" y1="1.524" x2="4.074" y2="1.524" width="0.16" layer="21"/>
<wire x1="4.074" y1="1.524" x2="4.074" y2="-1.524" width="0.16" layer="21"/>
<wire x1="4.074" y1="-1.524" x2="-4.054" y2="-1.524" width="0.16" layer="21"/>
<wire x1="-4.054" y1="-1.524" x2="-4.054" y2="1.524" width="0.16" layer="21"/>
<text x="5.2" y="-2.33" size="0.8" layer="27" ratio="15" rot="R90">&gt;VALUE</text>
</package>
<package name="PINHDR_TH_156_1X3">
<wire x1="-6" y1="2" x2="-5" y2="2" width="0.16" layer="21"/>
<wire x1="-5" y1="2" x2="5" y2="2" width="0.16" layer="21"/>
<wire x1="5" y1="2" x2="6" y2="2" width="0.16" layer="21"/>
<wire x1="-5" y1="2" x2="-5" y2="4" width="0.16" layer="21"/>
<wire x1="-5" y1="4" x2="5" y2="4" width="0.16" layer="21"/>
<wire x1="5" y1="4" x2="5" y2="2" width="0.16" layer="21"/>
<wire x1="-6" y1="2" x2="-6" y2="-4" width="0.16" layer="21"/>
<wire x1="-6" y1="-4" x2="6" y2="-4" width="0.16" layer="21"/>
<wire x1="6" y1="-4" x2="6" y2="2" width="0.16" layer="21"/>
<pad name="1" x="-3.9624" y="0" drill="1.4"/>
<pad name="2" x="0" y="0" drill="1.4"/>
<pad name="3" x="3.9624" y="0" drill="1.4"/>
<text x="-5.6" y="2.5" size="1.27" layer="21" ratio="12" rot="R90">1</text>
<text x="-6.3" y="-2.7" size="0.8" layer="25" ratio="15" rot="R90">&gt;NAME</text>
<text x="7.12" y="-3.36" size="0.8" layer="27" ratio="15" rot="R90">&gt;VALUE</text>
</package>
<package name="JST-XH_098_VERT_1X3">
<description>JST Connector, XH Series, 0.098 Inch, 1x3</description>
<pad name="3" x="-5" y="0" drill="1"/>
<pad name="2" x="-2.5" y="0" drill="1"/>
<pad name="1" x="0" y="0" drill="1" shape="square"/>
<text x="1.9162" y="-1.4126" size="1.27" layer="51" font="vector" ratio="12" rot="R180">1</text>
<text x="-8.04" y="-3.21" size="1.27" layer="25" font="vector" ratio="12" rot="R90">&gt;NAME</text>
<wire x1="2.5" y1="-3.5" x2="2.5" y2="2.5" width="0.1524" layer="21"/>
<wire x1="-7.5" y1="2.5" x2="-7.5" y2="-3.5" width="0.1524" layer="21"/>
<wire x1="-7.5" y1="-3.5" x2="2.5" y2="-3.5" width="0.1524" layer="21"/>
<text x="-6.451" y="-5.157" size="1.27" layer="27" font="vector" ratio="12">&gt;VALUE</text>
<wire x1="2.5" y1="2.5" x2="1" y2="2.5" width="0.1524" layer="21"/>
<wire x1="-1" y1="2.5" x2="-4" y2="2.5" width="0.1524" layer="21"/>
<wire x1="-7.5" y1="2.5" x2="-6" y2="2.5" width="0.1524" layer="21"/>
</package>
<package name="TERMBLOCK_TH_200_1X3">
<pad name="P$1" x="0" y="0" drill="1.6"/>
<pad name="P$2" x="5.08" y="0" drill="1.6"/>
<wire x1="-2.54" y1="-5.08" x2="-2.54" y2="5.08" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="5.08" x2="12.7" y2="5.08" width="0.1524" layer="21"/>
<wire x1="12.7" y1="5.08" x2="12.7" y2="-5.08" width="0.1524" layer="21"/>
<wire x1="12.7" y1="-5.08" x2="-2.54" y2="-5.08" width="0.1524" layer="21"/>
<text x="-1.27" y="6.35" size="1.27" layer="25" font="vector" ratio="12">&gt;Name</text>
<text x="-1.27" y="-7.62" size="1.27" layer="27" font="vector" ratio="12">&gt;Value</text>
<text x="-1.27" y="-2.54" size="1.27" layer="21">1</text>
<pad name="P$3" x="10.16" y="0" drill="1.6"/>
</package>
<package name="PH2_TH_SIDE_200_1X3">
<description>PHOENIX Header - 2 Pos
Mounting can be vertial or horzantial.  If Horz version is used then must leave at least .375 for plug.  Can be mounted at edge of PCM for either vert or horz version.</description>
<pad name="P$1" x="0" y="0" drill="1.4"/>
<pad name="P$2" x="5.08" y="0" drill="1.4"/>
<wire x1="-3.175" y1="-2.794" x2="-3.175" y2="7.874" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="7.874" x2="13.335" y2="7.874" width="0.1524" layer="21"/>
<wire x1="13.335" y1="7.874" x2="13.335" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="13.335" y1="-2.794" x2="-3.175" y2="-2.794" width="0.1524" layer="21"/>
<text x="-3.81" y="8.89" size="1.27" layer="25" font="vector" ratio="12">&gt;Name</text>
<text x="-3.81" y="-5.08" size="1.27" layer="27" font="vector" ratio="12">&gt;Value</text>
<text x="-2.54" y="-1.27" size="1.27" layer="21">1</text>
<pad name="PA$1" x="0" y="5.08" drill="1.4"/>
<pad name="PA$2" x="5.08" y="5.08" drill="1.4"/>
<wire x1="0" y1="5.08" x2="0" y2="0" width="0.3048" layer="1"/>
<wire x1="5.08" y1="5.08" x2="5.08" y2="0" width="0.3048" layer="1"/>
<pad name="P$3" x="10.16" y="0" drill="1.4"/>
<pad name="PA$3" x="10.16" y="5.08" drill="1.4"/>
<wire x1="10.16" y1="5.08" x2="10.16" y2="0" width="0.3048" layer="1"/>
</package>
<package name="PHOENIX_TH_SIDE_200_1X3">
<description>PHOENIX Header - 2 Pos
Mounting can be vertial or horzantial.  If Horz version is used then must leave at least .375 for plug.  Can be mounted at edge of PCM for either vert or horz version.</description>
<pad name="P$1" x="0" y="0" drill="1.5"/>
<pad name="P$2" x="5.08" y="0" drill="1.5"/>
<wire x1="-3.048" y1="-9.779" x2="-3.048" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-3.048" y1="2.032" x2="13.462" y2="2.032" width="0.1524" layer="21"/>
<wire x1="13.462" y1="2.032" x2="13.462" y2="-9.779" width="0.1524" layer="21"/>
<wire x1="13.462" y1="-9.779" x2="-3.048" y2="-9.779" width="0.1524" layer="21"/>
<text x="-1.27" y="2.54" size="1.27" layer="25" font="vector" ratio="12">&gt;Name</text>
<text x="-1.27" y="-3.81" size="1.27" layer="27" font="vector" ratio="12">&gt;Value</text>
<text x="-2.54" y="-1.27" size="1.27" layer="21">1</text>
<pad name="P$3" x="10.16" y="0" drill="1.5"/>
</package>
<package name="TRIMPOT_3361P">
<description>Surface Mount Trimpot from Bourns -- 3361P</description>
<smd name="2" x="0" y="0" dx="1.2" dy="3.3" layer="1"/>
<smd name="1" x="-2.54" y="-6.4" dx="1.2" dy="3.3" layer="1"/>
<smd name="3" x="2.54" y="-6.4" dx="1.2" dy="3.3" layer="1"/>
<wire x1="3.683" y1="0.254" x2="3.683" y2="-6.731" width="0.1524" layer="21"/>
<wire x1="-3.683" y1="-6.731" x2="-3.683" y2="0.254" width="0.1524" layer="21"/>
<wire x1="-3.683" y1="0.254" x2="-1.27" y2="0.254" width="0.1524" layer="21"/>
<wire x1="3.683" y1="0.254" x2="1.27" y2="0.254" width="0.1524" layer="21"/>
<wire x1="-1.397" y1="-6.731" x2="1.524" y2="-6.731" width="0.1524" layer="21"/>
<circle x="0" y="-3.429" radius="1.27633125" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-3.429" x2="1.27" y2="-3.429" width="0.1524" layer="21"/>
<wire x1="0" y1="-2.159" x2="0" y2="-4.699" width="0.1524" layer="21"/>
<text x="-4.445" y="-6.223" size="1.4224" layer="25" font="vector" ratio="12" rot="R90">&gt;NAME</text>
<text x="5.842" y="-7.112" size="1.4224" layer="27" font="vector" ratio="12" rot="R90">&gt;VALUE</text>
</package>
<package name="PINHDR_TH_098_1X2">
<wire x1="2.75" y1="2" x2="-2.85" y2="2" width="0.254" layer="21"/>
<wire x1="-2.85" y1="2" x2="-2.85" y2="-2" width="0.254" layer="21"/>
<wire x1="-2.85" y1="-2" x2="2.75" y2="-2" width="0.254" layer="21"/>
<wire x1="2.75" y1="-2" x2="2.75" y2="2" width="0.254" layer="21"/>
<pad name="1" x="-1.25" y="0" drill="1"/>
<pad name="2" x="1.25" y="0" drill="1"/>
<text x="-3.29" y="-1.74" size="0.8" layer="25" ratio="15" rot="R90">&gt;NAME</text>
<text x="-1.1704" y="-3.2668" size="1.27" layer="21" ratio="12" rot="R90">1</text>
<text x="4.15" y="-2.2" size="0.8" layer="27" ratio="15" rot="R90">&gt;VALUE</text>
</package>
<package name="PINHDR_TH_100_1X2">
<wire x1="3.185" y1="1.905" x2="-3.165" y2="1.905" width="0.16" layer="21"/>
<wire x1="-3.165" y1="1.905" x2="-3.165" y2="-1.905" width="0.16" layer="21"/>
<wire x1="-3.165" y1="-1.905" x2="3.185" y2="-1.905" width="0.16" layer="21"/>
<wire x1="3.185" y1="-1.905" x2="3.185" y2="1.905" width="0.16" layer="21"/>
<pad name="1" x="-1.27" y="0" drill="1"/>
<pad name="2" x="1.27" y="0" drill="1"/>
<text x="-3.54" y="-1.74" size="0.8" layer="25" ratio="15" rot="R90">&gt;NAME</text>
<text x="-1.2" y="-3.075" size="1.27" layer="21" ratio="12" rot="R90">1</text>
<text x="4.4" y="-2.1" size="0.8" layer="27" ratio="15" rot="R90">&gt;VALUE</text>
</package>
<package name="JST-XH_098_VERT_1X2">
<description>JST Connector, XH Series, 0.098 Inch, 1x2</description>
<pad name="1" x="0" y="0" drill="1" shape="square"/>
<pad name="2" x="-2.5" y="0" drill="1"/>
<text x="1.5072" y="-1.2796" size="1.27" layer="21" ratio="12" rot="R180">1</text>
<text x="-5.517" y="-3.394" size="1.27" layer="25" font="vector" ratio="12" rot="R90">&gt;NAME</text>
<wire x1="2.45" y1="2.5" x2="2.45" y2="-3.5" width="0.1524" layer="21"/>
<wire x1="2.45" y1="-3.5" x2="-4.95" y2="-3.5" width="0.1524" layer="21"/>
<wire x1="-4.95" y1="-3.5" x2="-4.95" y2="2.5" width="0.1524" layer="21"/>
<wire x1="-4.95" y1="2.5" x2="-3.15" y2="2.5" width="0.1524" layer="21"/>
<wire x1="2.45" y1="2.5" x2="0.45" y2="2.5" width="0.1524" layer="21"/>
<text x="-4.417" y="-5.235" size="1.27" layer="27" font="vector" ratio="12">&gt;VALUE</text>
</package>
<package name="JST-XH_098_HORZ_1X2">
<description>XH Connector, 2 Position, Through Hole, Right Angle
Taked from XH Connector Documnet.  Model No. S2B-XH-A.</description>
<pad name="2" x="-1.25" y="0" drill="1"/>
<pad name="1" x="1.25" y="0" drill="1" shape="square"/>
<wire x1="-3.7" y1="9.2" x2="3.7" y2="9.2" width="0.1" layer="51"/>
<wire x1="-3.7" y1="-2.3" x2="-3.3" y2="-2.3" width="0.1" layer="51"/>
<wire x1="3.3" y1="-2.3" x2="3.7" y2="-2.3" width="0.1" layer="51"/>
<wire x1="3.7" y1="-2.3" x2="3.7" y2="9.2" width="0.1" layer="51"/>
<wire x1="-3.7" y1="-2.3" x2="-3.7" y2="9.2" width="0.1" layer="51"/>
<wire x1="-3.3" y1="0.3" x2="-2.4" y2="0.3" width="0.1524" layer="51"/>
<wire x1="-2.4" y1="0.3" x2="-2.4" y2="1.3" width="0.1524" layer="51"/>
<wire x1="-2.4" y1="1.3" x2="-0.2" y2="1.3" width="0.1524" layer="51"/>
<wire x1="-0.2" y1="1.3" x2="-0.2" y2="0.3" width="0.1524" layer="51"/>
<wire x1="-0.2" y1="0.3" x2="0.2" y2="0.3" width="0.1524" layer="51"/>
<wire x1="0.2" y1="0.3" x2="0.2" y2="1.3" width="0.1524" layer="51"/>
<wire x1="0.2" y1="1.3" x2="2.4" y2="1.3" width="0.1524" layer="51"/>
<wire x1="2.4" y1="1.3" x2="2.4" y2="0.3" width="0.1524" layer="51"/>
<wire x1="2.4" y1="0.3" x2="3.3" y2="0.3" width="0.1524" layer="51"/>
<wire x1="3.3" y1="0.3" x2="3.3" y2="-2.3" width="0.1" layer="51"/>
<wire x1="-3.3" y1="0.3" x2="-3.3" y2="-2.3" width="0.1" layer="51"/>
<text x="2.564" y="-1.927" size="1.27" layer="51" font="vector" ratio="12" rot="R90">1</text>
<text x="-2.856" y="6.613" size="1.27" layer="25" font="vector" ratio="12">&gt;NAME</text>
<text x="-3.229" y="3.863" size="1.27" layer="27" font="vector" ratio="12">&gt;VALUE</text>
<wire x1="3.7" y1="-2.3" x2="3.7" y2="9.2" width="0.1524" layer="21"/>
<wire x1="3.7" y1="9.2" x2="-3.7" y2="9.2" width="0.1524" layer="21"/>
<wire x1="-3.7" y1="9.2" x2="-3.7" y2="-2.3" width="0.1524" layer="21"/>
<wire x1="-3.7" y1="-2.3" x2="-3.3" y2="-2.3" width="0.16" layer="21"/>
<wire x1="-3.3" y1="-2.3" x2="-3.3" y2="0.3" width="0.1524" layer="21"/>
<wire x1="3.7" y1="-2.3" x2="3.3" y2="-2.3" width="0.1524" layer="21"/>
<wire x1="3.3" y1="-2.3" x2="3.3" y2="0.3" width="0.1524" layer="21"/>
</package>
<package name="TERMBLOCK_TH_200_1X2">
<pad name="P$1" x="0" y="0" drill="1.6"/>
<pad name="P$2" x="5.08" y="0" drill="1.6"/>
<wire x1="-2.54" y1="-5.08" x2="-2.54" y2="5.08" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="5.08" x2="7.62" y2="5.08" width="0.1524" layer="21"/>
<wire x1="7.62" y1="5.08" x2="7.62" y2="-5.08" width="0.1524" layer="21"/>
<wire x1="7.62" y1="-5.08" x2="-2.54" y2="-5.08" width="0.1524" layer="21"/>
<text x="-1.27" y="6.35" size="1.27" layer="25" font="vector" ratio="12">&gt;Name</text>
<text x="-1.27" y="-7.62" size="1.27" layer="27" font="vector" ratio="12">&gt;Value</text>
<text x="-1.27" y="-2.54" size="1.27" layer="21">1</text>
</package>
<package name="PH2_TH_SIDE_200_1X2">
<description>PHOENIX Header - 2 Pos
Mounting can be vertial or horzantial.  If Horz version is used then must leave at least .375 for plug.  Can be mounted at edge of PCM for either vert or horz version.</description>
<pad name="P$1" x="0" y="0" drill="1.4"/>
<pad name="P$2" x="5.08" y="0" drill="1.4"/>
<wire x1="-3.175" y1="-2.794" x2="-3.175" y2="7.874" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="7.874" x2="8.255" y2="7.874" width="0.1524" layer="21"/>
<wire x1="8.255" y1="7.874" x2="8.255" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="8.255" y1="-2.794" x2="-3.175" y2="-2.794" width="0.1524" layer="21"/>
<text x="-3.81" y="8.89" size="1.27" layer="25" font="vector" ratio="12">&gt;Name</text>
<text x="-3.81" y="-5.08" size="1.27" layer="27" font="vector" ratio="12">&gt;Value</text>
<text x="-2.54" y="-1.27" size="1.27" layer="21">1</text>
<pad name="PA$1" x="0" y="5.08" drill="1.4"/>
<pad name="PA$2" x="5.08" y="5.08" drill="1.4"/>
<wire x1="0" y1="5.08" x2="0" y2="0" width="0.3048" layer="1"/>
<wire x1="5.08" y1="5.08" x2="5.08" y2="0" width="0.3048" layer="1"/>
</package>
<package name="PHOENIX_TH_SIDE_200_1X2">
<description>PHOENIX Header - 2 Pos
Mounting can be vertial or horzantial.  If Horz version is used then must leave at least .375 for plug.  Can be mounted at edge of PCM for either vert or horz version.</description>
<pad name="P$1" x="0" y="0" drill="1.5"/>
<pad name="P$2" x="5.08" y="0" drill="1.5"/>
<wire x1="-3.048" y1="-9.779" x2="-3.048" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-3.048" y1="2.032" x2="8.382" y2="2.032" width="0.1524" layer="21"/>
<wire x1="8.382" y1="2.032" x2="8.382" y2="-9.779" width="0.1524" layer="21"/>
<wire x1="8.382" y1="-9.779" x2="-3.048" y2="-9.779" width="0.1524" layer="21"/>
<text x="-1.27" y="2.54" size="1.27" layer="25" font="vector" ratio="12">&gt;Name</text>
<text x="-1.27" y="-3.81" size="1.27" layer="27" font="vector" ratio="12">&gt;Value</text>
<text x="-2.54" y="-1.27" size="1.27" layer="21">1</text>
</package>
<package name="TO-92">
<pad name="P$1" x="0" y="0" drill="0.6"/>
<pad name="P$2" x="2.54" y="0" drill="0.6"/>
<pad name="P$3" x="5.08" y="0" drill="0.6"/>
<wire x1="-1.27" y1="-1.27" x2="6.35" y2="-1.27" width="0.127" layer="21"/>
<text x="-0.254" y="3.175" size="1.27" layer="25" font="vector" ratio="12">&gt;Name</text>
<text x="-0.635" y="-3.302" size="1.27" layer="25" font="vector" ratio="12">&gt;Value</text>
<wire x1="-1.27" y1="-1.27" x2="-1.27" y2="0" width="0.127" layer="25"/>
<wire x1="6.35" y1="-1.27" x2="6.35" y2="0" width="0.127" layer="25"/>
<wire x1="-1.27" y1="0" x2="6.35" y2="0" width="0.127" layer="25" curve="-126.869898"/>
</package>
<package name="TALAN_PWM">
<pad name="B+" x="10.16" y="35.56" drill="5.08"/>
<pad name="B-" x="10.16" y="22.86" drill="5.08"/>
<pad name="M-" x="60.96" y="22.86" drill="5.08"/>
<pad name="M+" x="60.96" y="35.56" drill="5.08"/>
<wire x1="0" y1="48.26" x2="0" y2="0" width="0.127" layer="21"/>
<wire x1="0" y1="0" x2="69.85" y2="0" width="0.127" layer="21"/>
<wire x1="69.85" y1="0" x2="69.85" y2="48.26" width="0.127" layer="21"/>
<wire x1="69.85" y1="48.26" x2="0" y2="48.26" width="0.127" layer="21"/>
<text x="25.4" y="29.21" size="3.81" layer="21">TALAN</text>
<text x="50.8" y="8.89" size="1.27" layer="21">&gt;Name</text>
<text x="50.8" y="6.35" size="1.27" layer="21">&gt;Value</text>
<pad name="GND" x="26.67" y="13.97" drill="1"/>
<pad name="5V" x="26.67" y="10.16" drill="1"/>
<pad name="PWM" x="26.67" y="6.35" drill="1"/>
<text x="29.21" y="5.08" size="1.27" layer="21">PWM</text>
<text x="29.464" y="9.525" size="1.27" layer="21">5v</text>
<text x="29.21" y="13.97" size="1.27" layer="21">GND</text>
<text x="15.24" y="34.29" size="2.54" layer="21">B+</text>
<text x="15.24" y="22.86" size="2.54" layer="21">B-</text>
<text x="50.8" y="34.29" size="2.54" layer="21">M+</text>
<text x="52.07" y="21.59" size="2.54" layer="21">M-</text>
</package>
<package name="SPST_TOGGLE">
<pad name="P$1" x="0" y="0" drill="2.2"/>
<pad name="P$2" x="4.699" y="0" drill="2.2"/>
<pad name="P$3" x="9.398" y="0" drill="2.2"/>
<wire x1="-2.54" y1="4.318" x2="11.938" y2="4.318" width="0.127" layer="21"/>
<wire x1="-2.54" y1="-4.318" x2="11.938" y2="-4.318" width="0.127" layer="21"/>
<wire x1="-2.54" y1="-4.318" x2="-2.54" y2="4.318" width="0.127" layer="21"/>
<wire x1="11.938" y1="-4.318" x2="11.938" y2="4.318" width="0.127" layer="21"/>
<text x="-1.27" y="2.54" size="1.27" layer="25" font="vector" ratio="12">&gt;Name</text>
<text x="-1.27" y="-3.81" size="1.27" layer="21" font="vector" ratio="12">&gt;Value</text>
</package>
<package name="DIP8">
<pad name="P$1" x="0" y="0" drill="1" shape="square"/>
<pad name="P$2" x="0" y="-2.54" drill="1"/>
<pad name="P$3" x="0" y="-5.08" drill="1"/>
<pad name="P$4" x="0" y="-7.62" drill="1"/>
<pad name="P$5" x="7.62" y="-7.62" drill="1"/>
<pad name="P$6" x="7.62" y="-5.08" drill="1"/>
<pad name="P$7" x="7.62" y="-2.54" drill="1"/>
<pad name="P$8" x="7.62" y="0" drill="1"/>
<wire x1="1.27" y1="1.27" x2="1.27" y2="-7.62" width="0.127" layer="21"/>
<wire x1="1.27" y1="-7.62" x2="6.35" y2="-7.62" width="0.127" layer="21"/>
<wire x1="6.35" y1="-7.62" x2="6.35" y2="1.27" width="0.127" layer="21"/>
<wire x1="6.35" y1="1.27" x2="1.27" y2="1.27" width="0.127" layer="21"/>
<circle x="2.54" y="0" radius="0.683915625" width="0.127" layer="21"/>
<text x="1.27" y="2.54" size="1.27" layer="25">&gt;NAME</text>
<text x="1.27" y="-10.16" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="QUAD_ENCODER">
<pad name="A" x="0" y="0" drill="1"/>
<pad name="B" x="0" y="-2.54" drill="1"/>
<pad name="5V" x="10.16" y="0" drill="1"/>
<pad name="GND" x="10.16" y="-5.08" drill="1"/>
<wire x1="-1.27" y1="6.35" x2="11.43" y2="6.35" width="0.127" layer="21"/>
<wire x1="11.43" y1="6.35" x2="11.43" y2="-11.43" width="0.127" layer="21"/>
<wire x1="11.43" y1="-11.43" x2="-1.27" y2="-11.43" width="0.127" layer="21"/>
<wire x1="-1.27" y1="-11.43" x2="-1.27" y2="6.35" width="0.127" layer="21"/>
<circle x="0" y="5.08" radius="0.40160625" width="0.127" layer="21"/>
<circle x="0" y="2.54" radius="0.40160625" width="0.127" layer="21"/>
<circle x="0" y="-5.08" radius="0.40160625" width="0.127" layer="21"/>
<circle x="0" y="-7.62" radius="0.40160625" width="0.127" layer="21"/>
<circle x="0" y="-10.16" radius="0.40160625" width="0.127" layer="21"/>
<circle x="10.16" y="-10.16" radius="0.40160625" width="0.127" layer="21"/>
<circle x="10.16" y="-7.62" radius="0.40160625" width="0.127" layer="21"/>
<circle x="10.16" y="-2.54" radius="0.40160625" width="0.127" layer="21"/>
<circle x="10.16" y="2.54" radius="0.40160625" width="0.127" layer="21"/>
<circle x="10.16" y="5.08" radius="0.40160625" width="0.127" layer="21"/>
<text x="1.27" y="7.62" size="1.27" layer="21">&gt;NAME</text>
<text x="1.27" y="-13.97" size="1.27" layer="21">&gt;VALUE</text>
<text x="1.905" y="-0.635" size="1.27" layer="21">A</text>
<text x="1.905" y="-3.302" size="1.27" layer="21">B</text>
<text x="4.826" y="-5.842" size="1.27" layer="21">GND</text>
<text x="6.477" y="-0.635" size="1.27" layer="21">5v</text>
</package>
</packages>
<symbols>
<symbol name="+05V">
<wire x1="-0.635" y1="1.27" x2="0.635" y2="1.27" width="0.1524" layer="94"/>
<wire x1="0" y1="0.635" x2="0" y2="1.905" width="0.1524" layer="94"/>
<circle x="0" y="1.27" radius="1.27" width="0.254" layer="94"/>
<text x="-1.905" y="3.175" size="1.778" layer="96">&gt;VALUE</text>
<pin name="+5V" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="GND-1">
<wire x1="-1.27" y1="0" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="0" y2="-1.524" width="0.254" layer="94"/>
<wire x1="0" y1="-1.524" x2="-1.27" y2="0" width="0.254" layer="94"/>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
<symbol name="OPAMP">
<description>Simple Op Amp</description>
<wire x1="-3.81" y1="3.175" x2="-3.81" y2="1.905" width="0.1524" layer="94"/>
<wire x1="-4.445" y1="2.54" x2="-3.175" y2="2.54" width="0.1524" layer="94"/>
<wire x1="-4.445" y1="-2.54" x2="-3.175" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="5.08" y1="0" x2="-5.08" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-5.08" y1="5.08" x2="-5.08" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="-5.08" y1="-5.08" x2="5.08" y2="0" width="0.4064" layer="94"/>
<text x="2.54" y="-5.08" size="1.778" layer="95">&gt;NAME</text>
<text x="2.54" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<pin name="-IN" x="-7.62" y="-2.54" visible="off" length="short" direction="in"/>
<pin name="+IN" x="-7.62" y="2.54" visible="off" length="short" direction="in"/>
<pin name="OUT" x="7.62" y="0" visible="off" length="short" direction="out" rot="R180"/>
</symbol>
<symbol name="OPAMP_PWR">
<description>Simple Op Amp</description>
<wire x1="-3.81" y1="3.175" x2="-3.81" y2="1.905" width="0.1524" layer="94"/>
<wire x1="-4.445" y1="2.54" x2="-3.175" y2="2.54" width="0.1524" layer="94"/>
<wire x1="-4.445" y1="-2.54" x2="-3.175" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="5.08" y1="0" x2="-5.08" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-5.08" y1="5.08" x2="-5.08" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="-5.08" y1="-5.08" x2="5.08" y2="0" width="0.4064" layer="94"/>
<text x="2.54" y="-5.08" size="1.778" layer="95">&gt;NAME</text>
<text x="2.54" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<pin name="-IN" x="-7.62" y="-2.54" visible="off" length="short" direction="in"/>
<pin name="+IN" x="-7.62" y="2.54" visible="off" length="short" direction="in"/>
<pin name="OUT" x="7.62" y="0" visible="off" length="short" direction="out" rot="R180"/>
<pin name="P+" x="0" y="5.08" visible="off" length="short" direction="pas" rot="R270"/>
<pin name="P-" x="0" y="-5.08" visible="off" length="short" direction="pas" rot="R90"/>
</symbol>
<symbol name="R">
<wire x1="-5.08" y1="0" x2="-3.175" y2="0" width="0.254" layer="94"/>
<wire x1="2.54" y1="0" x2="5.08" y2="0" width="0.254" layer="94"/>
<wire x1="-3.175" y1="0" x2="-2.54" y2="1.016" width="0.254" layer="94"/>
<wire x1="-2.54" y1="1.016" x2="-1.905" y2="-0.762" width="0.254" layer="94"/>
<wire x1="-1.905" y1="-0.762" x2="-1.27" y2="1.016" width="0.254" layer="94"/>
<wire x1="-1.27" y1="1.016" x2="-0.635" y2="-0.762" width="0.254" layer="94"/>
<wire x1="-0.635" y1="-0.762" x2="0" y2="1.016" width="0.254" layer="94"/>
<wire x1="0" y1="1.016" x2="0.635" y2="-0.762" width="0.254" layer="94"/>
<wire x1="0.635" y1="-0.762" x2="1.27" y2="1.016" width="0.254" layer="94"/>
<wire x1="1.27" y1="1.016" x2="1.905" y2="-0.762" width="0.254" layer="94"/>
<wire x1="1.905" y1="-0.762" x2="2.54" y2="0" width="0.254" layer="94"/>
<text x="-3.556" y="1.778" size="1.778" layer="95">&gt;NAME</text>
<text x="-3.556" y="-3.302" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-5.08" y="0" visible="off" length="point" direction="pas"/>
<pin name="2" x="5.08" y="0" visible="off" length="point" direction="pas" rot="R180"/>
</symbol>
<symbol name="POT">
<pin name="P$1" x="-5.08" y="0" visible="off" length="point" direction="pas"/>
<pin name="P$2" x="0" y="-5.08" visible="off" length="point" direction="pas" rot="R90"/>
<pin name="P$3" x="5.08" y="0" visible="off" length="point" direction="pas" rot="R180"/>
<wire x1="-4.572" y1="0" x2="-3.81" y2="1.27" width="0.254" layer="94"/>
<wire x1="-3.81" y1="1.27" x2="-2.54" y2="-1.016" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-1.016" x2="-1.27" y2="1.27" width="0.254" layer="94"/>
<wire x1="-1.27" y1="1.27" x2="0" y2="-1.016" width="0.254" layer="94"/>
<wire x1="0" y1="-1.016" x2="1.27" y2="1.27" width="0.254" layer="94"/>
<wire x1="1.27" y1="1.27" x2="2.54" y2="-1.016" width="0.254" layer="94"/>
<wire x1="2.54" y1="-1.016" x2="3.556" y2="1.016" width="0.254" layer="94"/>
<wire x1="3.556" y1="1.016" x2="4.064" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="-1.778" x2="-1.016" y2="-3.048" width="0.254" layer="94"/>
<wire x1="-1.016" y1="-3.048" x2="0" y2="-3.048" width="0.254" layer="94"/>
<wire x1="0" y1="-3.048" x2="1.27" y2="-3.048" width="0.254" layer="94"/>
<wire x1="1.27" y1="-3.048" x2="0" y2="-1.778" width="0.254" layer="94"/>
<wire x1="-5.08" y1="0" x2="-4.572" y2="0" width="0.254" layer="94"/>
<wire x1="4.064" y1="0" x2="5.08" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="-3.048" x2="0" y2="-5.08" width="0.254" layer="94"/>
<text x="-2.54" y="2.54" size="1.27" layer="95">&gt;Name</text>
<text x="2.54" y="-3.81" size="1.27" layer="96">&gt;Value</text>
</symbol>
<symbol name="LED">
<wire x1="0" y1="1.524" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="0" y2="-1.524" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="2.54" y2="1.016" width="0.254" layer="94"/>
<wire x1="2.54" y1="1.016" x2="2.54" y2="-1.27" width="0.254" layer="94"/>
<wire x1="2.54" y1="-1.27" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="3.302" x2="1.524" y2="1.524" width="0.254" layer="94"/>
<wire x1="1.016" y1="3.81" x2="2.54" y2="2.032" width="0.254" layer="94"/>
<wire x1="1.016" y1="3.81" x2="1.27" y2="3.048" width="0.254" layer="94"/>
<wire x1="1.016" y1="3.81" x2="1.778" y2="3.302" width="0.254" layer="94"/>
<wire x1="0" y1="3.302" x2="0.254" y2="2.54" width="0.254" layer="94"/>
<wire x1="0" y1="3.302" x2="0.762" y2="2.794" width="0.254" layer="94"/>
<wire x1="4.318" y1="-1.27" x2="4.318" y2="-2.794" width="0.254" layer="94"/>
<wire x1="3.556" y1="-2.032" x2="5.08" y2="-2.032" width="0.254" layer="94"/>
<text x="-2.54" y="4.318" size="1.778" layer="95">&gt;Name</text>
<pin name="CATHODE" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
<pin name="ANODE" x="5.08" y="0" visible="off" length="short" direction="pas" rot="R180"/>
<text x="-3.556" y="-4.826" size="1.778" layer="96">&gt;VALUE</text>
</symbol>
<symbol name="ESP8266">
<pin name="P$1" x="-5.08" y="0" visible="off" length="middle" direction="pas"/>
<pin name="P$2" x="-5.08" y="-2.54" visible="off" length="middle" direction="pas"/>
<pin name="P$3" x="-5.08" y="-5.08" visible="off" length="middle" direction="pas"/>
<pin name="P$4" x="-5.08" y="-7.62" visible="off" length="middle" direction="pas"/>
<pin name="P$5" x="-5.08" y="-10.16" visible="off" length="middle" direction="pas"/>
<pin name="P$6" x="-5.08" y="-12.7" visible="off" length="middle" direction="pas"/>
<pin name="P$7" x="-5.08" y="-15.24" visible="off" length="middle" direction="pas"/>
<pin name="P$8" x="-5.08" y="-17.78" visible="off" length="middle" direction="pas"/>
<pin name="P$9" x="-5.08" y="-20.32" visible="off" length="middle" direction="pas"/>
<pin name="P$10" x="-5.08" y="-22.86" visible="off" length="middle" direction="pas"/>
<pin name="P$11" x="-5.08" y="-25.4" visible="off" length="middle" direction="pas"/>
<pin name="P$12" x="-5.08" y="-27.94" visible="off" length="middle" direction="pas"/>
<pin name="P$13" x="-5.08" y="-30.48" visible="off" length="middle" direction="pas"/>
<pin name="P$14" x="-5.08" y="-33.02" visible="off" length="middle" direction="pas"/>
<pin name="P$15" x="-5.08" y="-35.56" visible="off" length="middle" direction="pas"/>
<pin name="P$16" x="27.94" y="-35.56" visible="off" length="middle" direction="pas" rot="R180"/>
<pin name="P$17" x="27.94" y="-33.02" visible="off" length="middle" direction="pas" rot="R180"/>
<pin name="P$18" x="27.94" y="-30.48" visible="off" length="middle" direction="pas" rot="R180"/>
<pin name="P$19" x="27.94" y="-27.94" visible="off" length="middle" direction="pas" rot="R180"/>
<pin name="P$20" x="27.94" y="-25.4" visible="off" length="middle" direction="pas" rot="R180"/>
<pin name="P$21" x="27.94" y="-22.86" visible="off" length="middle" direction="pas" rot="R180"/>
<pin name="P$22" x="27.94" y="-20.32" visible="off" length="middle" direction="pas" rot="R180"/>
<pin name="P$23" x="27.94" y="-17.78" visible="off" length="middle" direction="pas" rot="R180"/>
<pin name="P$24" x="27.94" y="-15.24" visible="off" length="middle" direction="pas" rot="R180"/>
<pin name="P$25" x="27.94" y="-12.7" visible="off" length="middle" direction="pas" rot="R180"/>
<pin name="P$26" x="27.94" y="-10.16" visible="off" length="middle" direction="pas" rot="R180"/>
<pin name="P$27" x="27.94" y="-7.62" visible="off" length="middle" direction="pas" rot="R180"/>
<pin name="P$28" x="27.94" y="-5.08" visible="off" length="middle" direction="pas" rot="R180"/>
<pin name="P$29" x="27.94" y="-2.54" visible="off" length="middle" direction="pas" rot="R180"/>
<pin name="P$30" x="27.94" y="0" visible="off" length="middle" direction="pas" rot="R180"/>
<text x="2.54" y="0" size="1.27" layer="94">3v3</text>
<text x="2.54" y="-2.54" size="1.27" layer="94">GND</text>
<text x="2.54" y="-5.08" size="1.27" layer="94">TX</text>
<text x="2.54" y="-7.62" size="1.27" layer="94">RX</text>
<text x="2.54" y="-10.16" size="1.27" layer="94">D8</text>
<text x="2.54" y="-12.7" size="1.27" layer="94">D7</text>
<text x="2.54" y="-15.24" size="1.27" layer="94">D6</text>
<text x="2.54" y="-17.78" size="1.27" layer="94">D5</text>
<text x="2.54" y="-20.32" size="1.27" layer="94">GND</text>
<text x="2.54" y="-22.86" size="1.27" layer="94">3V3</text>
<text x="2.54" y="-25.4" size="1.27" layer="94">D4</text>
<text x="2.54" y="-27.94" size="1.27" layer="94">D3</text>
<text x="2.54" y="-30.48" size="1.27" layer="94">D2</text>
<text x="2.54" y="-33.02" size="1.27" layer="94">D1</text>
<text x="2.54" y="-35.56" size="1.27" layer="94">D0</text>
<text x="17.78" y="-35.56" size="1.27" layer="94">A0</text>
<text x="17.78" y="-33.02" size="1.27" layer="94">RSV</text>
<text x="17.78" y="-30.48" size="1.27" layer="94">RSV</text>
<text x="17.78" y="-27.94" size="1.27" layer="94">SD3</text>
<text x="17.78" y="-25.4" size="1.27" layer="94">SD2</text>
<text x="17.78" y="-22.86" size="1.27" layer="94">SD1</text>
<text x="17.78" y="-20.32" size="1.27" layer="94">CMD</text>
<text x="17.78" y="-17.78" size="1.27" layer="94">SDO</text>
<text x="17.78" y="-15.24" size="1.27" layer="94">CLK</text>
<text x="17.78" y="-12.7" size="1.27" layer="94">GND</text>
<text x="17.78" y="-10.16" size="1.27" layer="94">3V3</text>
<text x="17.78" y="-7.62" size="1.27" layer="94">EN</text>
<text x="17.78" y="-5.08" size="1.27" layer="94">RST</text>
<text x="17.78" y="-2.54" size="1.27" layer="94">GND</text>
<text x="17.78" y="0" size="1.27" layer="94">VIN</text>
<text x="12.7" y="-12.7" size="1.6764" layer="94" rot="R90">ESP8266</text>
<wire x1="0" y1="2.54" x2="22.86" y2="2.54" width="0.254" layer="94"/>
<wire x1="22.86" y1="2.54" x2="22.86" y2="-38.1" width="0.254" layer="94"/>
<wire x1="22.86" y1="-38.1" x2="0" y2="-38.1" width="0.254" layer="94"/>
<wire x1="0" y1="-38.1" x2="0" y2="2.54" width="0.254" layer="94"/>
<text x="7.62" y="3.556" size="1.6764" layer="95">&gt;NAME</text>
<text x="6.858" y="-40.894" size="1.6764" layer="96">&gt;VALUE</text>
</symbol>
<symbol name="+3.3V">
<wire x1="-0.635" y1="1.27" x2="0.635" y2="1.27" width="0.1524" layer="94"/>
<wire x1="0" y1="0.635" x2="0" y2="1.905" width="0.1524" layer="94"/>
<circle x="0" y="1.27" radius="1.27" width="0.254" layer="94"/>
<text x="-1.905" y="3.175" size="1.778" layer="96">&gt;VALUE</text>
<pin name="+3.3V" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="V-REG">
<pin name="IN" x="-7.62" y="5.08" visible="off" length="short" direction="pas"/>
<pin name="GND" x="0" y="0" visible="off" length="short" direction="pas" rot="R90"/>
<pin name="OUT" x="7.62" y="5.08" visible="off" length="short" direction="pas" rot="R180"/>
<wire x1="-5.08" y1="10.16" x2="-5.08" y2="2.54" width="0.254" layer="94"/>
<wire x1="-5.08" y1="2.54" x2="5.08" y2="2.54" width="0.254" layer="94"/>
<wire x1="5.08" y1="2.54" x2="5.08" y2="10.16" width="0.254" layer="94"/>
<wire x1="5.08" y1="10.16" x2="-5.08" y2="10.16" width="0.254" layer="94"/>
<text x="-2.032" y="8.382" size="1.27" layer="94">VReg</text>
<text x="-4.318" y="5.08" size="1.27" layer="94">IN</text>
<text x="-1.778" y="3.048" size="1.27" layer="94">GND</text>
<text x="1.016" y="5.08" size="1.27" layer="94">OUT</text>
<text x="2.54" y="0" size="1.778" layer="96">&gt;Value</text>
<text x="-3.048" y="11.176" size="1.778" layer="95">&gt;Name</text>
</symbol>
<symbol name="CAP">
<wire x1="1.778" y1="1.27" x2="1.778" y2="0" width="0.254" layer="94"/>
<wire x1="1.778" y1="0" x2="1.778" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-2.54" y1="0" x2="0.127" y2="0" width="0.254" layer="94"/>
<wire x1="0.762" y1="0" x2="0.127" y2="0" width="0.254" layer="94"/>
<wire x1="1.778" y1="0" x2="5.08" y2="0" width="0.254" layer="94"/>
<wire x1="0.762" y1="0" x2="0.762" y2="-1.27" width="0.254" layer="94"/>
<wire x1="0.762" y1="1.27" x2="0.762" y2="0" width="0.254" layer="94"/>
<text x="-2.54" y="2.032" size="1.778" layer="95">&gt;NAME</text>
<text x="-2.54" y="-3.556" size="1.778" layer="96">&gt;VALUE</text>
<pin name="2" x="5.08" y="0" visible="off" length="short" direction="pas" rot="R180"/>
<pin name="1" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
</symbol>
<symbol name="PINHDR_1X3">
<wire x1="2.54" y1="0" x2="0.762" y2="0" width="0.254" layer="94"/>
<wire x1="2.54" y1="-2.54" x2="0.762" y2="-2.54" width="0.254" layer="94"/>
<wire x1="2.54" y1="-5.08" x2="0.762" y2="-5.08" width="0.254" layer="94"/>
<wire x1="2.54" y1="2.54" x2="-3.175" y2="2.54" width="0.254" layer="94"/>
<wire x1="-3.175" y1="2.54" x2="-3.175" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-3.175" y1="-7.62" x2="2.54" y2="-7.62" width="0.254" layer="94"/>
<wire x1="2.54" y1="-7.62" x2="2.54" y2="2.54" width="0.254" layer="94"/>
<circle x="0" y="0" radius="0.762" width="0.254" layer="94"/>
<circle x="0" y="-2.54" radius="0.762" width="0.254" layer="94"/>
<circle x="0" y="-5.08" radius="0.762" width="0.254" layer="94"/>
<text x="-4.064" y="3.048" size="1.778" layer="95">&gt;NAME</text>
<pin name="1" x="5.08" y="0" visible="off" length="short" direction="pas" rot="R180"/>
<pin name="2" x="5.08" y="-2.54" visible="off" length="short" direction="pas" rot="R180"/>
<pin name="3" x="5.08" y="-5.08" visible="off" length="short" direction="pas" rot="R180"/>
<text x="-2.54" y="-0.635" size="1.27" layer="94">1</text>
<text x="-2.54" y="-3.175" size="1.27" layer="94">2</text>
<text x="-2.54" y="-5.715" size="1.27" layer="94">3</text>
<text x="-4.572" y="-9.906" size="1.778" layer="96">&gt;VALUE</text>
</symbol>
<symbol name="PINHDR_1X2">
<wire x1="2.54" y1="0" x2="0.762" y2="0" width="0.254" layer="94"/>
<wire x1="2.54" y1="-2.54" x2="0.762" y2="-2.54" width="0.254" layer="94"/>
<wire x1="2.54" y1="2.54" x2="-3.175" y2="2.54" width="0.254" layer="94"/>
<wire x1="-3.175" y1="2.54" x2="-3.175" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-3.175" y1="-5.08" x2="2.54" y2="-5.08" width="0.254" layer="94"/>
<wire x1="2.54" y1="-5.08" x2="2.54" y2="2.54" width="0.254" layer="94"/>
<circle x="0" y="-2.54" radius="0.762" width="0.254" layer="94"/>
<circle x="0" y="0" radius="0.762" width="0.254" layer="94"/>
<text x="-4.572" y="3.048" size="1.778" layer="95">&gt;NAME</text>
<pin name="1" x="5.08" y="0" visible="off" length="short" direction="pas" rot="R180"/>
<pin name="2" x="5.08" y="-2.54" visible="off" length="short" direction="pas" rot="R180"/>
<text x="-2.54" y="-0.635" size="1.27" layer="94">1</text>
<text x="-2.54" y="-3.175" size="1.27" layer="94">2</text>
<text x="-4.572" y="-7.366" size="1.778" layer="96">&gt;VALUE</text>
</symbol>
<symbol name="T_NPN">
<pin name="BASE" x="-5.08" y="0" visible="off" length="short" direction="pas"/>
<pin name="COLLECTOR" x="2.54" y="2.54" visible="off" length="short" direction="pas" rot="R180"/>
<pin name="EMITTER" x="2.54" y="-2.54" visible="off" length="short" direction="pas" rot="R180"/>
<wire x1="-2.54" y1="1.778" x2="-2.54" y2="0.762" width="0.254" layer="94"/>
<wire x1="-2.54" y1="0.762" x2="-2.54" y2="-0.762" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-0.762" x2="-2.54" y2="-2.032" width="0.254" layer="94"/>
<wire x1="-2.54" y1="0.762" x2="-1.27" y2="1.778" width="0.254" layer="94"/>
<wire x1="-1.27" y1="1.778" x2="-1.27" y2="2.54" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-0.762" x2="-1.016" y2="-2.032" width="0.254" layer="94"/>
<wire x1="-1.016" y1="-2.032" x2="-1.27" y2="-1.27" width="0.254" layer="94"/>
<wire x1="-1.016" y1="-2.032" x2="-1.778" y2="-2.032" width="0.254" layer="94"/>
<text x="-5.08" y="-5.08" size="1.27" layer="96">&gt;Value</text>
<text x="-5.08" y="5.08" size="1.27" layer="95">&gt;Name</text>
<wire x1="-1.016" y1="-2.032" x2="-1.016" y2="-2.54" width="0.254" layer="94"/>
<wire x1="-1.016" y1="-2.54" x2="0" y2="-2.54" width="0.254" layer="94"/>
<wire x1="-1.27" y1="2.54" x2="0" y2="2.54" width="0.254" layer="94"/>
</symbol>
<symbol name="TALAN-OLDSTYLE">
<pin name="B+" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
<pin name="B-" x="-2.54" y="-5.08" visible="off" length="short" direction="pas"/>
<pin name="M+" x="20.32" y="0" visible="off" length="short" direction="pas" rot="R180"/>
<pin name="M-" x="20.32" y="-5.08" visible="off" length="short" direction="pas" rot="R180"/>
<wire x1="0" y1="2.54" x2="0" y2="-10.16" width="0.254" layer="94"/>
<wire x1="0" y1="-10.16" x2="17.78" y2="-10.16" width="0.254" layer="94"/>
<wire x1="17.78" y1="-10.16" x2="17.78" y2="2.54" width="0.254" layer="94"/>
<wire x1="17.78" y1="2.54" x2="0" y2="2.54" width="0.254" layer="94"/>
<text x="4.826" y="-3.048" size="1.778" layer="94">TALAN</text>
<text x="4.572" y="3.302" size="1.778" layer="95">&gt;NAME</text>
<text x="-4.064" y="-12.7" size="1.778" layer="96">&gt;VALUE</text>
<circle x="2.54" y="0" radius="1.27" width="0.254" layer="94"/>
<wire x1="1.778" y1="-1.016" x2="3.302" y2="1.016" width="0.254" layer="94"/>
<text x="4.572" y="0" size="1.27" layer="94">B+</text>
<text x="2.032" y="-8.128" size="1.27" layer="94">B-</text>
<text x="10.922" y="0" size="1.27" layer="94">M+</text>
<text x="14.478" y="-8.128" size="1.27" layer="94">M-</text>
<text x="12.954" y="-9.398" size="1.27" layer="94" rot="R90">GND</text>
<text x="10.668" y="-9.144" size="1.27" layer="94" rot="R90">+5</text>
<text x="7.874" y="-9.144" size="1.27" layer="94" rot="R90">PWM</text>
<circle x="2.54" y="-5.08" radius="1.27" width="0.254" layer="94"/>
<circle x="15.24" y="-5.08" radius="1.27" width="0.254" layer="94"/>
<circle x="15.24" y="0" radius="1.27" width="0.254" layer="94"/>
<wire x1="1.778" y1="-6.096" x2="3.302" y2="-4.064" width="0.254" layer="94"/>
<wire x1="14.478" y1="-6.096" x2="16.002" y2="-4.064" width="0.254" layer="94"/>
<wire x1="14.478" y1="-1.016" x2="16.002" y2="1.016" width="0.254" layer="94"/>
<pin name="PWM" x="7.62" y="-12.7" visible="off" length="short" direction="pas" rot="R90"/>
<pin name="5V" x="10.16" y="-12.7" visible="off" length="short" direction="pas" rot="R90"/>
<pin name="GND" x="12.7" y="-12.7" visible="off" length="short" direction="pas" rot="R90"/>
</symbol>
<symbol name="SPST_SWITCH">
<pin name="P$1" x="-5.08" y="2.54" visible="off" length="short" direction="pas"/>
<pin name="P$2" x="0" y="0" visible="off" length="point" direction="pas" rot="R90"/>
<pin name="P$3" x="5.08" y="2.54" visible="off" length="short" direction="pas" rot="R180"/>
<circle x="-1.778" y="2.54" radius="0.762" width="0.254" layer="94"/>
<circle x="1.778" y="2.54" radius="0.762" width="0.254" layer="94"/>
<text x="-10.16" y="5.08" size="1.778" layer="95">&gt;Name</text>
<text x="-10.16" y="-2.54" size="1.778" layer="96">&gt;Value</text>
<wire x1="0" y1="0" x2="-0.762" y2="3.302" width="0.254" layer="94"/>
</symbol>
<symbol name="QUAD_ENCODER">
<pin name="A" x="-7.62" y="2.54" visible="off" length="short" direction="pas"/>
<pin name="B" x="-7.62" y="-2.54" visible="off" length="short" direction="pas"/>
<pin name="5V" x="7.62" y="2.54" visible="off" length="short" direction="pas" rot="R180"/>
<pin name="GND" x="7.62" y="-2.54" visible="off" length="short" direction="pas" rot="R180"/>
<text x="-4.064" y="2.032" size="1.27" layer="94">A</text>
<text x="-3.81" y="-2.794" size="1.27" layer="94">B</text>
<text x="0.254" y="-3.048" size="1.27" layer="94">GND</text>
<text x="2.286" y="2.032" size="1.27" layer="94">5v</text>
<wire x1="-5.08" y1="5.08" x2="-5.08" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-5.08" x2="5.08" y2="-5.08" width="0.254" layer="94"/>
<wire x1="5.08" y1="-5.08" x2="5.08" y2="5.08" width="0.254" layer="94"/>
<wire x1="5.08" y1="5.08" x2="-5.08" y2="5.08" width="0.254" layer="94"/>
<text x="-2.54" y="3.556" size="1.27" layer="94">QUAD</text>
<text x="-4.318" y="-0.254" size="1.27" layer="94">ENCODER</text>
<text x="-5.08" y="7.62" size="1.27" layer="95">&gt;NAME</text>
<text x="-5.08" y="-7.62" size="1.27" layer="96">&gt;VALUE</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="+5V" prefix="SUPPLY">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="+5V" symbol="+05V" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="GND" prefix="GND">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="GND" symbol="GND-1" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="R" prefix="R" uservalue="yes">
<description>Standard Resistor -- Various Sizes and Wattages</description>
<gates>
<gate name="G$1" symbol="R" x="7.62" y="-2.54"/>
</gates>
<devices>
<device name="1X3/8INCH" package="R1X38">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="THOLE300" package="R300">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TH14MM" package="D14MM">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0805(2012METRIC)" package="R0805">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0603(1608METRIC)" package="R0603">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="1206(3216METRIC)" package="R1206">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="TRIMPOT" prefix="P" uservalue="yes">
<gates>
<gate name="G$1" symbol="POT" x="0" y="0"/>
</gates>
<devices>
<device name="-SIP" package="TRIMPOT_SIP_100">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
<connect gate="G$1" pin="P$3" pad="P$3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-SM" package="TRIMPOT_3361P">
<connects>
<connect gate="G$1" pin="P$1" pad="1"/>
<connect gate="G$1" pin="P$2" pad="2"/>
<connect gate="G$1" pin="P$3" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="LED" prefix="LED">
<description>Standard LED</description>
<gates>
<gate name="G$1" symbol="LED" x="-7.62" y="-5.08"/>
</gates>
<devices>
<device name="TH-3MM" package="LED-TH-3MM">
<connects>
<connect gate="G$1" pin="ANODE" pad="ANODE"/>
<connect gate="G$1" pin="CATHODE" pad="CATHODE"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TH-5MM" package="LED-TH-5MM">
<connects>
<connect gate="G$1" pin="ANODE" pad="ANODE"/>
<connect gate="G$1" pin="CATHODE" pad="CATHODE"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CHIP1206" package="CHIPLED_1206">
<connects>
<connect gate="G$1" pin="ANODE" pad="ANODE(+)"/>
<connect gate="G$1" pin="CATHODE" pad="CATHODE(-)"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TH-DIP-100" package="LED-TH100">
<connects>
<connect gate="G$1" pin="ANODE" pad="P$1"/>
<connect gate="G$1" pin="CATHODE" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0603" package="LED_0603">
<connects>
<connect gate="G$1" pin="ANODE" pad="ANODE(+)"/>
<connect gate="G$1" pin="CATHODE" pad="CATHODE(-)"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="1206" package="LED_1206">
<connects>
<connect gate="G$1" pin="ANODE" pad="ANODE(+)"/>
<connect gate="G$1" pin="CATHODE" pad="CATHODE(-)"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="ESP8266_MODULE" prefix="M">
<gates>
<gate name="G$1" symbol="ESP8266" x="-12.7" y="20.32"/>
</gates>
<devices>
<device name="" package="ESP8266_MODULE">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$10" pad="P$10"/>
<connect gate="G$1" pin="P$11" pad="P$11"/>
<connect gate="G$1" pin="P$12" pad="P$12"/>
<connect gate="G$1" pin="P$13" pad="P$13"/>
<connect gate="G$1" pin="P$14" pad="P$14"/>
<connect gate="G$1" pin="P$15" pad="P$15"/>
<connect gate="G$1" pin="P$16" pad="P$16"/>
<connect gate="G$1" pin="P$17" pad="P$17"/>
<connect gate="G$1" pin="P$18" pad="P$18"/>
<connect gate="G$1" pin="P$19" pad="P$19"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
<connect gate="G$1" pin="P$20" pad="P$20"/>
<connect gate="G$1" pin="P$21" pad="P$21"/>
<connect gate="G$1" pin="P$22" pad="P$22"/>
<connect gate="G$1" pin="P$23" pad="P$23"/>
<connect gate="G$1" pin="P$24" pad="P$24"/>
<connect gate="G$1" pin="P$25" pad="P$25"/>
<connect gate="G$1" pin="P$26" pad="P$26"/>
<connect gate="G$1" pin="P$27" pad="P$27"/>
<connect gate="G$1" pin="P$28" pad="P$28"/>
<connect gate="G$1" pin="P$29" pad="P$29"/>
<connect gate="G$1" pin="P$3" pad="P$3"/>
<connect gate="G$1" pin="P$30" pad="P$30"/>
<connect gate="G$1" pin="P$4" pad="P$4"/>
<connect gate="G$1" pin="P$5" pad="P$5"/>
<connect gate="G$1" pin="P$6" pad="P$6"/>
<connect gate="G$1" pin="P$7" pad="P$7"/>
<connect gate="G$1" pin="P$8" pad="P$8"/>
<connect gate="G$1" pin="P$9" pad="P$9"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="+3.3V" prefix="PWR">
<gates>
<gate name="G$1" symbol="+3.3V" x="0" y="2.54"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="VREG-3" prefix="U">
<description>3 Pin Voltage Regulator</description>
<gates>
<gate name="G$1" symbol="V-REG" x="-2.54" y="-10.16"/>
</gates>
<devices>
<device name="L7805CDT" package="TO252-3">
<connects>
<connect gate="G$1" pin="GND" pad="FIN"/>
<connect gate="G$1" pin="IN" pad="1"/>
<connect gate="G$1" pin="OUT" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-DIP" package="PINHDR_TH_100_1X3">
<connects>
<connect gate="G$1" pin="GND" pad="2"/>
<connect gate="G$1" pin="IN" pad="1"/>
<connect gate="G$1" pin="OUT" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="CAP" prefix="C" uservalue="yes">
<gates>
<gate name="G$1" symbol="CAP" x="-10.16" y="-5.08"/>
</gates>
<devices>
<device name="200" package="CAP200">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="300" package="CAP300">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0402" package="C0402">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0603" package="C0603">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="0805" package="C0805">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="1206" package="C1206">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="PINHDR_1X3" prefix="J">
<gates>
<gate name="G$1" symbol="PINHDR_1X3" x="0" y="0"/>
</gates>
<devices>
<device name="-098" package="PINHDR_TH_098_1X3">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-100" package="PINHDR_TH_100_1X3">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-156" package="PINHDR_TH_156_1X3">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-JST" package="JST-XH_098_VERT_1X3">
<connects>
<connect gate="G$1" pin="1" pad="3"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="1"/>
</connects>
<technologies>
<technology name="XH"/>
</technologies>
</device>
<device name="-200" package="TERMBLOCK_TH_200_1X3">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
<connect gate="G$1" pin="3" pad="P$3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-PH2" package="PH2_TH_SIDE_200_1X3">
<connects>
<connect gate="G$1" pin="1" pad="P$1 PA$1"/>
<connect gate="G$1" pin="2" pad="P$2 PA$2"/>
<connect gate="G$1" pin="3" pad="P$3 PA$3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-PH1" package="PHOENIX_TH_SIDE_200_1X3">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
<connect gate="G$1" pin="3" pad="P$3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="PINHDR_1X2" prefix="J">
<gates>
<gate name="G$1" symbol="PINHDR_1X2" x="0" y="0"/>
</gates>
<devices>
<device name="-098" package="PINHDR_TH_098_1X2">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-100" package="PINHDR_TH_100_1X2">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-JST" package="JST-XH_098_VERT_1X2">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-JST_HORZ" package="JST-XH_098_HORZ_1X2">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-200" package="TERMBLOCK_TH_200_1X2">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-PH2" package="PH2_TH_SIDE_200_1X2">
<connects>
<connect gate="G$1" pin="1" pad="P$1 PA$1"/>
<connect gate="G$1" pin="2" pad="P$2 PA$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-PH1" package="PHOENIX_TH_SIDE_200_1X2">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="T_NPN" prefix="T">
<gates>
<gate name="G$1" symbol="T_NPN" x="12.7" y="-2.54"/>
</gates>
<devices>
<device name="" package="TO-92">
<connects>
<connect gate="G$1" pin="BASE" pad="P$2"/>
<connect gate="G$1" pin="COLLECTOR" pad="P$1"/>
<connect gate="G$1" pin="EMITTER" pad="P$3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="TALAN" prefix="M">
<gates>
<gate name="G$1" symbol="TALAN-OLDSTYLE" x="-5.08" y="2.54"/>
</gates>
<devices>
<device name="" package="TALAN_PWM">
<connects>
<connect gate="G$1" pin="5V" pad="5V"/>
<connect gate="G$1" pin="B+" pad="B+"/>
<connect gate="G$1" pin="B-" pad="B-"/>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="M+" pad="M+"/>
<connect gate="G$1" pin="M-" pad="M-"/>
<connect gate="G$1" pin="PWM" pad="PWM"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="TOGGLE_SWITCH_SPST" prefix="S">
<gates>
<gate name="G$1" symbol="SPST_SWITCH" x="0" y="-2.54"/>
</gates>
<devices>
<device name="" package="SPST_TOGGLE">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
<connect gate="G$1" pin="P$3" pad="P$3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="LM2904" prefix="U">
<gates>
<gate name="G$1" symbol="OPAMP_PWR" x="0" y="0"/>
<gate name="G$2" symbol="OPAMP" x="0" y="-17.78"/>
</gates>
<devices>
<device name="" package="DIP8">
<connects>
<connect gate="G$1" pin="+IN" pad="P$3"/>
<connect gate="G$1" pin="-IN" pad="P$2"/>
<connect gate="G$1" pin="OUT" pad="P$1"/>
<connect gate="G$1" pin="P+" pad="P$8"/>
<connect gate="G$1" pin="P-" pad="P$4"/>
<connect gate="G$2" pin="+IN" pad="P$5"/>
<connect gate="G$2" pin="-IN" pad="P$6"/>
<connect gate="G$2" pin="OUT" pad="P$7"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="QUAD_ENCODER" prefix="U">
<gates>
<gate name="G$1" symbol="QUAD_ENCODER" x="0" y="0"/>
</gates>
<devices>
<device name="" package="QUAD_ENCODER">
<connects>
<connect gate="G$1" pin="5V" pad="5V"/>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="B" pad="B"/>
<connect gate="G$1" pin="GND" pad="GND"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="fuse" urn="urn:adsk.eagle:library:233">
<description>&lt;b&gt;Fuses and Fuse Holders&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="19559" urn="urn:adsk.eagle:footprint:14028/1" library_version="2">
<description>&lt;b&gt;FUSE HOLDER&lt;/b&gt;&lt;p&gt;
TR5 Fuse Holder Wickmann</description>
<wire x1="1.778" y1="-1.397" x2="2.413" y2="-2.032" width="0.1524" layer="51"/>
<wire x1="1.397" y1="-1.778" x2="2.032" y2="-2.413" width="0.1524" layer="51"/>
<wire x1="-2.032" y1="2.413" x2="-1.397" y2="1.778" width="0.1524" layer="51"/>
<wire x1="-2.413" y1="2.032" x2="-1.778" y2="1.397" width="0.1524" layer="51"/>
<wire x1="3.175" y1="-3.937" x2="2.413" y2="-3.175" width="0.1524" layer="51"/>
<wire x1="2.413" y1="-3.175" x2="3.175" y2="-2.413" width="0.1524" layer="51"/>
<wire x1="3.175" y1="-2.413" x2="3.937" y2="-3.175" width="0.1524" layer="51"/>
<wire x1="4.064" y1="-3.683" x2="3.683" y2="-4.064" width="0.1524" layer="21"/>
<wire x1="2.794" y1="-3.175" x2="3.175" y2="-2.794" width="0.1524" layer="51"/>
<wire x1="-3.175" y1="2.413" x2="-2.413" y2="3.175" width="0.1524" layer="51"/>
<wire x1="-3.175" y1="3.937" x2="-2.413" y2="3.175" width="0.1524" layer="51"/>
<wire x1="-3.937" y1="3.175" x2="-3.175" y2="2.413" width="0.1524" layer="51"/>
<wire x1="-3.175" y1="2.794" x2="-2.794" y2="3.175" width="0.1524" layer="51"/>
<wire x1="-4.064" y1="3.683" x2="-3.683" y2="4.064" width="0.1524" layer="21"/>
<wire x1="4.064" y1="-3.683" x2="3.683" y2="-3.302" width="0.1524" layer="21"/>
<wire x1="3.683" y1="-3.302" x2="3.175" y2="-2.794" width="0.1524" layer="51"/>
<wire x1="3.302" y1="-3.683" x2="3.683" y2="-4.064" width="0.1524" layer="21"/>
<wire x1="3.302" y1="-3.683" x2="2.794" y2="-3.175" width="0.1524" layer="51"/>
<wire x1="-4.064" y1="3.683" x2="-3.683" y2="3.302" width="0.1524" layer="21"/>
<wire x1="-3.683" y1="3.302" x2="-3.175" y2="2.794" width="0.1524" layer="51"/>
<wire x1="-3.683" y1="4.064" x2="-3.302" y2="3.683" width="0.1524" layer="21"/>
<wire x1="-3.302" y1="3.683" x2="-2.794" y2="3.175" width="0.1524" layer="51"/>
<circle x="0" y="0" radius="5.08" width="0.1524" layer="21"/>
<circle x="1.905" y="-1.905" radius="0.889" width="0.1524" layer="51"/>
<circle x="-1.905" y="1.905" radius="0.889" width="0.1524" layer="51"/>
<circle x="-1.905" y="1.905" radius="0.5334" width="0.1524" layer="51"/>
<circle x="1.905" y="-1.905" radius="0.5334" width="0.1524" layer="51"/>
<pad name="1" x="-2.54" y="2.54" drill="1.3208" diameter="2.54" shape="octagon"/>
<pad name="2" x="2.54" y="-2.54" drill="1.3208" diameter="2.54" shape="octagon"/>
<text x="-4.572" y="-0.889" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<text x="-3.81" y="5.334" size="1.778" layer="25" ratio="10">&gt;NAME</text>
</package>
<package name="19560" urn="urn:adsk.eagle:footprint:14029/1" library_version="2">
<description>&lt;b&gt;FUSE HOLDER&lt;/b&gt;&lt;p&gt;
TR5 Fuse Holder Wickmann</description>
<wire x1="2.54" y1="-3.937" x2="3.937" y2="-2.54" width="0.1524" layer="21" curve="177.916747"/>
<circle x="0" y="0" radius="4.699" width="0.1524" layer="21"/>
<circle x="2.54" y="0" radius="0.762" width="0.1524" layer="51"/>
<circle x="2.54" y="0" radius="0.254" width="0.254" layer="51"/>
<circle x="-2.54" y="0" radius="0.254" width="0.254" layer="51"/>
<circle x="-2.54" y="0" radius="0.762" width="0.1524" layer="51"/>
<pad name="1" x="-2.54" y="0" drill="0.8128" diameter="1.778" shape="long" rot="R90"/>
<pad name="2" x="2.54" y="0" drill="0.8128" diameter="1.778" shape="long" rot="R90"/>
<text x="-2.54" y="5.08" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.048" y="-2.54" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="F456" urn="urn:adsk.eagle:footprint:14039/1" library_version="2">
<description>&lt;b&gt;FUSE HOLDER&lt;/b&gt;&lt;p&gt;
CS Schukat</description>
<wire x1="-6.35" y1="-6.35" x2="-6.35" y2="6.35" width="0.1524" layer="21"/>
<wire x1="6.35" y1="6.35" x2="6.35" y2="-6.35" width="0.1524" layer="21"/>
<wire x1="-4.318" y1="1.27" x2="-2.54" y2="1.27" width="0.1524" layer="51"/>
<wire x1="-4.318" y1="-1.27" x2="-2.54" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="-2.54" y1="1.27" x2="-2.54" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="-2.54" y1="1.27" x2="2.54" y2="1.27" width="0.1524" layer="51"/>
<wire x1="-2.54" y1="-1.27" x2="2.54" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="2.54" y1="1.27" x2="2.54" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="2.54" y1="1.27" x2="4.318" y2="1.27" width="0.1524" layer="51"/>
<wire x1="2.54" y1="-1.27" x2="4.318" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="-3.175" y1="5.461" x2="-2.286" y2="3.937" width="0.1524" layer="51"/>
<wire x1="0" y1="6.35" x2="0" y2="4.572" width="0.1524" layer="51"/>
<wire x1="6.35" y1="6.35" x2="0.889" y2="6.35" width="0.1524" layer="21"/>
<wire x1="0.889" y1="6.35" x2="-0.889" y2="6.35" width="0.1524" layer="51"/>
<wire x1="-0.889" y1="6.35" x2="-6.35" y2="6.35" width="0.1524" layer="21"/>
<wire x1="6.35" y1="-6.35" x2="0.889" y2="-6.35" width="0.1524" layer="21"/>
<wire x1="0.889" y1="-6.35" x2="0" y2="-6.35" width="0.1524" layer="51"/>
<wire x1="-0.889" y1="-6.35" x2="-6.35" y2="-6.35" width="0.1524" layer="21"/>
<wire x1="0" y1="-6.35" x2="0" y2="-4.572" width="0.1524" layer="51"/>
<wire x1="0" y1="-6.35" x2="-0.889" y2="-6.35" width="0.1524" layer="51"/>
<wire x1="3.175" y1="-5.461" x2="2.286" y2="-3.937" width="0.1524" layer="51"/>
<circle x="0" y="0" radius="6.35" width="0.1524" layer="51"/>
<circle x="0" y="0" radius="4.572" width="0.1524" layer="51"/>
<pad name="1" x="0" y="5.08" drill="1.3208" diameter="2.54" shape="octagon"/>
<pad name="2" x="0" y="-5.08" drill="1.3208" diameter="2.54" shape="octagon"/>
<text x="-6.35" y="6.985" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-6.35" y="-8.89" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<hole x="5.08" y="5.08" drill="2.0066"/>
<hole x="5.08" y="-5.08" drill="2.0066"/>
<hole x="-5.08" y="-5.08" drill="2.0066"/>
<hole x="-5.08" y="5.08" drill="2.0066"/>
</package>
<package name="F457" urn="urn:adsk.eagle:footprint:14035/1" library_version="2">
<description>&lt;b&gt;FUSE HOLDER&lt;/b&gt;&lt;p&gt;
CS Schukat</description>
<wire x1="7.366" y1="6.223" x2="7.366" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="-27.686" y1="-6.223" x2="-19.685" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="-27.686" y1="-6.223" x2="-27.686" y2="6.223" width="0.1524" layer="21"/>
<wire x1="7.366" y1="6.223" x2="4.318" y2="6.223" width="0.1524" layer="21"/>
<wire x1="4.318" y1="6.223" x2="4.318" y2="3.175" width="0.1524" layer="21"/>
<wire x1="4.318" y1="6.223" x2="-16.637" y2="6.223" width="0.1524" layer="21"/>
<wire x1="4.318" y1="-6.223" x2="7.366" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="4.318" y1="3.175" x2="-16.637" y2="3.175" width="0.1524" layer="21"/>
<wire x1="4.318" y1="1.27" x2="4.318" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="4.318" y1="-3.175" x2="-16.637" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="4.318" y1="-3.175" x2="4.318" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="-16.637" y1="6.223" x2="-16.637" y2="3.175" width="0.1524" layer="21"/>
<wire x1="-16.637" y1="6.223" x2="-19.685" y2="6.223" width="0.1524" layer="21"/>
<wire x1="-19.685" y1="6.223" x2="-19.685" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="-19.685" y1="6.223" x2="-27.686" y2="6.223" width="0.1524" layer="21"/>
<wire x1="-19.685" y1="-6.223" x2="-16.637" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="-16.637" y1="-6.223" x2="4.318" y2="-6.223" width="0.1524" layer="21"/>
<wire x1="-21.717" y1="4.064" x2="-21.717" y2="-4.064" width="0.1524" layer="21"/>
<wire x1="-25.654" y1="-4.064" x2="-21.717" y2="-4.064" width="0.1524" layer="21"/>
<wire x1="-21.717" y1="4.064" x2="-25.654" y2="4.064" width="0.1524" layer="21"/>
<wire x1="-25.654" y1="-4.064" x2="-25.654" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="-25.654" y1="-0.127" x2="-25.654" y2="0.127" width="0.1524" layer="21"/>
<wire x1="-25.654" y1="-0.127" x2="-25.4" y2="-0.127" width="0.1524" layer="21"/>
<wire x1="-25.4" y1="0.127" x2="-25.4" y2="-0.127" width="0.1524" layer="21"/>
<wire x1="-25.4" y1="0.127" x2="-25.654" y2="0.127" width="0.1524" layer="21"/>
<wire x1="-25.654" y1="0.127" x2="-25.654" y2="4.064" width="0.1524" layer="21"/>
<wire x1="-25.654" y1="-3.683" x2="-22.86" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="-25.654" y1="-3.683" x2="-25.654" y2="-0.381" width="0.1524" layer="21"/>
<wire x1="-22.86" y1="-0.381" x2="-22.86" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="-22.86" y1="-0.381" x2="-25.654" y2="-0.381" width="0.1524" layer="21"/>
<wire x1="-25.654" y1="-0.381" x2="-25.654" y2="-0.127" width="0.1524" layer="21"/>
<wire x1="4.318" y1="3.175" x2="4.318" y2="1.27" width="0.1524" layer="21"/>
<wire x1="4.318" y1="-1.27" x2="4.318" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="-16.637" y1="3.175" x2="-16.637" y2="-6.223" width="0.1524" layer="21"/>
<pad name="2" x="5.08" y="0" drill="1.3208" diameter="2.54" shape="long" rot="R90"/>
<pad name="1" x="-5.08" y="0" drill="1.3208" diameter="2.54" shape="long" rot="R90"/>
<text x="-15.875" y="1.143" size="1.27" layer="51" ratio="10">F457 10A/250V</text>
<text x="-15.875" y="-2.54" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-27.686" y="-8.636" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<rectangle x1="-25.654" y1="-3.683" x2="-22.86" y2="-0.381" layer="21"/>
<rectangle x1="-16.637" y1="3.175" x2="4.318" y2="6.223" layer="21"/>
<rectangle x1="-16.637" y1="-6.223" x2="4.318" y2="-3.175" layer="21"/>
</package>
<package name="FUSE_HOLDER_5X20MM" urn="urn:adsk.eagle:footprint:14052/1" library_version="2">
<description>&lt;b&gt;Fuse Holder&lt;/b&gt; 5x20 mm&lt;p&gt;
Source: User LBR Version 2.05</description>
<wire x1="-2.54" y1="2.54" x2="-2.54" y2="-2.54" width="0.3048" layer="21"/>
<wire x1="1.016" y1="-3.556" x2="-2.032" y2="-3.556" width="0.3048" layer="21"/>
<wire x1="-2.032" y1="-3.556" x2="-2.032" y2="-2.54" width="0.3048" layer="21"/>
<wire x1="-2.032" y1="3.556" x2="1.016" y2="3.556" width="0.3048" layer="21"/>
<wire x1="-2.286" y1="-3.048" x2="-3.048" y2="-3.048" width="0.3048" layer="21"/>
<wire x1="-3.048" y1="-1.778" x2="-3.048" y2="-3.048" width="0.3048" layer="21"/>
<wire x1="13.716" y1="2.54" x2="13.716" y2="-2.54" width="0.3048" layer="21"/>
<wire x1="1.524" y1="2.54" x2="1.524" y2="-2.54" width="0.3048" layer="21"/>
<wire x1="1.524" y1="2.54" x2="13.716" y2="2.54" width="0.3048" layer="21"/>
<wire x1="1.524" y1="-2.54" x2="13.716" y2="-2.54" width="0.3048" layer="21"/>
<wire x1="-2.032" y1="-2.286" x2="1.016" y2="-2.286" width="0.3048" layer="21"/>
<wire x1="-2.032" y1="2.286" x2="1.016" y2="2.286" width="0.3048" layer="21"/>
<wire x1="1.524" y1="2.54" x2="1.016" y2="2.54" width="0.3048" layer="21"/>
<wire x1="1.016" y1="2.54" x2="1.016" y2="3.556" width="0.3048" layer="21"/>
<wire x1="1.016" y1="2.54" x2="1.016" y2="2.286" width="0.3048" layer="21"/>
<wire x1="-2.032" y1="2.286" x2="-2.032" y2="2.54" width="0.3048" layer="21"/>
<wire x1="-2.032" y1="2.54" x2="-2.032" y2="3.556" width="0.3048" layer="21"/>
<wire x1="-2.032" y1="2.54" x2="-2.54" y2="2.54" width="0.3048" layer="21"/>
<wire x1="-2.032" y1="-2.54" x2="-2.032" y2="-2.286" width="0.3048" layer="21"/>
<wire x1="-2.032" y1="-2.54" x2="-2.54" y2="-2.54" width="0.3048" layer="21"/>
<wire x1="1.524" y1="-2.54" x2="1.016" y2="-2.54" width="0.3048" layer="21"/>
<wire x1="1.016" y1="-2.54" x2="1.016" y2="-2.286" width="0.3048" layer="21"/>
<wire x1="1.016" y1="-2.54" x2="1.016" y2="-3.556" width="0.3048" layer="21"/>
<wire x1="17.78" y1="-2.54" x2="17.78" y2="2.54" width="0.3048" layer="21"/>
<wire x1="14.224" y1="3.556" x2="17.272" y2="3.556" width="0.3048" layer="21"/>
<wire x1="17.272" y1="3.556" x2="17.272" y2="2.54" width="0.3048" layer="21"/>
<wire x1="17.272" y1="-3.556" x2="14.224" y2="-3.556" width="0.3048" layer="21"/>
<wire x1="17.526" y1="3.048" x2="18.288" y2="3.048" width="0.3048" layer="21"/>
<wire x1="18.288" y1="1.778" x2="18.288" y2="3.048" width="0.3048" layer="21"/>
<wire x1="17.272" y1="2.286" x2="14.224" y2="2.286" width="0.3048" layer="21"/>
<wire x1="17.272" y1="-2.286" x2="14.224" y2="-2.286" width="0.3048" layer="21"/>
<wire x1="13.716" y1="-2.54" x2="14.224" y2="-2.54" width="0.3048" layer="21"/>
<wire x1="14.224" y1="-2.54" x2="14.224" y2="-3.556" width="0.3048" layer="21"/>
<wire x1="14.224" y1="-2.54" x2="14.224" y2="-2.286" width="0.3048" layer="21"/>
<wire x1="17.272" y1="-2.286" x2="17.272" y2="-2.54" width="0.3048" layer="21"/>
<wire x1="17.272" y1="-2.54" x2="17.272" y2="-3.556" width="0.3048" layer="21"/>
<wire x1="17.272" y1="-2.54" x2="17.78" y2="-2.54" width="0.3048" layer="21"/>
<wire x1="17.272" y1="2.54" x2="17.272" y2="2.286" width="0.3048" layer="21"/>
<wire x1="17.272" y1="2.54" x2="17.78" y2="2.54" width="0.3048" layer="21"/>
<wire x1="13.716" y1="2.54" x2="14.224" y2="2.54" width="0.3048" layer="21"/>
<wire x1="14.224" y1="2.54" x2="14.224" y2="2.286" width="0.3048" layer="21"/>
<wire x1="14.224" y1="2.54" x2="14.224" y2="3.556" width="0.3048" layer="21"/>
<pad name="1" x="0" y="0" drill="1.4224" diameter="2.286" shape="square"/>
<pad name="2" x="15.24" y="0" drill="1.4224" diameter="2.286" shape="square"/>
<text x="2.032" y="3.81" size="2.54" layer="25">&gt;NAME</text>
<text x="1.778" y="-5.842" size="2.54" layer="27">&gt;VALUE</text>
</package>
<package name="FUSE_HOLDER_MENTOR-1821" urn="urn:adsk.eagle:footprint:14050/1" library_version="2">
<description>&lt;b&gt;Fuse Holder&lt;/b&gt; 5x20 mm Manufacturer: MENTOR Type: 1821&lt;p&gt;
Distributor: Bürklin 46 G 6111&lt;br&gt;
Source: User LBR Version 2.05</description>
<wire x1="10.795" y1="5.08" x2="-5.08" y2="5.08" width="0.3048" layer="21"/>
<wire x1="-22.225" y1="4.445" x2="-22.225" y2="-4.445" width="0.3048" layer="21"/>
<wire x1="10.795" y1="-5.08" x2="-5.08" y2="-5.08" width="0.3048" layer="21"/>
<wire x1="10.795" y1="-5.08" x2="10.795" y2="5.08" width="0.3048" layer="21"/>
<wire x1="-5.08" y1="5.08" x2="-5.08" y2="-5.08" width="0.3048" layer="21"/>
<wire x1="-5.08" y1="5.08" x2="-12.065" y2="5.08" width="0.3048" layer="21"/>
<wire x1="-5.08" y1="-5.08" x2="-12.065" y2="-5.08" width="0.3048" layer="21"/>
<wire x1="-12.065" y1="5.08" x2="-12.065" y2="3.81" width="0.3048" layer="21"/>
<wire x1="-18.415" y1="3.81" x2="-12.065" y2="3.81" width="0.3048" layer="21"/>
<wire x1="-18.415" y1="3.81" x2="-18.415" y2="4.445" width="0.3048" layer="21"/>
<wire x1="-18.415" y1="4.445" x2="-22.225" y2="4.445" width="0.3048" layer="21"/>
<wire x1="-22.225" y1="-4.445" x2="-18.415" y2="-4.445" width="0.3048" layer="21"/>
<wire x1="-18.415" y1="-3.81" x2="-18.415" y2="-4.445" width="0.3048" layer="21"/>
<wire x1="-12.065" y1="-3.81" x2="-12.065" y2="-5.08" width="0.3048" layer="21"/>
<wire x1="-12.065" y1="-3.81" x2="-18.415" y2="-3.81" width="0.3048" layer="21"/>
<wire x1="-12.065" y1="3.81" x2="-12.065" y2="-3.81" width="0.3048" layer="21"/>
<wire x1="-18.415" y1="3.81" x2="-18.415" y2="-3.81" width="0.3048" layer="21"/>
<pad name="B" x="0" y="0" drill="1.2192" diameter="1.905" shape="square"/>
<pad name="A" x="10.16" y="0" drill="1.2192" diameter="1.905" shape="square"/>
<text x="-11.43" y="-8.255" size="1.778" layer="25">&gt;NAME</text>
<text x="-3.81" y="-3.81" size="1.778" layer="27">&gt;VALUE</text>
</package>
<package name="FUSE_HOLDER_SCHURTER-FAS" urn="urn:adsk.eagle:footprint:14053/1" library_version="2">
<description>&lt;b&gt;Fuse holder&lt;/b&gt; 5x20 mm Manufacturer: SCHURTER Type: FAS&lt;p&gt;
Distributor: Bürklin 46 G 611&lt;br&gt;
Source: User LBR Version 2.05</description>
<wire x1="-5.08" y1="-5.08" x2="-5.08" y2="5.08" width="0.3048" layer="21"/>
<wire x1="-8.89" y1="-6.35" x2="-8.89" y2="-3.81" width="0.3048" layer="21"/>
<wire x1="-17.78" y1="-4.445" x2="-17.78" y2="4.445" width="0.3048" layer="21"/>
<wire x1="-17.78" y1="4.445" x2="-11.43" y2="4.445" width="0.3048" layer="21"/>
<wire x1="-11.43" y1="4.445" x2="-11.43" y2="3.81" width="0.3048" layer="21"/>
<wire x1="-11.43" y1="-4.445" x2="-17.78" y2="-4.445" width="0.3048" layer="21"/>
<wire x1="13.335" y1="5.08" x2="13.335" y2="-5.08" width="0.3048" layer="21"/>
<wire x1="13.335" y1="5.08" x2="-5.08" y2="5.08" width="0.3048" layer="21"/>
<wire x1="-11.43" y1="3.81" x2="-8.89" y2="3.81" width="0.3048" layer="21"/>
<wire x1="-11.43" y1="3.81" x2="-11.43" y2="-3.81" width="0.3048" layer="21"/>
<wire x1="-8.89" y1="3.81" x2="-8.89" y2="6.35" width="0.3048" layer="21"/>
<wire x1="-11.43" y1="-3.81" x2="-8.89" y2="-3.81" width="0.3048" layer="21"/>
<wire x1="-11.43" y1="-3.81" x2="-11.43" y2="-4.445" width="0.3048" layer="21"/>
<wire x1="-8.89" y1="-3.81" x2="-8.89" y2="3.81" width="0.3048" layer="21"/>
<wire x1="-5.08" y1="-5.08" x2="13.335" y2="-5.08" width="0.3048" layer="21"/>
<wire x1="-5.08" y1="5.08" x2="-5.08" y2="6.35" width="0.3048" layer="21"/>
<wire x1="-5.08" y1="6.35" x2="-8.89" y2="6.35" width="0.3048" layer="21"/>
<wire x1="-5.08" y1="-5.08" x2="-5.08" y2="-6.35" width="0.3048" layer="21"/>
<wire x1="-5.08" y1="-6.35" x2="-8.89" y2="-6.35" width="0.3048" layer="21"/>
<pad name="A" x="0" y="0" drill="1.2192" diameter="1.905" shape="square"/>
<pad name="B" x="12.7" y="0" drill="1.2192" diameter="1.905" shape="square"/>
<text x="-3.81" y="-7.62" size="1.778" layer="25">&gt;NAME</text>
<text x="-3.81" y="-3.81" size="1.778" layer="27">&gt;VALUE</text>
</package>
<package name="FUSE_HOLDER_WICKMANN-19596" urn="urn:adsk.eagle:footprint:14051/1" library_version="2">
<description>&lt;b&gt;Fuse holder&lt;/b&gt; 5x20 mm Manufacturer: WICKMANN Type: 19596&lt;p&gt;
Distributor: Bürklin 46 G 612&lt;br&gt;
Source: User LBR Version 2.05</description>
<wire x1="-5.715" y1="-5.08" x2="-5.715" y2="5.08" width="0.3048" layer="21"/>
<wire x1="-9.525" y1="-5.715" x2="-9.525" y2="-4.445" width="0.3048" layer="21"/>
<wire x1="-17.145" y1="-5.08" x2="-17.145" y2="5.08" width="0.3048" layer="21"/>
<wire x1="-17.145" y1="5.08" x2="-10.795" y2="5.08" width="0.3048" layer="21"/>
<wire x1="-10.795" y1="5.08" x2="-10.795" y2="4.445" width="0.3048" layer="21"/>
<wire x1="-10.795" y1="-5.08" x2="-17.145" y2="-5.08" width="0.3048" layer="21"/>
<wire x1="13.97" y1="4.445" x2="13.97" y2="-4.445" width="0.3048" layer="21"/>
<wire x1="-10.795" y1="4.445" x2="-9.525" y2="4.445" width="0.3048" layer="21"/>
<wire x1="-10.795" y1="4.445" x2="-10.795" y2="-4.445" width="0.3048" layer="21"/>
<wire x1="-9.525" y1="4.445" x2="-9.525" y2="5.715" width="0.3048" layer="21"/>
<wire x1="-10.795" y1="-4.445" x2="-9.525" y2="-4.445" width="0.3048" layer="21"/>
<wire x1="-10.795" y1="-4.445" x2="-10.795" y2="-5.08" width="0.3048" layer="21"/>
<wire x1="-9.525" y1="-4.445" x2="-9.525" y2="4.445" width="0.3048" layer="21"/>
<wire x1="-5.715" y1="5.08" x2="-5.715" y2="5.715" width="0.3048" layer="21"/>
<wire x1="-5.715" y1="5.715" x2="-9.525" y2="5.715" width="0.3048" layer="21"/>
<wire x1="-5.715" y1="-5.08" x2="-5.715" y2="-5.715" width="0.3048" layer="21"/>
<wire x1="-5.715" y1="-5.715" x2="-9.525" y2="-5.715" width="0.3048" layer="21"/>
<wire x1="-5.715" y1="5.08" x2="1.905" y2="5.08" width="0.3048" layer="21"/>
<wire x1="1.905" y1="4.445" x2="1.905" y2="5.08" width="0.3048" layer="21"/>
<wire x1="1.905" y1="4.445" x2="13.97" y2="4.445" width="0.3048" layer="21"/>
<wire x1="-5.715" y1="-5.08" x2="1.905" y2="-5.08" width="0.3048" layer="21"/>
<wire x1="1.905" y1="-4.445" x2="1.905" y2="-5.08" width="0.3048" layer="21"/>
<wire x1="1.905" y1="-4.445" x2="13.97" y2="-4.445" width="0.3048" layer="21"/>
<wire x1="-6.985" y1="3.175" x2="-8.255" y2="0.635" width="0.3048" layer="21"/>
<wire x1="-8.255" y1="0.635" x2="-6.985" y2="0.635" width="0.3048" layer="21"/>
<wire x1="-6.985" y1="0.635" x2="-8.255" y2="-1.905" width="0.3048" layer="21"/>
<wire x1="-8.255" y1="-1.905" x2="-8.255" y2="-1.27" width="0.3048" layer="21"/>
<wire x1="-8.255" y1="-1.905" x2="-7.62" y2="-1.27" width="0.3048" layer="21"/>
<pad name="B" x="0" y="0" drill="1.2192" diameter="1.905" shape="square"/>
<pad name="A" x="12.7" y="0" drill="1.2192" diameter="1.905" shape="square"/>
<pad name="B@1" x="2.54" y="0" drill="1.2192" diameter="1.905" shape="square"/>
<text x="-3.81" y="-7.62" size="1.778" layer="25">&gt;NAME</text>
<text x="-3.81" y="-3.81" size="1.778" layer="27">&gt;VALUE</text>
</package>
<package name="GSH15" urn="urn:adsk.eagle:footprint:14041/1" library_version="2">
<description>&lt;b&gt;FUSE HOLDER&lt;/b&gt;&lt;p&gt;
grid 15mm, 19649 Wickmann</description>
<wire x1="-12.573" y1="-4.572" x2="-12.573" y2="4.572" width="0.1524" layer="21"/>
<wire x1="12.573" y1="4.572" x2="12.573" y2="-4.572" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="2.921" x2="5.08" y2="2.921" width="0.0508" layer="21"/>
<wire x1="-11.43" y1="3.683" x2="-8.382" y2="3.683" width="0.1524" layer="21"/>
<wire x1="-11.43" y1="-3.683" x2="-11.43" y2="3.683" width="0.1524" layer="21"/>
<wire x1="11.43" y1="3.683" x2="11.43" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="-5.207" y1="0" x2="5.207" y2="0" width="0.0508" layer="21"/>
<wire x1="12.573" y1="-4.572" x2="5.08" y2="-4.572" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-3.048" x2="5.08" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-3.048" x2="-5.08" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-4.572" x2="-12.573" y2="-4.572" width="0.1524" layer="21"/>
<wire x1="-12.573" y1="4.572" x2="-5.08" y2="4.572" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="3.048" x2="5.08" y2="3.048" width="0.1524" layer="21"/>
<wire x1="5.08" y1="4.572" x2="5.08" y2="3.683" width="0.1524" layer="21"/>
<wire x1="5.08" y1="4.572" x2="12.573" y2="4.572" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-3.683" x2="6.858" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="6.858" y1="-4.191" x2="6.858" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="6.858" y1="-4.191" x2="8.382" y2="-4.191" width="0.1524" layer="21"/>
<wire x1="8.382" y1="-3.683" x2="8.382" y2="-4.191" width="0.1524" layer="21"/>
<wire x1="8.382" y1="-3.683" x2="11.43" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="5.08" y1="3.683" x2="6.858" y2="3.683" width="0.1524" layer="21"/>
<wire x1="6.858" y1="4.191" x2="6.858" y2="3.683" width="0.1524" layer="21"/>
<wire x1="6.858" y1="4.191" x2="8.382" y2="4.191" width="0.1524" layer="21"/>
<wire x1="8.382" y1="3.683" x2="8.382" y2="4.191" width="0.1524" layer="21"/>
<wire x1="8.382" y1="3.683" x2="11.43" y2="3.683" width="0.1524" layer="21"/>
<wire x1="5.08" y1="3.683" x2="5.08" y2="3.048" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-3.683" x2="5.08" y2="-4.572" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="3.048" x2="-5.08" y2="3.683" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="3.683" x2="-5.08" y2="4.572" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-4.572" x2="-5.08" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-3.683" x2="-5.08" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="-6.858" y1="3.683" x2="-5.08" y2="3.683" width="0.1524" layer="21"/>
<wire x1="-6.858" y1="4.191" x2="-6.858" y2="3.683" width="0.1524" layer="21"/>
<wire x1="-8.382" y1="4.191" x2="-6.858" y2="4.191" width="0.1524" layer="21"/>
<wire x1="-8.382" y1="3.683" x2="-8.382" y2="4.191" width="0.1524" layer="21"/>
<wire x1="-6.858" y1="-3.683" x2="-5.08" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="-6.858" y1="-4.191" x2="-6.858" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="-8.382" y1="-4.191" x2="-6.858" y2="-4.191" width="0.1524" layer="21"/>
<wire x1="-8.382" y1="-3.683" x2="-8.382" y2="-4.191" width="0.1524" layer="21"/>
<wire x1="-8.382" y1="-3.683" x2="-11.43" y2="-3.683" width="0.1524" layer="21"/>
<pad name="1" x="-7.62" y="0" drill="1.3208" diameter="2.54" shape="long" rot="R90"/>
<pad name="2" x="7.62" y="0" drill="1.3208" diameter="2.54" shape="long" rot="R90"/>
<text x="-4.4196" y="3.6068" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.4196" y="-5.461" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-5.08" y1="1.651" x2="5.08" y2="2.159" layer="21"/>
<rectangle x1="-5.08" y1="-2.159" x2="5.08" y2="-1.651" layer="21"/>
<rectangle x1="5.08" y1="-3.175" x2="5.715" y2="-1.524" layer="21"/>
<rectangle x1="5.08" y1="1.524" x2="5.715" y2="3.175" layer="21"/>
<rectangle x1="5.08" y1="-1.524" x2="5.715" y2="1.524" layer="51"/>
<rectangle x1="10.287" y1="-2.032" x2="10.541" y2="2.032" layer="21"/>
<rectangle x1="6.731" y1="1.905" x2="8.509" y2="2.032" layer="51"/>
<rectangle x1="6.731" y1="-2.032" x2="8.509" y2="-1.905" layer="51"/>
<rectangle x1="5.715" y1="2.032" x2="10.541" y2="3.175" layer="21"/>
<rectangle x1="5.715" y1="-3.175" x2="10.541" y2="-2.032" layer="21"/>
<rectangle x1="7.112" y1="-3.937" x2="8.128" y2="-3.175" layer="21"/>
<rectangle x1="7.112" y1="3.175" x2="8.128" y2="3.937" layer="21"/>
<rectangle x1="-5.715" y1="-1.524" x2="-5.08" y2="1.524" layer="51"/>
<rectangle x1="-5.715" y1="1.524" x2="-5.08" y2="3.175" layer="21"/>
<rectangle x1="-5.715" y1="-3.175" x2="-5.08" y2="-1.524" layer="21"/>
<rectangle x1="-10.541" y1="-3.175" x2="-5.715" y2="-2.032" layer="21"/>
<rectangle x1="-8.509" y1="-2.032" x2="-6.731" y2="-1.905" layer="51"/>
<rectangle x1="-10.541" y1="-2.032" x2="-10.287" y2="2.032" layer="21"/>
<rectangle x1="-8.509" y1="1.905" x2="-6.731" y2="2.032" layer="51"/>
<rectangle x1="-10.541" y1="2.032" x2="-5.715" y2="3.175" layer="21"/>
<rectangle x1="-8.128" y1="3.175" x2="-7.112" y2="3.937" layer="21"/>
<rectangle x1="-8.128" y1="-3.937" x2="-7.112" y2="-3.175" layer="21"/>
<rectangle x1="5.715" y1="-2.032" x2="6.731" y2="-1.905" layer="21"/>
<rectangle x1="5.715" y1="1.905" x2="6.731" y2="2.032" layer="21"/>
<rectangle x1="8.509" y1="1.905" x2="10.287" y2="2.032" layer="21"/>
<rectangle x1="8.509" y1="-2.032" x2="10.287" y2="-1.905" layer="21"/>
<rectangle x1="-10.287" y1="1.905" x2="-8.509" y2="2.032" layer="21"/>
<rectangle x1="-6.731" y1="1.905" x2="-5.715" y2="2.032" layer="21"/>
<rectangle x1="-6.731" y1="-2.032" x2="-5.715" y2="-1.905" layer="21"/>
<rectangle x1="-10.287" y1="-2.032" x2="-8.509" y2="-1.905" layer="21"/>
<hole x="0" y="0" drill="2.794"/>
</package>
<package name="KS10H" urn="urn:adsk.eagle:footprint:14031/1" library_version="2">
<description>&lt;b&gt;FUSE HOLDER&lt;/b&gt;&lt;p&gt;
CS Schukat</description>
<wire x1="-5.08" y1="-7.62" x2="-5.08" y2="17.78" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="17.78" x2="-4.445" y2="17.78" width="0.1524" layer="21"/>
<wire x1="5.08" y1="17.78" x2="5.08" y2="-7.62" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-7.62" x2="2.032" y2="-7.62" width="0.1524" layer="21"/>
<wire x1="-2.032" y1="-7.62" x2="-5.08" y2="-7.62" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="17.78" x2="-4.445" y2="19.177" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="17.78" x2="4.445" y2="17.78" width="0.1524" layer="21"/>
<wire x1="4.445" y1="17.78" x2="4.445" y2="19.177" width="0.1524" layer="21"/>
<wire x1="4.445" y1="17.78" x2="5.08" y2="17.78" width="0.1524" layer="21"/>
<wire x1="-4.826" y1="19.177" x2="4.826" y2="19.177" width="0.1524" layer="21"/>
<wire x1="4.826" y1="19.177" x2="4.826" y2="19.812" width="0.1524" layer="21"/>
<wire x1="4.826" y1="19.812" x2="-4.826" y2="19.812" width="0.1524" layer="21"/>
<wire x1="-4.826" y1="19.812" x2="-4.826" y2="19.177" width="0.1524" layer="21"/>
<wire x1="-4.826" y1="19.812" x2="-4.699" y2="24.892" width="0.1524" layer="21"/>
<wire x1="4.572" y1="24.892" x2="4.826" y2="19.812" width="0.1524" layer="21"/>
<wire x1="-4.191" y1="25.4" x2="-0.635" y2="25.4" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="25.4" x2="-0.635" y2="24.765" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="24.765" x2="0.635" y2="24.765" width="0.1524" layer="21"/>
<wire x1="0.635" y1="24.765" x2="0.635" y2="25.4" width="0.1524" layer="21"/>
<wire x1="0.635" y1="25.4" x2="4.064" y2="25.4" width="0.1524" layer="21"/>
<wire x1="2.032" y1="-7.62" x2="2.032" y2="-6.096" width="0.1524" layer="21"/>
<wire x1="-2.032" y1="-7.62" x2="-2.032" y2="-6.096" width="0.1524" layer="21"/>
<wire x1="-2.032" y1="-6.096" x2="-2.032" y2="-5.08" width="0.1524" layer="51"/>
<wire x1="-2.032" y1="-5.08" x2="2.032" y2="-5.08" width="0.1524" layer="51"/>
<wire x1="2.032" y1="-5.08" x2="2.032" y2="-6.096" width="0.1524" layer="51"/>
<wire x1="-1.397" y1="-5.207" x2="1.397" y2="-5.207" width="0.1524" layer="51"/>
<wire x1="4.064" y1="25.4" x2="4.572" y2="24.892" width="0.1524" layer="21" curve="-90"/>
<wire x1="-4.699" y1="24.892" x2="-4.191" y2="25.4" width="0.1524" layer="21" curve="-90"/>
<pad name="1" x="0" y="-5.08" drill="1.3208" diameter="2.54" shape="long"/>
<pad name="2" x="0" y="7.62" drill="1.3208" diameter="2.54" shape="long"/>
<text x="7.239" y="-7.62" size="1.778" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="7.239" y="0.635" size="1.778" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<rectangle x1="2.032" y1="-7.62" x2="3.302" y2="17.78" layer="21"/>
<rectangle x1="-3.302" y1="-7.62" x2="-2.032" y2="17.78" layer="21"/>
<rectangle x1="-4.445" y1="17.78" x2="4.445" y2="19.177" layer="21"/>
</package>
<package name="KS16" urn="urn:adsk.eagle:footprint:14032/1" library_version="2">
<description>&lt;b&gt;FUSE HOLDER&lt;/b&gt;&lt;p&gt;
CS Schukat</description>
<wire x1="-5.08" y1="-19.05" x2="-5.08" y2="16.51" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="16.51" x2="-4.445" y2="16.51" width="0.1524" layer="21"/>
<wire x1="5.08" y1="16.51" x2="5.08" y2="-19.05" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="16.51" x2="-4.445" y2="17.145" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="16.51" x2="4.445" y2="16.51" width="0.1524" layer="21"/>
<wire x1="4.445" y1="16.51" x2="4.445" y2="17.145" width="0.1524" layer="21"/>
<wire x1="4.445" y1="16.51" x2="5.08" y2="16.51" width="0.1524" layer="21"/>
<wire x1="-4.445" y1="17.145" x2="-0.6096" y2="17.145" width="0.1524" layer="21"/>
<wire x1="-0.6096" y1="17.145" x2="-0.6096" y2="16.8402" width="0.1524" layer="21"/>
<wire x1="-0.6096" y1="16.8402" x2="0.635" y2="16.8402" width="0.1524" layer="21"/>
<wire x1="0.635" y1="16.8402" x2="0.635" y2="17.145" width="0.1524" layer="21"/>
<wire x1="4.445" y1="17.145" x2="0.635" y2="17.145" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-19.05" x2="1.651" y2="-19.05" width="0.1524" layer="21"/>
<wire x1="1.651" y1="-19.05" x2="-1.651" y2="-19.05" width="0.1524" layer="51"/>
<wire x1="-1.651" y1="-19.05" x2="-5.08" y2="-19.05" width="0.1524" layer="21"/>
<pad name="1" x="0" y="-17.78" drill="1.4986" diameter="2.54" shape="long"/>
<pad name="2" x="0" y="-8.255" drill="1.4986" diameter="2.54" shape="long"/>
<text x="7.366" y="-19.05" size="1.778" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="0.889" y="-2.54" size="1.778" layer="27" ratio="10" rot="R90">&gt;VALUE</text>
<rectangle x1="-4.445" y1="16.51" x2="-0.635" y2="17.145" layer="21"/>
<rectangle x1="-0.635" y1="16.51" x2="0.635" y2="16.8402" layer="21"/>
<rectangle x1="0.635" y1="16.51" x2="4.445" y2="17.145" layer="21"/>
<rectangle x1="3.175" y1="-19.05" x2="4.1402" y2="16.51" layer="21"/>
<rectangle x1="-4.1402" y1="-19.05" x2="-3.175" y2="16.51" layer="21"/>
</package>
<package name="KS17" urn="urn:adsk.eagle:footprint:14033/1" library_version="2">
<description>&lt;b&gt;FUSE HOLDER&lt;/b&gt;&lt;p&gt;
CS Schukat</description>
<wire x1="-3.81" y1="-6.35" x2="-3.81" y2="-6.985" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-6.35" x2="3.81" y2="-6.985" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="6.985" x2="3.81" y2="6.985" width="0.1524" layer="21"/>
<wire x1="3.81" y1="6.985" x2="3.81" y2="6.35" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="6.985" x2="-3.81" y2="6.35" width="0.1524" layer="21"/>
<wire x1="3.81" y1="6.35" x2="3.81" y2="-6.35" width="0.1524" layer="21" curve="-118.072487"/>
<wire x1="-3.81" y1="-6.35" x2="-3.81" y2="6.35" width="0.1524" layer="21" curve="-118.072487"/>
<wire x1="-3.175" y1="0.381" x2="-3.175" y2="-0.381" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="-0.381" x2="3.175" y2="-0.381" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-0.381" x2="3.175" y2="0.381" width="0.1524" layer="21"/>
<wire x1="3.175" y1="0.381" x2="-3.175" y2="0.381" width="0.1524" layer="21"/>
<wire x1="2.2223" y1="-4.5681" x2="5.08" y2="0" width="0.3048" layer="21" curve="64.057726"/>
<wire x1="2.2718" y1="4.5437" x2="5.08" y2="0" width="0.3048" layer="21" curve="-63.435374"/>
<wire x1="-2.2718" y1="4.5437" x2="0" y2="5.08" width="0.3048" layer="51" curve="-26.564517"/>
<wire x1="0" y1="5.08" x2="2.2718" y2="4.5437" width="0.3048" layer="51" curve="-26.564517"/>
<wire x1="-5.08" y1="0" x2="-2.2718" y2="-4.5437" width="0.3048" layer="21" curve="63.435374"/>
<wire x1="-5.08" y1="0" x2="-2.2223" y2="4.5681" width="0.3048" layer="21" curve="-64.057726"/>
<wire x1="0" y1="-5.08" x2="2.2718" y2="-4.5437" width="0.3048" layer="51" curve="26.564517"/>
<wire x1="-2.2718" y1="-4.5437" x2="0" y2="-5.08" width="0.3048" layer="51" curve="26.564517"/>
<wire x1="3.81" y1="-6.985" x2="1.016" y2="-6.985" width="0.1524" layer="21"/>
<wire x1="1.016" y1="-6.985" x2="-1.016" y2="-6.985" width="0.1524" layer="51"/>
<wire x1="-1.016" y1="-6.985" x2="-3.81" y2="-6.985" width="0.1524" layer="21"/>
<pad name="1" x="0" y="-5.08" drill="1.4986" diameter="2.54" shape="long"/>
<pad name="2" x="0" y="4.445" drill="1.4986" diameter="2.54" shape="long"/>
<text x="-3.81" y="7.62" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.302" y="-2.667" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="KS9V" urn="urn:adsk.eagle:footprint:14049/1" library_version="2">
<description>&lt;b&gt;FUSE HOLDER&lt;/b&gt;&lt;p&gt;
CS Schukat</description>
<wire x1="-1.8331" y1="-4.3286" x2="1.8331" y2="-4.3286" width="0.1524" layer="51" curve="45.903921"/>
<wire x1="-1.6181" y1="-4.8154" x2="1.6181" y2="-4.8154" width="0.1524" layer="51" curve="37.147383"/>
<wire x1="-1.42" y1="-5.08" x2="1.42" y2="-5.08" width="0.1524" layer="51"/>
<wire x1="-1.2381" y1="-2.3622" x2="1.2381" y2="-2.3622" width="0.1524" layer="51" curve="55.320768"/>
<wire x1="-1.2381" y1="2.3622" x2="1.2381" y2="2.3622" width="0.1524" layer="51" curve="-55.320768"/>
<wire x1="-1.3394" y1="5.1647" x2="1.3394" y2="5.1647" width="0.1524" layer="51" curve="-29.077303"/>
<wire x1="-2.556" y1="0.762" x2="2.556" y2="0.762" width="0.1524" layer="21"/>
<wire x1="-2.556" y1="-0.762" x2="2.556" y2="-0.762" width="0.1524" layer="21"/>
<wire x1="-1.6181" y1="4.8154" x2="1.6181" y2="4.8154" width="0.1524" layer="51" curve="-37.147383"/>
<wire x1="-1.8331" y1="4.3286" x2="1.8331" y2="4.3286" width="0.1524" layer="51" curve="-45.903921"/>
<wire x1="-3.683" y1="-3.861" x2="-1.3394" y2="5.1642" width="0.1524" layer="21" curve="-121.809325"/>
<wire x1="-1.6181" y1="4.8154" x2="-1.6181" y2="-4.8154" width="0.1524" layer="21" curve="142.852617"/>
<wire x1="-1.8331" y1="4.3286" x2="-1.8331" y2="-4.3286" width="0.1524" layer="21" curve="134.096079"/>
<wire x1="-1.2381" y1="2.3622" x2="-1.2381" y2="-2.3622" width="0.1524" layer="21" curve="124.679232"/>
<wire x1="-3.683" y1="-4.826" x2="-3.683" y2="-3.861" width="0.1524" layer="21"/>
<wire x1="-3.429" y1="-5.08" x2="-1.42" y2="-5.08" width="0.1524" layer="21"/>
<wire x1="-3.683" y1="-4.826" x2="-3.429" y2="-5.08" width="0.1524" layer="21" curve="90"/>
<wire x1="1.3394" y1="5.1642" x2="3.683" y2="-3.861" width="0.1524" layer="21" curve="-121.809325"/>
<wire x1="1.2381" y1="-2.3622" x2="1.2381" y2="2.3622" width="0.1524" layer="21" curve="124.679232"/>
<wire x1="1.8331" y1="-4.3286" x2="1.8331" y2="4.3286" width="0.1524" layer="21" curve="134.096079"/>
<wire x1="1.6181" y1="-4.8154" x2="1.6181" y2="4.8154" width="0.1524" layer="21" curve="142.852617"/>
<wire x1="3.683" y1="-4.826" x2="3.683" y2="-3.861" width="0.1524" layer="21"/>
<wire x1="3.429" y1="-5.08" x2="3.683" y2="-4.826" width="0.1524" layer="21" curve="90"/>
<wire x1="1.42" y1="-5.08" x2="3.429" y2="-5.08" width="0.1524" layer="21"/>
<pad name="1" x="0" y="3.81" drill="1.3208" diameter="2.54" shape="long"/>
<pad name="2" x="0" y="-3.81" drill="1.3208" diameter="2.54" shape="long"/>
<text x="-2.54" y="5.588" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.429" y="-6.858" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="LITTLEFUSE" urn="urn:adsk.eagle:footprint:14040/1" library_version="2">
<description>&lt;B&gt;LITTLEFUSE&lt;/B&gt;&lt;p&gt;
Picofuse/slow Littelfuse</description>
<wire x1="5.08" y1="0" x2="3.937" y2="0" width="0.6096" layer="51"/>
<wire x1="-5.08" y1="0" x2="-3.937" y2="0" width="0.6096" layer="51"/>
<wire x1="2.667" y1="1.778" x2="-2.667" y2="1.778" width="0.1524" layer="21"/>
<wire x1="2.667" y1="-1.778" x2="-2.667" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="-0.762" y1="0.254" x2="-0.762" y2="-0.254" width="0.0508" layer="21"/>
<wire x1="-2.667" y1="1.016" x2="-2.667" y2="-1.016" width="0.0508" layer="21"/>
<wire x1="2.667" y1="1.016" x2="2.667" y2="-1.016" width="0.0508" layer="21"/>
<wire x1="0.762" y1="0.254" x2="0.762" y2="-0.254" width="0.0508" layer="21"/>
<wire x1="3.556" y1="0.508" x2="3.556" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="2.667" y1="-1.778" x2="3.556" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="2.667" y1="1.778" x2="3.556" y2="0.508" width="0.1524" layer="21"/>
<wire x1="-2.667" y1="1.778" x2="-3.556" y2="0.508" width="0.1524" layer="21"/>
<wire x1="-3.556" y1="0.508" x2="-3.556" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="-3.556" y1="-0.508" x2="-2.667" y2="-1.778" width="0.1524" layer="21"/>
<wire x1="-1.524" y1="0" x2="1.524" y2="0" width="0.0508" layer="21"/>
<wire x1="-0.762" y1="0.254" x2="0.762" y2="0.254" width="0.0508" layer="21"/>
<wire x1="-0.762" y1="-0.254" x2="0.762" y2="-0.254" width="0.0508" layer="21"/>
<pad name="1" x="-5.08" y="0" drill="0.8128" diameter="1.778" shape="long" rot="R90"/>
<pad name="2" x="5.08" y="0" drill="0.8128" diameter="1.778" shape="long" rot="R90"/>
<text x="-2.54" y="2.159" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.667" y="-3.4798" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="3.556" y1="-0.3048" x2="3.9116" y2="0.3048" layer="21"/>
<rectangle x1="-3.9116" y1="-0.3048" x2="-3.556" y2="0.3048" layer="21"/>
</package>
<package name="PICOFUSE" urn="urn:adsk.eagle:footprint:14036/1" library_version="2">
<description>&lt;B&gt;PICOFUSE&lt;/B&gt;&lt;p&gt;
Picofuse, 19275 Wickmann</description>
<wire x1="5.08" y1="0" x2="4.064" y2="0" width="0.1524" layer="51"/>
<wire x1="-5.08" y1="0" x2="-4.064" y2="0" width="0.6096" layer="51"/>
<wire x1="-2.794" y1="1.27" x2="-1.524" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="1.016" x2="-1.524" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-2.794" y1="-1.27" x2="-1.524" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-1.016" x2="-1.524" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.27" y1="1.016" x2="1.524" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.27" y1="1.016" x2="-1.27" y2="1.016" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-1.016" x2="1.524" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-1.016" x2="-1.27" y2="-1.016" width="0.1524" layer="21"/>
<wire x1="2.794" y1="1.27" x2="1.524" y2="1.27" width="0.1524" layer="21"/>
<wire x1="2.794" y1="-1.27" x2="1.524" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.524" y1="1.016" x2="-1.524" y2="-1.016" width="0.0508" layer="21"/>
<wire x1="-2.794" y1="1.016" x2="-2.794" y2="-1.016" width="0.0508" layer="21"/>
<wire x1="2.794" y1="1.016" x2="2.794" y2="-1.016" width="0.0508" layer="21"/>
<wire x1="1.524" y1="1.016" x2="1.524" y2="-1.016" width="0.0508" layer="21"/>
<wire x1="3.81" y1="0.508" x2="3.81" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-0.508" x2="3.556" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="2.794" y1="-1.27" x2="3.556" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="3.81" y1="0.508" x2="3.556" y2="0.508" width="0.1524" layer="21"/>
<wire x1="2.794" y1="1.27" x2="3.556" y2="0.508" width="0.1524" layer="21"/>
<wire x1="-2.794" y1="1.27" x2="-3.556" y2="0.508" width="0.1524" layer="21"/>
<wire x1="-3.556" y1="0.508" x2="-3.81" y2="0.508" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="0.508" x2="-3.81" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-0.508" x2="-3.556" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="-3.556" y1="-0.508" x2="-2.794" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="0" x2="1.27" y2="0" width="0.0508" layer="21"/>
<pad name="1" x="-5.08" y="0" drill="0.8128" shape="long" rot="R90"/>
<pad name="2" x="5.08" y="0" drill="0.8128" shape="long" rot="R90"/>
<text x="-2.54" y="1.524" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="-2.8448" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="3.81" y1="-0.3048" x2="4.1656" y2="0.3048" layer="21"/>
<rectangle x1="-4.1656" y1="-0.3048" x2="-3.81" y2="0.3048" layer="21"/>
</package>
<package name="SH22" urn="urn:adsk.eagle:footprint:14037/1" library_version="2">
<description>&lt;b&gt;FUSE HOLDER&lt;/b&gt;&lt;p&gt;
CS PFP30, Schukat</description>
<wire x1="-13.208" y1="-4.826" x2="13.208" y2="-4.826" width="0.1524" layer="21"/>
<wire x1="13.208" y1="4.826" x2="13.208" y2="-4.826" width="0.1524" layer="21"/>
<wire x1="13.208" y1="4.826" x2="-13.208" y2="4.826" width="0.1524" layer="21"/>
<wire x1="-13.208" y1="-4.826" x2="-13.208" y2="4.826" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-2.54" x2="5.08" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="5.08" y1="2.54" x2="5.08" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="5.08" y1="2.54" x2="-5.08" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-2.54" x2="-5.08" y2="2.54" width="0.1524" layer="21"/>
<pad name="1" x="-10.9982" y="0" drill="1.3208" diameter="2.54" shape="long" rot="R90"/>
<pad name="2" x="10.9982" y="0" drill="1.3208" diameter="2.54" shape="long" rot="R90"/>
<text x="-13.208" y="-6.985" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-5.08" y="-6.985" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-13.208" y1="3.937" x2="13.208" y2="4.826" layer="21"/>
<rectangle x1="-13.208" y1="-4.826" x2="13.208" y2="-3.937" layer="21"/>
</package>
<package name="SH22,5" urn="urn:adsk.eagle:footprint:14030/1" library_version="2">
<description>&lt;b&gt;FUSE HOLDER&lt;/b&gt;&lt;p&gt; grid 22,5 mm, OGN0031 8201 Schurter (Buerklin)</description>
<wire x1="-12.573" y1="-3.937" x2="12.573" y2="-3.937" width="0.1524" layer="21"/>
<wire x1="12.573" y1="3.937" x2="-12.573" y2="3.937" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-2.921" x2="5.08" y2="-2.921" width="0.0508" layer="21"/>
<wire x1="-5.08" y1="2.921" x2="5.08" y2="2.921" width="0.0508" layer="21"/>
<wire x1="-10.795" y1="3.683" x2="-5.715" y2="3.683" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="-3.683" x2="-10.795" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="-2.54" x2="-5.715" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="3.683" x2="-10.795" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="2.54" x2="-5.715" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="-3.683" x2="-10.795" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="-3.683" x2="-5.715" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="-3.683" x2="-11.43" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="-11.43" y1="-3.683" x2="-11.43" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="-11.176" y1="-2.032" x2="-11.176" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="-11.176" y1="-3.175" x2="-10.795" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="-3.175" x2="-10.795" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="2.54" x2="-5.715" y2="3.683" width="0.1524" layer="21"/>
<wire x1="-11.43" y1="-2.032" x2="-11.43" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="-11.43" y1="-1.27" x2="-11.176" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="-11.176" y1="-1.27" x2="-11.176" y2="-2.032" width="0.1524" layer="51"/>
<wire x1="10.795" y1="-3.683" x2="5.715" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="10.795" y1="3.683" x2="10.795" y2="3.175" width="0.1524" layer="21"/>
<wire x1="10.795" y1="2.54" x2="5.715" y2="2.54" width="0.1524" layer="21"/>
<wire x1="10.795" y1="-3.683" x2="10.795" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="10.795" y1="-2.54" x2="5.715" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="5.715" y1="3.683" x2="10.795" y2="3.683" width="0.1524" layer="21"/>
<wire x1="5.715" y1="3.683" x2="5.715" y2="2.54" width="0.1524" layer="21"/>
<wire x1="10.795" y1="3.683" x2="11.43" y2="3.683" width="0.1524" layer="21"/>
<wire x1="11.43" y1="3.683" x2="11.43" y2="2.032" width="0.1524" layer="21"/>
<wire x1="11.176" y1="2.032" x2="11.176" y2="3.175" width="0.1524" layer="21"/>
<wire x1="11.176" y1="3.175" x2="10.795" y2="3.175" width="0.1524" layer="21"/>
<wire x1="10.795" y1="3.175" x2="10.795" y2="2.54" width="0.1524" layer="21"/>
<wire x1="5.715" y1="-2.54" x2="5.715" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="11.43" y1="2.032" x2="11.43" y2="1.27" width="0.1524" layer="51"/>
<wire x1="11.43" y1="1.27" x2="11.176" y2="1.27" width="0.1524" layer="51"/>
<wire x1="11.176" y1="1.27" x2="11.176" y2="2.032" width="0.1524" layer="51"/>
<wire x1="-5.207" y1="0" x2="5.207" y2="0" width="0.0508" layer="21"/>
<wire x1="12.573" y1="3.937" x2="12.573" y2="1.651" width="0.1524" layer="21"/>
<wire x1="12.573" y1="-1.651" x2="12.573" y2="1.651" width="0.1524" layer="51"/>
<wire x1="12.573" y1="-1.651" x2="12.573" y2="-3.937" width="0.1524" layer="21"/>
<wire x1="-12.573" y1="3.937" x2="-12.573" y2="1.651" width="0.1524" layer="21"/>
<wire x1="-12.573" y1="-1.651" x2="-12.573" y2="1.651" width="0.1524" layer="51"/>
<wire x1="-12.573" y1="-1.651" x2="-12.573" y2="-3.937" width="0.1524" layer="21"/>
<pad name="1" x="-11.2522" y="0" drill="1.3208" diameter="2.54" shape="long" rot="R90"/>
<pad name="2" x="11.2522" y="0" drill="1.3208" diameter="2.54" shape="long" rot="R90"/>
<text x="-12.7" y="-6.096" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="1.143" y="-6.096" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-10.541" y1="-2.032" x2="-10.16" y2="2.032" layer="51"/>
<rectangle x1="-10.541" y1="1.905" x2="-9.652" y2="2.032" layer="51"/>
<rectangle x1="-10.541" y1="-2.032" x2="-9.652" y2="-1.905" layer="51"/>
<rectangle x1="-5.715" y1="-3.175" x2="-5.08" y2="-2.032" layer="21"/>
<rectangle x1="-5.715" y1="2.032" x2="-5.08" y2="3.175" layer="21"/>
<rectangle x1="-5.715" y1="-2.032" x2="-5.08" y2="2.032" layer="21"/>
<rectangle x1="10.16" y1="-2.032" x2="10.541" y2="2.032" layer="51"/>
<rectangle x1="9.652" y1="-2.032" x2="10.541" y2="-1.905" layer="51"/>
<rectangle x1="9.652" y1="1.905" x2="10.541" y2="2.032" layer="51"/>
<rectangle x1="5.08" y1="2.032" x2="5.715" y2="3.175" layer="21"/>
<rectangle x1="5.08" y1="-3.175" x2="5.715" y2="-2.032" layer="21"/>
<rectangle x1="5.08" y1="-2.032" x2="5.715" y2="2.032" layer="21"/>
<rectangle x1="-5.08" y1="2.159" x2="5.08" y2="2.667" layer="21"/>
<rectangle x1="-5.08" y1="-2.667" x2="5.08" y2="-2.159" layer="21"/>
<rectangle x1="5.715" y1="-2.032" x2="9.652" y2="-1.905" layer="21"/>
<rectangle x1="5.715" y1="1.905" x2="9.652" y2="2.032" layer="21"/>
<rectangle x1="-9.652" y1="1.905" x2="-5.715" y2="2.032" layer="21"/>
<rectangle x1="-9.652" y1="-2.032" x2="-5.715" y2="-1.905" layer="21"/>
<rectangle x1="-10.541" y1="-2.54" x2="-5.715" y2="-2.032" layer="21"/>
<rectangle x1="-10.541" y1="2.032" x2="-5.715" y2="2.54" layer="21"/>
<rectangle x1="5.715" y1="2.032" x2="10.541" y2="2.54" layer="21"/>
<rectangle x1="5.715" y1="-2.54" x2="10.541" y2="-2.032" layer="21"/>
</package>
<package name="SH22,5A" urn="urn:adsk.eagle:footprint:14045/1" library_version="2">
<description>&lt;b&gt;FUSE HOLDER&lt;/b&gt;&lt;p&gt; grid 22,5 mm, isolated cap&lt;p&gt; OGN0031 8201 Schurter (Buerklin)</description>
<wire x1="-12.573" y1="-5.461" x2="12.573" y2="-5.461" width="0.1524" layer="21"/>
<wire x1="12.573" y1="5.461" x2="-12.573" y2="5.461" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-2.921" x2="5.08" y2="-2.921" width="0.0508" layer="21"/>
<wire x1="-5.08" y1="2.921" x2="5.08" y2="2.921" width="0.0508" layer="21"/>
<wire x1="-10.795" y1="3.683" x2="-5.715" y2="3.683" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="-3.683" x2="-10.795" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="-2.54" x2="-5.715" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="3.683" x2="-10.795" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="2.54" x2="-5.715" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="-3.683" x2="-10.795" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="-3.683" x2="-5.715" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="-3.683" x2="-11.43" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="-11.43" y1="-3.683" x2="-11.43" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="-11.176" y1="-2.032" x2="-11.176" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="-11.176" y1="-3.175" x2="-10.795" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="-3.175" x2="-10.795" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="2.54" x2="-5.715" y2="3.683" width="0.1524" layer="21"/>
<wire x1="-11.43" y1="-2.032" x2="-11.43" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="-11.43" y1="-1.27" x2="-11.176" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="-11.176" y1="-1.27" x2="-11.176" y2="-2.032" width="0.1524" layer="51"/>
<wire x1="10.795" y1="-3.683" x2="5.715" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="10.795" y1="3.683" x2="10.795" y2="3.175" width="0.1524" layer="21"/>
<wire x1="10.795" y1="2.54" x2="5.715" y2="2.54" width="0.1524" layer="21"/>
<wire x1="10.795" y1="-3.683" x2="10.795" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="10.795" y1="-2.54" x2="5.715" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="5.715" y1="3.683" x2="10.795" y2="3.683" width="0.1524" layer="21"/>
<wire x1="5.715" y1="3.683" x2="5.715" y2="2.54" width="0.1524" layer="21"/>
<wire x1="10.795" y1="3.683" x2="11.43" y2="3.683" width="0.1524" layer="21"/>
<wire x1="11.43" y1="3.683" x2="11.43" y2="2.032" width="0.1524" layer="21"/>
<wire x1="11.176" y1="2.032" x2="11.176" y2="3.175" width="0.1524" layer="21"/>
<wire x1="11.176" y1="3.175" x2="10.795" y2="3.175" width="0.1524" layer="21"/>
<wire x1="10.795" y1="3.175" x2="10.795" y2="2.54" width="0.1524" layer="21"/>
<wire x1="5.715" y1="-2.54" x2="5.715" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="11.43" y1="2.032" x2="11.43" y2="1.27" width="0.1524" layer="51"/>
<wire x1="11.43" y1="1.27" x2="11.176" y2="1.27" width="0.1524" layer="51"/>
<wire x1="11.176" y1="1.27" x2="11.176" y2="2.032" width="0.1524" layer="51"/>
<wire x1="-5.207" y1="0" x2="5.207" y2="0" width="0.0508" layer="21"/>
<wire x1="12.573" y1="5.461" x2="12.573" y2="1.651" width="0.1524" layer="21"/>
<wire x1="12.573" y1="-1.651" x2="12.573" y2="1.651" width="0.1524" layer="51"/>
<wire x1="12.573" y1="-1.651" x2="12.573" y2="-5.461" width="0.1524" layer="21"/>
<wire x1="-12.573" y1="5.461" x2="-12.573" y2="1.651" width="0.1524" layer="21"/>
<wire x1="-12.573" y1="-1.651" x2="-12.573" y2="1.651" width="0.1524" layer="51"/>
<wire x1="-12.573" y1="-1.651" x2="-12.573" y2="-5.461" width="0.1524" layer="21"/>
<pad name="1" x="-11.2522" y="0" drill="1.3208" diameter="2.54" shape="long" rot="R90"/>
<pad name="2" x="11.2522" y="0" drill="1.3208" diameter="2.54" shape="long" rot="R90"/>
<text x="-12.7" y="-7.62" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="0.0254" y="-7.62" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-10.541" y1="-2.032" x2="-10.16" y2="2.032" layer="51"/>
<rectangle x1="-10.541" y1="1.905" x2="-9.652" y2="2.032" layer="51"/>
<rectangle x1="-10.541" y1="-2.032" x2="-9.652" y2="-1.905" layer="51"/>
<rectangle x1="-5.715" y1="-3.175" x2="-5.08" y2="-2.032" layer="21"/>
<rectangle x1="-5.715" y1="2.032" x2="-5.08" y2="3.175" layer="21"/>
<rectangle x1="-5.715" y1="-2.032" x2="-5.08" y2="2.032" layer="21"/>
<rectangle x1="10.16" y1="-2.032" x2="10.541" y2="2.032" layer="51"/>
<rectangle x1="9.652" y1="-2.032" x2="10.541" y2="-1.905" layer="51"/>
<rectangle x1="9.652" y1="1.905" x2="10.541" y2="2.032" layer="51"/>
<rectangle x1="5.08" y1="2.032" x2="5.715" y2="3.175" layer="21"/>
<rectangle x1="5.08" y1="-3.175" x2="5.715" y2="-2.032" layer="21"/>
<rectangle x1="5.08" y1="-2.032" x2="5.715" y2="2.032" layer="21"/>
<rectangle x1="-5.08" y1="2.159" x2="5.08" y2="2.667" layer="21"/>
<rectangle x1="-5.08" y1="-2.667" x2="5.08" y2="-2.159" layer="21"/>
<rectangle x1="5.715" y1="-2.032" x2="9.652" y2="-1.905" layer="21"/>
<rectangle x1="5.715" y1="1.905" x2="9.652" y2="2.032" layer="21"/>
<rectangle x1="-9.652" y1="1.905" x2="-5.715" y2="2.032" layer="21"/>
<rectangle x1="-9.652" y1="-2.032" x2="-5.715" y2="-1.905" layer="21"/>
<rectangle x1="-10.541" y1="-2.54" x2="-5.715" y2="-2.032" layer="21"/>
<rectangle x1="-10.541" y1="2.032" x2="-5.715" y2="2.54" layer="21"/>
<rectangle x1="5.715" y1="2.032" x2="10.541" y2="2.54" layer="21"/>
<rectangle x1="5.715" y1="-2.54" x2="10.541" y2="-2.032" layer="21"/>
</package>
<package name="SH25" urn="urn:adsk.eagle:footprint:14042/1" library_version="2">
<description>&lt;b&gt;FUSE HOLDER&lt;/b&gt;&lt;p&gt; grid 2,5 mm,  OGN0031 8211 Schurter (Buerklin)</description>
<wire x1="-13.081" y1="-5.461" x2="13.081" y2="-5.461" width="0.1524" layer="21"/>
<wire x1="13.081" y1="5.461" x2="-13.081" y2="5.461" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-2.921" x2="5.08" y2="-2.921" width="0.0508" layer="21"/>
<wire x1="-5.08" y1="2.921" x2="5.08" y2="2.921" width="0.0508" layer="21"/>
<wire x1="-10.795" y1="3.683" x2="-5.715" y2="3.683" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="-3.683" x2="-10.795" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="-2.54" x2="-5.715" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="3.683" x2="-10.795" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="2.54" x2="-5.715" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="-3.683" x2="-10.795" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="-3.683" x2="-5.715" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="-3.683" x2="-11.43" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="-11.43" y1="-3.683" x2="-11.43" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="-11.176" y1="-2.032" x2="-11.176" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="-11.176" y1="-3.175" x2="-10.795" y2="-3.175" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="-3.175" x2="-10.795" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-5.715" y1="2.54" x2="-5.715" y2="3.683" width="0.1524" layer="21"/>
<wire x1="-11.43" y1="-2.032" x2="-11.43" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="-11.43" y1="-1.27" x2="-11.176" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="-11.176" y1="-1.27" x2="-11.176" y2="-2.032" width="0.1524" layer="51"/>
<wire x1="10.795" y1="-3.683" x2="5.715" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="10.795" y1="3.683" x2="10.795" y2="3.175" width="0.1524" layer="21"/>
<wire x1="10.795" y1="2.54" x2="5.715" y2="2.54" width="0.1524" layer="21"/>
<wire x1="10.795" y1="-3.683" x2="10.795" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="10.795" y1="-2.54" x2="5.715" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="5.715" y1="3.683" x2="10.795" y2="3.683" width="0.1524" layer="21"/>
<wire x1="5.715" y1="3.683" x2="5.715" y2="2.54" width="0.1524" layer="21"/>
<wire x1="10.795" y1="3.683" x2="11.43" y2="3.683" width="0.1524" layer="21"/>
<wire x1="11.43" y1="3.683" x2="11.43" y2="2.032" width="0.1524" layer="21"/>
<wire x1="11.176" y1="2.032" x2="11.176" y2="3.175" width="0.1524" layer="21"/>
<wire x1="11.176" y1="3.175" x2="10.795" y2="3.175" width="0.1524" layer="21"/>
<wire x1="10.795" y1="3.175" x2="10.795" y2="2.54" width="0.1524" layer="21"/>
<wire x1="5.715" y1="-2.54" x2="5.715" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="11.43" y1="2.032" x2="11.43" y2="1.27" width="0.1524" layer="51"/>
<wire x1="11.43" y1="1.27" x2="11.176" y2="1.27" width="0.1524" layer="51"/>
<wire x1="11.176" y1="1.27" x2="11.176" y2="2.032" width="0.1524" layer="51"/>
<wire x1="-5.207" y1="0" x2="5.207" y2="0" width="0.0508" layer="21"/>
<wire x1="13.081" y1="5.461" x2="13.081" y2="2.032" width="0.1524" layer="21"/>
<wire x1="13.081" y1="-2.032" x2="13.081" y2="2.032" width="0.1524" layer="51"/>
<wire x1="13.081" y1="-2.032" x2="13.081" y2="-5.461" width="0.1524" layer="21"/>
<wire x1="-13.081" y1="5.461" x2="-13.081" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-13.081" y1="-2.032" x2="-13.081" y2="2.032" width="0.1524" layer="51"/>
<wire x1="-13.081" y1="-2.032" x2="-13.081" y2="-5.461" width="0.1524" layer="21"/>
<pad name="1" x="-12.5222" y="0" drill="1.3208" diameter="2.54" shape="long" rot="R90"/>
<pad name="2" x="12.5222" y="0" drill="1.3208" diameter="2.54" shape="long" rot="R90"/>
<text x="-12.7" y="-7.62" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="0" y="-7.62" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-10.541" y1="-2.032" x2="-10.16" y2="2.032" layer="21"/>
<rectangle x1="-10.541" y1="1.905" x2="-9.652" y2="2.032" layer="21"/>
<rectangle x1="-10.541" y1="-2.032" x2="-9.652" y2="-1.905" layer="21"/>
<rectangle x1="-5.715" y1="-3.175" x2="-5.08" y2="-2.032" layer="21"/>
<rectangle x1="-5.715" y1="2.032" x2="-5.08" y2="3.175" layer="21"/>
<rectangle x1="-5.715" y1="-2.032" x2="-5.08" y2="2.032" layer="21"/>
<rectangle x1="10.16" y1="-2.032" x2="10.541" y2="2.032" layer="21"/>
<rectangle x1="9.652" y1="-2.032" x2="10.541" y2="-1.905" layer="21"/>
<rectangle x1="9.652" y1="1.905" x2="10.541" y2="2.032" layer="21"/>
<rectangle x1="5.08" y1="2.032" x2="5.715" y2="3.175" layer="21"/>
<rectangle x1="5.08" y1="-3.175" x2="5.715" y2="-2.032" layer="21"/>
<rectangle x1="5.08" y1="-2.032" x2="5.715" y2="2.032" layer="21"/>
<rectangle x1="-5.08" y1="2.159" x2="5.08" y2="2.667" layer="21"/>
<rectangle x1="-5.08" y1="-2.667" x2="5.08" y2="-2.159" layer="21"/>
<rectangle x1="5.715" y1="-2.032" x2="9.652" y2="-1.905" layer="21"/>
<rectangle x1="5.715" y1="1.905" x2="9.652" y2="2.032" layer="21"/>
<rectangle x1="-9.652" y1="1.905" x2="-5.715" y2="2.032" layer="21"/>
<rectangle x1="-9.652" y1="-2.032" x2="-5.715" y2="-1.905" layer="21"/>
<rectangle x1="-10.541" y1="-2.54" x2="-5.715" y2="-2.032" layer="21"/>
<rectangle x1="-10.541" y1="2.032" x2="-5.715" y2="2.54" layer="21"/>
<rectangle x1="5.715" y1="2.032" x2="10.541" y2="2.54" layer="21"/>
<rectangle x1="5.715" y1="-2.54" x2="10.541" y2="-2.032" layer="21"/>
</package>
<package name="SH32" urn="urn:adsk.eagle:footprint:14044/1" library_version="2">
<description>&lt;b&gt;FUSE HOLDER&lt;/b&gt;&lt;p&gt; 6 x 32 mm, SH contact, SHH3N Schukat / Wickmann 102071 (Buerklin)</description>
<wire x1="9.017" y1="3.81" x2="9.525" y2="3.81" width="0.1524" layer="21"/>
<wire x1="-8.89" y1="3.556" x2="8.89" y2="3.556" width="0.1524" layer="21"/>
<wire x1="8.89" y1="3.556" x2="9.017" y2="3.556" width="0.1524" layer="21"/>
<wire x1="9.017" y1="-3.81" x2="9.017" y2="-3.556" width="0.1524" layer="21"/>
<wire x1="9.017" y1="-3.556" x2="8.89" y2="-3.556" width="0.1524" layer="21"/>
<wire x1="8.89" y1="-3.556" x2="-8.89" y2="-3.556" width="0.1524" layer="21"/>
<wire x1="9.017" y1="3.556" x2="9.017" y2="3.81" width="0.1524" layer="21"/>
<wire x1="9.525" y1="-3.81" x2="9.525" y2="-4.445" width="0.1524" layer="21"/>
<wire x1="9.525" y1="-3.81" x2="9.017" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="9.525" y1="-4.445" x2="16.764" y2="-4.445" width="0.1524" layer="21"/>
<wire x1="16.764" y1="4.445" x2="9.525" y2="4.445" width="0.1524" layer="21"/>
<wire x1="9.525" y1="3.81" x2="9.525" y2="4.445" width="0.1524" layer="21"/>
<wire x1="9.525" y1="-3.81" x2="9.525" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="9.525" y1="3.81" x2="9.525" y2="2.794" width="0.1524" layer="21"/>
<wire x1="9.525" y1="-2.794" x2="16.002" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="9.525" y1="2.794" x2="16.002" y2="2.794" width="0.1524" layer="21"/>
<wire x1="16.764" y1="-2.032" x2="16.764" y2="2.032" width="0.1524" layer="51"/>
<wire x1="16.002" y1="-2.032" x2="16.002" y2="2.032" width="0.1524" layer="51"/>
<wire x1="9.017" y1="-2.032" x2="9.017" y2="0" width="0.1524" layer="51"/>
<wire x1="16.764" y1="-2.032" x2="16.764" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="16.764" y1="-2.794" x2="16.764" y2="-4.445" width="0.1524" layer="21"/>
<wire x1="16.002" y1="-2.032" x2="16.002" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="16.002" y1="-2.794" x2="16.764" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="16.764" y1="4.445" x2="16.764" y2="2.794" width="0.1524" layer="21"/>
<wire x1="16.764" y1="2.794" x2="16.764" y2="2.032" width="0.1524" layer="21"/>
<wire x1="16.002" y1="2.032" x2="16.002" y2="2.794" width="0.1524" layer="21"/>
<wire x1="16.002" y1="2.794" x2="16.764" y2="2.794" width="0.1524" layer="21"/>
<wire x1="9.017" y1="2.032" x2="9.017" y2="3.556" width="0.1524" layer="21"/>
<wire x1="9.017" y1="-2.032" x2="9.017" y2="-3.556" width="0.1524" layer="21"/>
<wire x1="9.017" y1="0" x2="6.985" y2="0" width="0.0508" layer="51"/>
<wire x1="9.017" y1="0" x2="9.017" y2="2.032" width="0.1524" layer="51"/>
<wire x1="-9.017" y1="-3.81" x2="-9.525" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="8.89" y1="-3.556" x2="-9.017" y2="-3.556" width="0.1524" layer="21"/>
<wire x1="-9.017" y1="3.81" x2="-9.017" y2="3.556" width="0.1524" layer="21"/>
<wire x1="-9.017" y1="3.556" x2="8.89" y2="3.556" width="0.1524" layer="21"/>
<wire x1="-9.017" y1="-3.556" x2="-9.017" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="3.81" x2="-9.525" y2="4.445" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="3.81" x2="-9.017" y2="3.81" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="4.445" x2="-16.764" y2="4.445" width="0.1524" layer="21"/>
<wire x1="-16.764" y1="-4.445" x2="-9.525" y2="-4.445" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="-3.81" x2="-9.525" y2="-4.445" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="3.81" x2="-9.525" y2="2.794" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="-3.81" x2="-9.525" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="2.794" x2="-16.002" y2="2.794" width="0.1524" layer="21"/>
<wire x1="-9.525" y1="-2.794" x2="-16.002" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="-16.764" y1="2.032" x2="-16.764" y2="-2.032" width="0.1524" layer="51"/>
<wire x1="-16.002" y1="2.032" x2="-16.002" y2="-2.032" width="0.1524" layer="51"/>
<wire x1="-9.017" y1="2.032" x2="-9.017" y2="0" width="0.1524" layer="51"/>
<wire x1="-16.764" y1="2.032" x2="-16.764" y2="2.794" width="0.1524" layer="21"/>
<wire x1="-16.764" y1="2.794" x2="-16.764" y2="4.445" width="0.1524" layer="21"/>
<wire x1="-16.002" y1="2.032" x2="-16.002" y2="2.794" width="0.1524" layer="21"/>
<wire x1="-16.002" y1="2.794" x2="-16.764" y2="2.794" width="0.1524" layer="21"/>
<wire x1="-16.764" y1="-4.445" x2="-16.764" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="-16.764" y1="-2.794" x2="-16.764" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="-16.002" y1="-2.032" x2="-16.002" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="-16.002" y1="-2.794" x2="-16.764" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="-9.017" y1="-2.032" x2="-9.017" y2="-3.556" width="0.1524" layer="21"/>
<wire x1="-9.017" y1="2.032" x2="-9.017" y2="3.556" width="0.1524" layer="21"/>
<wire x1="-9.017" y1="0" x2="-6.985" y2="0" width="0.0508" layer="51"/>
<wire x1="-9.017" y1="0" x2="-9.017" y2="-2.032" width="0.1524" layer="51"/>
<wire x1="-6.985" y1="0" x2="6.985" y2="0" width="0.0508" layer="21"/>
<pad name="2B" x="16.764" y="0" drill="2.0066" shape="long" rot="R90"/>
<pad name="2A" x="9.144" y="0" drill="2.0066" shape="long" rot="R90"/>
<pad name="1A" x="-16.764" y="0" drill="2.0066" shape="long" rot="R90"/>
<pad name="1B" x="-9.144" y="0" drill="2.0066" shape="long" rot="R90"/>
<text x="-7.62" y="3.937" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-7.62" y="-5.334" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="9.017" y1="-3.81" x2="9.525" y2="-2.159" layer="21"/>
<rectangle x1="9.017" y1="2.159" x2="9.525" y2="3.81" layer="21"/>
<rectangle x1="9.017" y1="-2.159" x2="9.525" y2="2.159" layer="51"/>
<rectangle x1="-9.525" y1="-3.81" x2="-9.017" y2="-2.159" layer="21"/>
<rectangle x1="-9.525" y1="2.159" x2="-9.017" y2="3.81" layer="21"/>
<rectangle x1="-9.525" y1="-2.159" x2="-9.017" y2="2.159" layer="51"/>
</package>
<package name="SHK20L" urn="urn:adsk.eagle:footprint:14046/1" library_version="2">
<description>&lt;b&gt;FUSE HOLDER&lt;/b&gt;&lt;p&gt; 5 x 20 mm, SH contact, SHH1 Schukat / E1073 Buerklin</description>
<wire x1="-5.334" y1="2.921" x2="5.334" y2="2.921" width="0.0508" layer="21"/>
<wire x1="-3.302" y1="0" x2="3.302" y2="0" width="0.1524" layer="21"/>
<wire x1="-10.414" y1="3.683" x2="-5.969" y2="3.683" width="0.1524" layer="21"/>
<wire x1="-10.414" y1="-3.683" x2="-10.414" y2="-3.429" width="0.1524" layer="21"/>
<wire x1="-10.414" y1="-2.54" x2="-5.969" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-10.414" y1="3.683" x2="-10.414" y2="3.429" width="0.1524" layer="21"/>
<wire x1="-10.414" y1="2.54" x2="-5.969" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-5.969" y1="-3.683" x2="-10.414" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="-5.969" y1="-3.683" x2="-5.969" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-10.414" y1="-3.683" x2="-11.049" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="-11.049" y1="-3.683" x2="-11.049" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="-2.032" x2="-10.795" y2="-3.429" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="-3.429" x2="-10.414" y2="-3.429" width="0.1524" layer="21"/>
<wire x1="-10.414" y1="-3.429" x2="-10.414" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-5.969" y1="2.54" x2="-5.969" y2="3.683" width="0.1524" layer="21"/>
<wire x1="-11.049" y1="-2.032" x2="-11.049" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="-11.049" y1="-1.27" x2="-10.795" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="-10.795" y1="-1.27" x2="-10.795" y2="-2.032" width="0.1524" layer="51"/>
<wire x1="-3.302" y1="0" x2="-5.334" y2="0" width="0.1524" layer="51"/>
<wire x1="5.334" y1="-2.921" x2="-5.334" y2="-2.921" width="0.0508" layer="21"/>
<wire x1="10.414" y1="-3.683" x2="5.969" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="10.414" y1="3.683" x2="10.414" y2="3.429" width="0.1524" layer="21"/>
<wire x1="10.414" y1="2.54" x2="5.969" y2="2.54" width="0.1524" layer="21"/>
<wire x1="10.414" y1="-3.683" x2="10.414" y2="-3.429" width="0.1524" layer="21"/>
<wire x1="10.414" y1="-2.54" x2="5.969" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="5.969" y1="3.683" x2="10.414" y2="3.683" width="0.1524" layer="21"/>
<wire x1="5.969" y1="3.683" x2="5.969" y2="2.54" width="0.1524" layer="21"/>
<wire x1="10.414" y1="3.683" x2="11.049" y2="3.683" width="0.1524" layer="21"/>
<wire x1="11.049" y1="3.683" x2="11.049" y2="2.032" width="0.1524" layer="21"/>
<wire x1="10.795" y1="2.032" x2="10.795" y2="3.429" width="0.1524" layer="21"/>
<wire x1="10.795" y1="3.429" x2="10.414" y2="3.429" width="0.1524" layer="21"/>
<wire x1="10.414" y1="3.429" x2="10.414" y2="2.54" width="0.1524" layer="21"/>
<wire x1="5.969" y1="-2.54" x2="5.969" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="11.049" y1="2.032" x2="11.049" y2="1.27" width="0.1524" layer="51"/>
<wire x1="11.049" y1="1.27" x2="10.795" y2="1.27" width="0.1524" layer="51"/>
<wire x1="10.795" y1="1.27" x2="10.795" y2="2.032" width="0.1524" layer="51"/>
<wire x1="3.302" y1="0" x2="5.334" y2="0" width="0.1524" layer="51"/>
<wire x1="10.414" y1="-3.683" x2="11.049" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="11.049" y1="-2.032" x2="11.049" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="10.795" y1="-3.429" x2="10.795" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="10.795" y1="-3.429" x2="10.414" y2="-3.429" width="0.1524" layer="21"/>
<wire x1="10.414" y1="-3.429" x2="10.414" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="11.049" y1="1.27" x2="11.049" y2="-2.032" width="0.1524" layer="51"/>
<wire x1="10.795" y1="1.27" x2="10.795" y2="-2.032" width="0.1524" layer="51"/>
<wire x1="-10.795" y1="2.032" x2="-10.795" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="-11.049" y1="2.032" x2="-11.049" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="-10.414" y1="3.683" x2="-11.049" y2="3.683" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="3.429" x2="-10.414" y2="3.429" width="0.1524" layer="21"/>
<wire x1="-10.414" y1="3.429" x2="-10.414" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="3.429" x2="-10.795" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-11.049" y1="2.032" x2="-11.049" y2="3.683" width="0.1524" layer="21"/>
<pad name="1A" x="-10.414" y="0" drill="1.3208" diameter="2.54" shape="long" rot="R90"/>
<pad name="2A" x="10.414" y="0" drill="1.3208" diameter="2.54" shape="long" rot="R90"/>
<pad name="2B" x="5.334" y="0" drill="1.3208" diameter="2.54" shape="long" rot="R90"/>
<pad name="1B" x="-5.334" y="0" drill="1.3208" diameter="2.54" shape="long" rot="R90"/>
<text x="-3.81" y="3.175" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.81" y="-5.08" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-10.033" y1="-2.032" x2="-9.652" y2="2.032" layer="51"/>
<rectangle x1="-5.969" y1="-3.175" x2="-5.334" y2="-2.032" layer="21"/>
<rectangle x1="-5.969" y1="2.032" x2="-5.334" y2="3.175" layer="21"/>
<rectangle x1="-5.969" y1="-2.032" x2="-5.334" y2="2.032" layer="51"/>
<rectangle x1="9.652" y1="-2.032" x2="10.033" y2="2.032" layer="51"/>
<rectangle x1="5.334" y1="2.032" x2="5.969" y2="3.175" layer="21"/>
<rectangle x1="5.334" y1="-3.175" x2="5.969" y2="-2.032" layer="21"/>
<rectangle x1="5.334" y1="-2.032" x2="5.969" y2="2.032" layer="51"/>
<rectangle x1="4.064" y1="1.651" x2="5.334" y2="2.159" layer="51"/>
<rectangle x1="4.064" y1="-2.159" x2="5.334" y2="-1.651" layer="51"/>
<rectangle x1="-5.334" y1="1.651" x2="-4.064" y2="2.159" layer="51"/>
<rectangle x1="-5.334" y1="-2.159" x2="-4.064" y2="-1.651" layer="51"/>
<rectangle x1="-10.414" y1="-2.54" x2="-5.969" y2="-2.032" layer="21"/>
<rectangle x1="-4.064" y1="-2.159" x2="4.064" y2="-1.651" layer="21"/>
<rectangle x1="-4.064" y1="1.651" x2="4.064" y2="2.159" layer="21"/>
<rectangle x1="-6.223" y1="1.905" x2="-5.969" y2="2.032" layer="51"/>
<rectangle x1="5.969" y1="1.905" x2="6.223" y2="2.032" layer="51"/>
<rectangle x1="5.969" y1="-2.032" x2="6.223" y2="-1.905" layer="51"/>
<rectangle x1="9.398" y1="1.905" x2="9.652" y2="2.032" layer="51"/>
<rectangle x1="9.398" y1="-2.032" x2="9.652" y2="-1.905" layer="51"/>
<rectangle x1="6.223" y1="-2.032" x2="9.398" y2="-1.905" layer="21"/>
<rectangle x1="6.223" y1="1.905" x2="9.398" y2="2.032" layer="21"/>
<rectangle x1="5.969" y1="2.032" x2="10.033" y2="2.54" layer="21"/>
<rectangle x1="5.969" y1="-2.54" x2="10.033" y2="-2.032" layer="21"/>
<rectangle x1="-10.033" y1="2.032" x2="-5.969" y2="2.54" layer="21"/>
<rectangle x1="-9.398" y1="1.905" x2="-6.223" y2="2.032" layer="21"/>
<rectangle x1="-9.652" y1="1.905" x2="-9.398" y2="2.032" layer="51"/>
<rectangle x1="-6.223" y1="-2.032" x2="-5.969" y2="-1.905" layer="51"/>
<rectangle x1="-9.398" y1="-2.032" x2="-6.223" y2="-1.905" layer="21"/>
<rectangle x1="-9.652" y1="-2.032" x2="-9.398" y2="-1.905" layer="51"/>
</package>
<package name="SHK20Q" urn="urn:adsk.eagle:footprint:14047/1" library_version="2">
<description>&lt;b&gt;FUSE HOLDER&lt;/b&gt;&lt;p&gt; 5 x 20 mm, SH contact, E1207 Buerklin 46G6061</description>
<wire x1="-5.08" y1="2.921" x2="5.08" y2="2.921" width="0.0508" layer="21"/>
<wire x1="-9.652" y1="3.683" x2="-6.096" y2="3.683" width="0.1524" layer="51"/>
<wire x1="-10.414" y1="-3.683" x2="-10.414" y2="-3.429" width="0.1524" layer="21"/>
<wire x1="-10.414" y1="3.683" x2="-10.414" y2="3.429" width="0.1524" layer="21"/>
<wire x1="-9.906" y1="2.54" x2="-5.842" y2="2.54" width="0.1524" layer="51"/>
<wire x1="-6.096" y1="-3.683" x2="-9.652" y2="-3.683" width="0.1524" layer="51"/>
<wire x1="-5.842" y1="-3.683" x2="-5.842" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-10.414" y1="-3.683" x2="-11.049" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="-3.429" x2="-10.414" y2="-3.429" width="0.1524" layer="21"/>
<wire x1="-10.414" y1="-3.429" x2="-10.414" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-5.842" y1="2.54" x2="-5.842" y2="3.683" width="0.1524" layer="21"/>
<wire x1="-11.049" y1="-3.683" x2="-11.049" y2="0.889" width="0.1524" layer="21"/>
<wire x1="-11.049" y1="0.889" x2="-10.795" y2="0.889" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="0.889" x2="-10.795" y2="-3.429" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0" x2="-5.08" y2="0" width="0.0508" layer="21"/>
<wire x1="5.08" y1="-2.921" x2="-5.08" y2="-2.921" width="0.0508" layer="21"/>
<wire x1="9.652" y1="-3.683" x2="6.096" y2="-3.683" width="0.1524" layer="51"/>
<wire x1="10.414" y1="3.683" x2="10.414" y2="3.429" width="0.1524" layer="21"/>
<wire x1="9.906" y1="2.54" x2="5.842" y2="2.54" width="0.1524" layer="51"/>
<wire x1="10.414" y1="-3.683" x2="10.414" y2="-3.429" width="0.1524" layer="21"/>
<wire x1="9.906" y1="-2.54" x2="5.842" y2="-2.54" width="0.1524" layer="51"/>
<wire x1="6.096" y1="3.683" x2="9.652" y2="3.683" width="0.1524" layer="51"/>
<wire x1="5.842" y1="3.683" x2="5.842" y2="2.54" width="0.1524" layer="21"/>
<wire x1="10.414" y1="3.683" x2="11.049" y2="3.683" width="0.1524" layer="21"/>
<wire x1="10.795" y1="3.429" x2="10.414" y2="3.429" width="0.1524" layer="21"/>
<wire x1="10.414" y1="3.429" x2="10.414" y2="2.54" width="0.1524" layer="21"/>
<wire x1="5.842" y1="-2.54" x2="5.842" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="10.414" y1="-3.683" x2="11.049" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="10.795" y1="-3.429" x2="10.414" y2="-3.429" width="0.1524" layer="21"/>
<wire x1="10.414" y1="-3.429" x2="10.414" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="10.795" y1="-3.429" x2="10.795" y2="-0.889" width="0.1524" layer="21"/>
<wire x1="11.049" y1="3.683" x2="11.049" y2="-0.889" width="0.1524" layer="21"/>
<wire x1="-10.414" y1="3.683" x2="-11.049" y2="3.683" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="3.429" x2="-10.414" y2="3.429" width="0.1524" layer="21"/>
<wire x1="-10.414" y1="3.429" x2="-10.414" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-10.414" y1="2.54" x2="-10.414" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-10.795" y1="3.429" x2="-10.795" y2="0.889" width="0.1524" layer="21"/>
<wire x1="-11.049" y1="0.889" x2="-11.049" y2="3.683" width="0.1524" layer="21"/>
<wire x1="10.795" y1="-0.889" x2="11.049" y2="-0.889" width="0.1524" layer="21"/>
<wire x1="10.795" y1="-0.889" x2="10.795" y2="3.429" width="0.1524" layer="21"/>
<wire x1="11.049" y1="-0.889" x2="11.049" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="9.906" y1="2.54" x2="10.414" y2="2.54" width="0.1524" layer="21"/>
<wire x1="9.652" y1="3.683" x2="10.414" y2="3.683" width="0.1524" layer="21"/>
<wire x1="6.096" y1="3.683" x2="5.842" y2="3.683" width="0.1524" layer="21"/>
<wire x1="6.096" y1="-3.683" x2="5.842" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="9.652" y1="-3.683" x2="10.414" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="9.906" y1="-2.54" x2="10.414" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="10.414" y1="-2.54" x2="10.414" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="-6.096" y1="-3.683" x2="-5.842" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="-9.652" y1="-3.683" x2="-10.414" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="-9.906" y1="-2.54" x2="-10.414" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-10.414" y1="2.54" x2="-9.906" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-10.414" y1="3.683" x2="-9.652" y2="3.683" width="0.1524" layer="21"/>
<wire x1="-6.096" y1="3.683" x2="-5.842" y2="3.683" width="0.1524" layer="21"/>
<wire x1="-9.906" y1="-2.54" x2="-5.842" y2="-2.54" width="0.1524" layer="51"/>
<pad name="1A" x="-7.874" y="2.54" drill="1.5" diameter="3.81" shape="octagon"/>
<pad name="2A" x="7.874" y="2.54" drill="1.5" diameter="3.81" shape="octagon"/>
<pad name="2B" x="7.874" y="-2.54" drill="1.5" diameter="3.81" shape="octagon"/>
<pad name="1B" x="-7.874" y="-2.54" drill="1.5" diameter="3.81" shape="octagon"/>
<text x="-3.81" y="-5.08" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<text x="-3.81" y="3.302" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<rectangle x1="-5.08" y1="1.651" x2="5.08" y2="2.159" layer="21"/>
<rectangle x1="-5.08" y1="-2.159" x2="5.08" y2="-1.651" layer="21"/>
<rectangle x1="5.08" y1="-3.175" x2="5.588" y2="3.175" layer="21"/>
<rectangle x1="10.795" y1="-0.889" x2="11.049" y2="3.683" layer="21"/>
<rectangle x1="-10.795" y1="-3.683" x2="-10.414" y2="-3.429" layer="21"/>
<rectangle x1="-5.588" y1="-3.175" x2="-5.08" y2="3.175" layer="21"/>
<rectangle x1="-11.049" y1="-3.683" x2="-10.795" y2="0.889" layer="21"/>
<rectangle x1="5.588" y1="-3.175" x2="5.842" y2="-2.159" layer="21"/>
<rectangle x1="5.588" y1="2.159" x2="5.842" y2="3.175" layer="21"/>
<rectangle x1="9.906" y1="-2.54" x2="10.16" y2="2.54" layer="21"/>
<rectangle x1="5.842" y1="-2.54" x2="9.906" y2="-2.159" layer="51"/>
<rectangle x1="5.842" y1="2.159" x2="9.906" y2="2.54" layer="51"/>
<rectangle x1="-10.16" y1="-2.54" x2="-9.906" y2="2.54" layer="21"/>
<rectangle x1="-9.906" y1="2.159" x2="-5.842" y2="2.54" layer="51"/>
<rectangle x1="-5.842" y1="2.159" x2="-5.588" y2="3.175" layer="21"/>
<rectangle x1="-9.906" y1="-2.54" x2="-5.842" y2="-2.159" layer="51"/>
<rectangle x1="-5.842" y1="-3.175" x2="-5.588" y2="-2.159" layer="21"/>
</package>
<package name="SHKOG" urn="urn:adsk.eagle:footprint:14048/1" library_version="2">
<description>&lt;b&gt;FUSE HOLDER&lt;/b&gt;&lt;p&gt; 5 x 20/6 x 32 mm, SH contact, OG 46G6083 Buerklin</description>
<wire x1="-3.048" y1="0" x2="-5.08" y2="0" width="0.0508" layer="51"/>
<wire x1="9.144" y1="-3.683" x2="5.969" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="5.969" y1="3.683" x2="9.144" y2="3.683" width="0.1524" layer="21"/>
<wire x1="5.969" y1="3.683" x2="5.969" y2="2.54" width="0.1524" layer="21"/>
<wire x1="5.969" y1="-2.54" x2="5.969" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="0" x2="5.08" y2="0" width="0.0508" layer="21"/>
<wire x1="17.78" y1="3.683" x2="12.192" y2="3.683" width="0.1524" layer="21"/>
<wire x1="17.78" y1="-3.683" x2="12.192" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="17.78" y1="3.683" x2="17.78" y2="2.54" width="0.1524" layer="21"/>
<wire x1="9.144" y1="-3.683" x2="11.049" y2="-3.683" width="0.1524" layer="51"/>
<wire x1="9.144" y1="3.683" x2="11.049" y2="3.683" width="0.1524" layer="51"/>
<wire x1="8.636" y1="-2.54" x2="5.969" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="8.636" y1="-2.54" x2="11.049" y2="-2.54" width="0.1524" layer="51"/>
<wire x1="12.192" y1="-2.54" x2="17.78" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="17.78" y1="-2.54" x2="17.78" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="17.78" y1="2.54" x2="12.192" y2="2.54" width="0.1524" layer="21"/>
<wire x1="17.78" y1="2.54" x2="17.78" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="12.192" y1="2.54" x2="11.049" y2="2.54" width="0.1524" layer="51"/>
<wire x1="8.636" y1="2.54" x2="5.969" y2="2.54" width="0.1524" layer="21"/>
<wire x1="12.192" y1="-1.397" x2="12.192" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="12.192" y1="-3.683" x2="11.684" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="12.192" y1="1.397" x2="12.192" y2="3.683" width="0.1524" layer="21"/>
<wire x1="12.192" y1="3.683" x2="11.684" y2="3.683" width="0.1524" layer="21"/>
<wire x1="12.192" y1="1.397" x2="11.684" y2="1.397" width="0.1524" layer="21"/>
<wire x1="12.192" y1="-1.397" x2="11.684" y2="-1.397" width="0.1524" layer="21"/>
<wire x1="11.684" y1="-1.397" x2="11.049" y2="-1.397" width="0.1524" layer="51"/>
<wire x1="11.049" y1="-2.54" x2="11.049" y2="-1.397" width="0.1524" layer="51"/>
<wire x1="11.049" y1="-2.54" x2="12.192" y2="-2.54" width="0.1524" layer="51"/>
<wire x1="11.684" y1="1.397" x2="11.049" y2="1.397" width="0.1524" layer="51"/>
<wire x1="11.049" y1="2.54" x2="11.049" y2="1.397" width="0.1524" layer="51"/>
<wire x1="11.049" y1="2.54" x2="8.636" y2="2.54" width="0.1524" layer="51"/>
<wire x1="11.049" y1="-2.54" x2="11.049" y2="-3.683" width="0.1524" layer="51"/>
<wire x1="11.049" y1="-3.683" x2="11.684" y2="-3.683" width="0.1524" layer="51"/>
<wire x1="11.049" y1="2.54" x2="11.049" y2="3.683" width="0.1524" layer="51"/>
<wire x1="11.049" y1="3.683" x2="11.684" y2="3.683" width="0.1524" layer="51"/>
<wire x1="5.08" y1="-2.921" x2="-5.08" y2="-2.921" width="0.0508" layer="21"/>
<wire x1="-5.08" y1="2.921" x2="5.08" y2="2.921" width="0.1524" layer="21"/>
<wire x1="-9.144" y1="3.683" x2="-5.969" y2="3.683" width="0.1524" layer="21"/>
<wire x1="-5.969" y1="-3.683" x2="-9.144" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="-5.969" y1="-3.683" x2="-5.969" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-5.969" y1="2.54" x2="-5.969" y2="3.683" width="0.1524" layer="21"/>
<wire x1="-17.78" y1="-3.683" x2="-12.192" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="-17.78" y1="3.683" x2="-12.192" y2="3.683" width="0.1524" layer="21"/>
<wire x1="-17.78" y1="-3.683" x2="-17.78" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-9.144" y1="3.683" x2="-11.049" y2="3.683" width="0.1524" layer="51"/>
<wire x1="-9.144" y1="-3.683" x2="-11.049" y2="-3.683" width="0.1524" layer="51"/>
<wire x1="-8.636" y1="2.54" x2="-5.969" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-8.636" y1="2.54" x2="-11.049" y2="2.54" width="0.1524" layer="51"/>
<wire x1="-12.192" y1="2.54" x2="-17.78" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-17.78" y1="2.54" x2="-17.78" y2="3.683" width="0.1524" layer="21"/>
<wire x1="-17.78" y1="-2.54" x2="-12.192" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-17.78" y1="-2.54" x2="-17.78" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-12.192" y1="-2.54" x2="-11.049" y2="-2.54" width="0.1524" layer="51"/>
<wire x1="-8.636" y1="-2.54" x2="-5.969" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-12.192" y1="1.397" x2="-12.192" y2="3.683" width="0.1524" layer="21"/>
<wire x1="-12.192" y1="3.683" x2="-11.684" y2="3.683" width="0.1524" layer="21"/>
<wire x1="-12.192" y1="-1.397" x2="-12.192" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="-12.192" y1="-3.683" x2="-11.684" y2="-3.683" width="0.1524" layer="21"/>
<wire x1="-12.192" y1="-1.397" x2="-11.684" y2="-1.397" width="0.1524" layer="21"/>
<wire x1="-12.192" y1="1.397" x2="-11.684" y2="1.397" width="0.1524" layer="21"/>
<wire x1="-11.684" y1="1.397" x2="-11.049" y2="1.397" width="0.1524" layer="51"/>
<wire x1="-11.049" y1="2.54" x2="-11.049" y2="1.397" width="0.1524" layer="51"/>
<wire x1="-11.049" y1="2.54" x2="-12.192" y2="2.54" width="0.1524" layer="51"/>
<wire x1="-11.684" y1="-1.397" x2="-11.049" y2="-1.397" width="0.1524" layer="51"/>
<wire x1="-11.049" y1="-2.54" x2="-11.049" y2="-1.397" width="0.1524" layer="51"/>
<wire x1="-11.049" y1="-2.54" x2="-8.636" y2="-2.54" width="0.1524" layer="51"/>
<wire x1="-11.049" y1="2.54" x2="-11.049" y2="3.683" width="0.1524" layer="51"/>
<wire x1="-11.049" y1="3.683" x2="-11.684" y2="3.683" width="0.1524" layer="51"/>
<wire x1="-11.049" y1="-2.54" x2="-11.049" y2="-3.683" width="0.1524" layer="51"/>
<wire x1="-11.049" y1="-3.683" x2="-11.684" y2="-3.683" width="0.1524" layer="51"/>
<pad name="2B" x="10.414" y="-2.54" drill="1.3208" diameter="2.54" shape="long"/>
<pad name="2A" x="10.414" y="2.54" drill="1.3208" diameter="2.54" shape="long"/>
<pad name="1A" x="-10.414" y="2.54" drill="1.3208" diameter="2.54" shape="long"/>
<pad name="1B" x="-10.414" y="-2.54" drill="1.3208" diameter="2.54" shape="long"/>
<text x="-3.81" y="3.175" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.81" y="-5.08" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="16.637" y1="-2.54" x2="17.78" y2="-1.397" layer="21"/>
<rectangle x1="16.637" y1="1.397" x2="17.78" y2="2.54" layer="21"/>
<rectangle x1="11.049" y1="-2.54" x2="12.192" y2="-1.397" layer="51"/>
<rectangle x1="11.049" y1="1.397" x2="12.192" y2="2.54" layer="51"/>
<rectangle x1="5.715" y1="-2.54" x2="8.509" y2="-1.905" layer="21"/>
<rectangle x1="8.509" y1="-2.54" x2="10.16" y2="-1.905" layer="51"/>
<rectangle x1="5.715" y1="1.905" x2="8.509" y2="2.54" layer="21"/>
<rectangle x1="8.509" y1="1.905" x2="10.16" y2="2.54" layer="51"/>
<rectangle x1="-5.08" y1="-2.159" x2="5.08" y2="-1.651" layer="21"/>
<rectangle x1="-5.08" y1="1.651" x2="5.08" y2="2.159" layer="21"/>
<rectangle x1="-17.78" y1="1.397" x2="-16.637" y2="2.54" layer="21"/>
<rectangle x1="-17.78" y1="-2.54" x2="-16.637" y2="-1.397" layer="21"/>
<rectangle x1="-12.192" y1="1.397" x2="-11.049" y2="2.54" layer="51"/>
<rectangle x1="-12.192" y1="-2.54" x2="-11.049" y2="-1.397" layer="51"/>
<rectangle x1="-8.509" y1="1.905" x2="-5.715" y2="2.54" layer="21"/>
<rectangle x1="-10.16" y1="1.905" x2="-8.509" y2="2.54" layer="51"/>
<rectangle x1="-8.509" y1="-2.54" x2="-5.715" y2="-1.905" layer="21"/>
<rectangle x1="-10.16" y1="-2.54" x2="-8.509" y2="-1.905" layer="51"/>
<rectangle x1="-5.08" y1="1.651" x2="5.08" y2="2.159" layer="21"/>
<rectangle x1="-5.08" y1="-2.159" x2="5.08" y2="-1.651" layer="21"/>
<rectangle x1="9.779" y1="-0.889" x2="10.16" y2="0.889" layer="21"/>
<rectangle x1="9.779" y1="0.889" x2="10.16" y2="1.905" layer="51"/>
<rectangle x1="9.779" y1="-1.905" x2="10.16" y2="-0.889" layer="51"/>
<rectangle x1="-10.16" y1="-0.889" x2="-9.779" y2="0.889" layer="21"/>
<rectangle x1="-10.16" y1="0.889" x2="-9.779" y2="1.905" layer="51"/>
<rectangle x1="-10.16" y1="-1.905" x2="-9.779" y2="-0.889" layer="51"/>
<rectangle x1="5.08" y1="-3.175" x2="5.969" y2="3.175" layer="21"/>
<rectangle x1="-5.969" y1="-3.175" x2="-5.08" y2="3.175" layer="21"/>
</package>
<package name="TE5" urn="urn:adsk.eagle:footprint:14038/1" library_version="2">
<description>&lt;b&gt;FUSE&lt;/b&gt;&lt;p&gt;
Wickmann</description>
<wire x1="3.683" y1="2.032" x2="4.318" y2="1.397" width="0.1524" layer="21" curve="-90"/>
<wire x1="3.683" y1="-2.032" x2="4.318" y2="-1.397" width="0.1524" layer="21" curve="90"/>
<wire x1="-4.318" y1="-1.397" x2="-3.683" y2="-2.032" width="0.1524" layer="21" curve="90"/>
<wire x1="-4.318" y1="1.397" x2="-3.683" y2="2.032" width="0.1524" layer="21" curve="-90"/>
<wire x1="3.683" y1="2.032" x2="-3.683" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-4.318" y1="1.397" x2="-4.318" y2="-1.397" width="0.1524" layer="21"/>
<wire x1="-3.683" y1="-2.032" x2="3.683" y2="-2.032" width="0.1524" layer="21"/>
<wire x1="4.318" y1="-1.397" x2="4.318" y2="1.397" width="0.1524" layer="21"/>
<wire x1="-2.159" y1="0" x2="2.159" y2="0" width="0.1524" layer="51"/>
<wire x1="-1.27" y1="0.381" x2="-1.27" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="-1.27" y1="-0.381" x2="1.27" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="1.27" y1="0.381" x2="1.27" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="1.27" y1="0.381" x2="-1.27" y2="0.381" width="0.1524" layer="51"/>
<pad name="1" x="-2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="2.54" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-4.191" y="2.54" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.318" y="-3.81" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="TR5" urn="urn:adsk.eagle:footprint:14034/1" library_version="2">
<description>&lt;b&gt;FUSE&lt;/b&gt;&lt;p&gt;
Wickmann</description>
<wire x1="-2.159" y1="0" x2="2.159" y2="0" width="0.1524" layer="51"/>
<wire x1="-1.27" y1="0.381" x2="-1.27" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="-1.27" y1="-0.381" x2="1.27" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="1.27" y1="0.381" x2="1.27" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="1.27" y1="0.381" x2="-1.27" y2="0.381" width="0.1524" layer="51"/>
<circle x="0" y="0" radius="4.318" width="0.1524" layer="21"/>
<pad name="1" x="-2.54" y="0" drill="0.8128" diameter="1.778" shape="long" rot="R90"/>
<pad name="2" x="2.54" y="0" drill="0.8128" diameter="1.778" shape="long" rot="R90"/>
<text x="-2.54" y="5.08" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="-2.54" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
</packages>
<packages3d>
<package3d name="19559" urn="urn:adsk.eagle:package:14056/1" type="box" library_version="2">
<description>FUSE HOLDER
TR5 Fuse Holder Wickmann</description>
<packageinstances>
<packageinstance name="19559"/>
</packageinstances>
</package3d>
<package3d name="19560" urn="urn:adsk.eagle:package:14057/1" type="box" library_version="2">
<description>FUSE HOLDER
TR5 Fuse Holder Wickmann</description>
<packageinstances>
<packageinstance name="19560"/>
</packageinstances>
</package3d>
<package3d name="F456" urn="urn:adsk.eagle:package:14063/1" type="box" library_version="2">
<description>FUSE HOLDER
CS Schukat</description>
<packageinstances>
<packageinstance name="F456"/>
</packageinstances>
</package3d>
<package3d name="F457" urn="urn:adsk.eagle:package:14076/1" type="box" library_version="2">
<description>FUSE HOLDER
CS Schukat</description>
<packageinstances>
<packageinstance name="F457"/>
</packageinstances>
</package3d>
<package3d name="FUSE_HOLDER_5X20MM" urn="urn:adsk.eagle:package:14079/1" type="box" library_version="2">
<description>Fuse Holder 5x20 mm
Source: User LBR Version 2.05</description>
<packageinstances>
<packageinstance name="FUSE_HOLDER_5X20MM"/>
</packageinstances>
</package3d>
<package3d name="FUSE_HOLDER_MENTOR-1821" urn="urn:adsk.eagle:package:14077/1" type="box" library_version="2">
<description>Fuse Holder 5x20 mm Manufacturer: MENTOR Type: 1821
Distributor: Bürklin 46 G 6111
Source: User LBR Version 2.05</description>
<packageinstances>
<packageinstance name="FUSE_HOLDER_MENTOR-1821"/>
</packageinstances>
</package3d>
<package3d name="FUSE_HOLDER_SCHURTER-FAS" urn="urn:adsk.eagle:package:14080/1" type="box" library_version="2">
<description>Fuse holder 5x20 mm Manufacturer: SCHURTER Type: FAS
Distributor: Bürklin 46 G 611
Source: User LBR Version 2.05</description>
<packageinstances>
<packageinstance name="FUSE_HOLDER_SCHURTER-FAS"/>
</packageinstances>
</package3d>
<package3d name="FUSE_HOLDER_WICKMANN-19596" urn="urn:adsk.eagle:package:14078/1" type="box" library_version="2">
<description>Fuse holder 5x20 mm Manufacturer: WICKMANN Type: 19596
Distributor: Bürklin 46 G 612
Source: User LBR Version 2.05</description>
<packageinstances>
<packageinstance name="FUSE_HOLDER_WICKMANN-19596"/>
</packageinstances>
</package3d>
<package3d name="GSH15" urn="urn:adsk.eagle:package:14065/1" type="box" library_version="2">
<description>FUSE HOLDER
grid 15mm, 19649 Wickmann</description>
<packageinstances>
<packageinstance name="GSH15"/>
</packageinstances>
</package3d>
<package3d name="KS10H" urn="urn:adsk.eagle:package:14058/1" type="box" library_version="2">
<description>FUSE HOLDER
CS Schukat</description>
<packageinstances>
<packageinstance name="KS10H"/>
</packageinstances>
</package3d>
<package3d name="KS16" urn="urn:adsk.eagle:package:14060/1" type="box" library_version="2">
<description>FUSE HOLDER
CS Schukat</description>
<packageinstances>
<packageinstance name="KS16"/>
</packageinstances>
</package3d>
<package3d name="KS17" urn="urn:adsk.eagle:package:14067/1" type="box" library_version="2">
<description>FUSE HOLDER
CS Schukat</description>
<packageinstances>
<packageinstance name="KS17"/>
</packageinstances>
</package3d>
<package3d name="KS9V" urn="urn:adsk.eagle:package:14075/1" type="box" library_version="2">
<description>FUSE HOLDER
CS Schukat</description>
<packageinstances>
<packageinstance name="KS9V"/>
</packageinstances>
</package3d>
<package3d name="LITTLEFUSE" urn="urn:adsk.eagle:package:14064/1" type="box" library_version="2">
<description>LITTLEFUSE
Picofuse/slow Littelfuse</description>
<packageinstances>
<packageinstance name="LITTLEFUSE"/>
</packageinstances>
</package3d>
<package3d name="PICOFUSE" urn="urn:adsk.eagle:package:14074/1" type="box" library_version="2">
<description>PICOFUSE
Picofuse, 19275 Wickmann</description>
<packageinstances>
<packageinstance name="PICOFUSE"/>
</packageinstances>
</package3d>
<package3d name="SH22" urn="urn:adsk.eagle:package:14062/1" type="box" library_version="2">
<description>FUSE HOLDER
CS PFP30, Schukat</description>
<packageinstances>
<packageinstance name="SH22"/>
</packageinstances>
</package3d>
<package3d name="SH22,5" urn="urn:adsk.eagle:package:14059/1" type="box" library_version="2">
<description>FUSE HOLDER grid 22,5 mm, OGN0031 8201 Schurter (Buerklin)</description>
<packageinstances>
<packageinstance name="SH22,5"/>
</packageinstances>
</package3d>
<package3d name="SH22,5A" urn="urn:adsk.eagle:package:14070/1" type="box" library_version="2">
<description>FUSE HOLDER grid 22,5 mm, isolated cap OGN0031 8201 Schurter (Buerklin)</description>
<packageinstances>
<packageinstance name="SH22,5A"/>
</packageinstances>
</package3d>
<package3d name="SH25" urn="urn:adsk.eagle:package:14066/1" type="box" library_version="2">
<description>FUSE HOLDER grid 2,5 mm,  OGN0031 8211 Schurter (Buerklin)</description>
<packageinstances>
<packageinstance name="SH25"/>
</packageinstances>
</package3d>
<package3d name="SH32" urn="urn:adsk.eagle:package:14068/1" type="box" library_version="2">
<description>FUSE HOLDER 6 x 32 mm, SH contact, SHH3N Schukat / Wickmann 102071 (Buerklin)</description>
<packageinstances>
<packageinstance name="SH32"/>
</packageinstances>
</package3d>
<package3d name="SHK20L" urn="urn:adsk.eagle:package:14071/1" type="box" library_version="2">
<description>FUSE HOLDER 5 x 20 mm, SH contact, SHH1 Schukat / E1073 Buerklin</description>
<packageinstances>
<packageinstance name="SHK20L"/>
</packageinstances>
</package3d>
<package3d name="SHK20Q" urn="urn:adsk.eagle:package:14073/1" type="box" library_version="2">
<description>FUSE HOLDER 5 x 20 mm, SH contact, E1207 Buerklin 46G6061</description>
<packageinstances>
<packageinstance name="SHK20Q"/>
</packageinstances>
</package3d>
<package3d name="SHKOG" urn="urn:adsk.eagle:package:14072/1" type="box" library_version="2">
<description>FUSE HOLDER 5 x 20/6 x 32 mm, SH contact, OG 46G6083 Buerklin</description>
<packageinstances>
<packageinstance name="SHKOG"/>
</packageinstances>
</package3d>
<package3d name="TE5" urn="urn:adsk.eagle:package:14069/1" type="box" library_version="2">
<description>FUSE
Wickmann</description>
<packageinstances>
<packageinstance name="TE5"/>
</packageinstances>
</package3d>
<package3d name="TR5" urn="urn:adsk.eagle:package:14061/1" type="box" library_version="2">
<description>FUSE
Wickmann</description>
<packageinstances>
<packageinstance name="TR5"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="FUSE" urn="urn:adsk.eagle:symbol:14027/1" library_version="2">
<wire x1="-3.81" y1="-0.762" x2="3.81" y2="-0.762" width="0.254" layer="94"/>
<wire x1="3.81" y1="0.762" x2="-3.81" y2="0.762" width="0.254" layer="94"/>
<wire x1="3.81" y1="-0.762" x2="3.81" y2="0.762" width="0.254" layer="94"/>
<wire x1="-3.81" y1="0.762" x2="-3.81" y2="-0.762" width="0.254" layer="94"/>
<wire x1="-2.54" y1="0" x2="2.54" y2="0" width="0.1524" layer="94"/>
<text x="-3.81" y="1.397" size="1.778" layer="95">&gt;NAME</text>
<text x="-3.81" y="-2.921" size="1.778" layer="96">&gt;VALUE</text>
<pin name="2" x="5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
<pin name="1" x="-5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="FUSE" urn="urn:adsk.eagle:component:14105/2" prefix="F" library_version="2">
<description>&lt;b&gt;Fuse&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="FUSE" x="0" y="0"/>
</gates>
<devices>
<device name="19559" package="19559">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:14056/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="55900000001" constant="no"/>
<attribute name="OC_FARNELL" value="9516360" constant="no"/>
<attribute name="OC_NEWARK" value="02P0286" constant="no"/>
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="19560" package="19560">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:14057/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="56000001009" constant="no"/>
<attribute name="OC_FARNELL" value="1185363" constant="no"/>
<attribute name="OC_NEWARK" value="98K6125" constant="no"/>
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="F456" package="F456">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:14063/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="F457" package="F457">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:14076/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="BLANK_5X20MM" package="FUSE_HOLDER_5X20MM">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:14079/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
<attribute name="POPULARITY" value="4" constant="no"/>
</technology>
</technologies>
</device>
<device name="1821" package="FUSE_HOLDER_MENTOR-1821">
<connects>
<connect gate="G$1" pin="1" pad="A"/>
<connect gate="G$1" pin="2" pad="B"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:14077/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
<attribute name="POPULARITY" value="1" constant="no"/>
</technology>
</technologies>
</device>
<device name="FAS" package="FUSE_HOLDER_SCHURTER-FAS">
<connects>
<connect gate="G$1" pin="1" pad="A"/>
<connect gate="G$1" pin="2" pad="B"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:14080/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="0031.3501" constant="no"/>
<attribute name="OC_FARNELL" value="1214778" constant="no"/>
<attribute name="OC_NEWARK" value="98K4273" constant="no"/>
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="19596" package="FUSE_HOLDER_WICKMANN-19596">
<connects>
<connect gate="G$1" pin="1" pad="A"/>
<connect gate="G$1" pin="2" pad="B"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:14078/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="1271669" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="GSH15" package="GSH15">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:14065/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="KS10H" package="KS10H">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:14058/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="KS16" package="KS16">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:14060/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="KS17" package="KS17">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:14067/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="KS9V" package="KS9V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:14075/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="LITTLEFUSE" package="LITTLEFUSE">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:14064/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
<attribute name="POPULARITY" value="1" constant="no"/>
</technology>
</technologies>
</device>
<device name="PICOFUSE" package="PICOFUSE">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:14074/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
<attribute name="POPULARITY" value="1" constant="no"/>
</technology>
</technologies>
</device>
<device name="SH22" package="SH22">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:14062/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="SH22,5" package="SH22,5">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:14059/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
<attribute name="POPULARITY" value="8" constant="no"/>
</technology>
</technologies>
</device>
<device name="SH22,5A" package="SH22,5A">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:14070/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="SH35" package="SH25">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:14066/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="SH32" package="SH32">
<connects>
<connect gate="G$1" pin="1" pad="1A"/>
<connect gate="G$1" pin="2" pad="2A"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:14068/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="SHK20L" package="SHK20L">
<connects>
<connect gate="G$1" pin="1" pad="1A"/>
<connect gate="G$1" pin="2" pad="2A"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:14071/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
<attribute name="POPULARITY" value="2" constant="no"/>
</technology>
</technologies>
</device>
<device name="SHK20Q" package="SHK20Q">
<connects>
<connect gate="G$1" pin="1" pad="1A"/>
<connect gate="G$1" pin="2" pad="2A"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:14073/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="SHKOG" package="SHKOG">
<connects>
<connect gate="G$1" pin="1" pad="1A"/>
<connect gate="G$1" pin="2" pad="2A"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:14072/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="TE5" package="TE5">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:14069/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
<attribute name="POPULARITY" value="0" constant="no"/>
</technology>
</technologies>
</device>
<device name="TR5" package="TR5">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:14061/1"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="MF" value="" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="unknown" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
<attribute name="POPULARITY" value="1" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="SUPPLY1" library="Dal_V2" deviceset="+5V" device=""/>
<part name="GND1" library="Dal_V2" deviceset="GND" device=""/>
<part name="GND4" library="Dal_V2" deviceset="GND" device=""/>
<part name="M1" library="Dal_V2" deviceset="ESP8266_MODULE" device=""/>
<part name="GND9" library="Dal_V2" deviceset="GND" device=""/>
<part name="GND10" library="Dal_V2" deviceset="GND" device=""/>
<part name="GND11" library="Dal_V2" deviceset="GND" device=""/>
<part name="GND13" library="Dal_V2" deviceset="GND" device=""/>
<part name="R10" library="Dal_V2" deviceset="R" device="THOLE300" value="10K"/>
<part name="R11" library="Dal_V2" deviceset="R" device="THOLE300" value="3K"/>
<part name="GND14" library="Dal_V2" deviceset="GND" device=""/>
<part name="GND15" library="Dal_V2" deviceset="GND" device=""/>
<part name="PWR1" library="Dal_V2" deviceset="+3.3V" device=""/>
<part name="PWR2" library="Dal_V2" deviceset="+3.3V" device=""/>
<part name="GND2" library="Dal_V2" deviceset="GND" device=""/>
<part name="GND20" library="Dal_V2" deviceset="GND" device=""/>
<part name="SUPPLY2" library="Dal_V2" deviceset="+5V" device=""/>
<part name="J4" library="Dal_V2" deviceset="PINHDR_1X3" device="-JST" technology="XH"/>
<part name="J3" library="Dal_V2" deviceset="PINHDR_1X3" device="-JST" technology="XH"/>
<part name="J1" library="Dal_V2" deviceset="PINHDR_1X2" device="-JST" value="PINHDR_1X2-JST"/>
<part name="J2" library="Dal_V2" deviceset="PINHDR_1X2" device="-JST" value="PINHDR_1X2-JST"/>
<part name="GND5" library="Dal_V2" deviceset="GND" device=""/>
<part name="LED1" library="Dal_V2" deviceset="LED" device="TH-DIP-100" value="LEDTH-DIP-100"/>
<part name="R1" library="Dal_V2" deviceset="R" device="THOLE300" value="100"/>
<part name="T1" library="Dal_V2" deviceset="T_NPN" device=""/>
<part name="M2" library="Dal_V2" deviceset="TALAN" device=""/>
<part name="F2" library="fuse" library_urn="urn:adsk.eagle:library:233" deviceset="FUSE" device="19596" package3d_urn="urn:adsk.eagle:package:14078/1" value="FUSE"/>
<part name="S1" library="Dal_V2" deviceset="TOGGLE_SWITCH_SPST" device=""/>
<part name="T2" library="Dal_V2" deviceset="T_NPN" device="" value="2N2222"/>
<part name="P2" library="Dal_V2" deviceset="TRIMPOT" device="-SIP"/>
<part name="R3" library="Dal_V2" deviceset="R" device="THOLE300" value="10K"/>
<part name="R2" library="Dal_V2" deviceset="R" device="THOLE300" value="330"/>
<part name="LED2" library="Dal_V2" deviceset="LED" device="TH-DIP-100"/>
<part name="U4" library="Dal_V2" deviceset="LM2904" device=""/>
<part name="U1" library="Dal_V2" deviceset="VREG-3" device="-DIP" value="7805"/>
<part name="SUPPLY4" library="Dal_V2" deviceset="+5V" device=""/>
<part name="C2" library="Dal_V2" deviceset="CAP" device="200" value="1uF"/>
<part name="C4" library="Dal_V2" deviceset="CAP" device="200" value="20uF"/>
<part name="J5" library="Dal_V2" deviceset="PINHDR_1X3" device="-JST" technology="XH"/>
<part name="GND7" library="Dal_V2" deviceset="GND" device=""/>
<part name="U2" library="Dal_V2" deviceset="QUAD_ENCODER" device=""/>
<part name="SUPPLY5" library="Dal_V2" deviceset="+5V" device=""/>
<part name="GND8" library="Dal_V2" deviceset="GND" device=""/>
<part name="GND6" library="Dal_V2" deviceset="GND" device=""/>
<part name="SUPPLY6" library="Dal_V2" deviceset="+5V" device=""/>
<part name="R4" library="Dal_V2" deviceset="R" device="THOLE300" value="1K"/>
</parts>
<sheets>
<sheet>
<plain>
<text x="140.716" y="64.008" size="1.4224" layer="97" rot="R90">TO NEO 1</text>
<text x="-7.62" y="129.54" size="5.08" layer="97">BASKET TARGET UNIT</text>
<text x="-71.12" y="104.14" size="1.6764" layer="97">3S Lipo Bat
9.5 -13 Volts</text>
<text x="15.24" y="63.5" size="1.6764" layer="97">Full Scale = 3.3v for 
Input of 14 volts</text>
<text x="-35.56" y="-5.08" size="1.6764" layer="97" rot="R90">IR Detector</text>
<text x="-33.02" y="27.94" size="1.6764" layer="97" rot="R90">IR Emitter</text>
<text x="-18.288" y="39.624" size="1.6764" layer="97">Red</text>
<text x="-17.78" y="33.02" size="1.6764" layer="97">Black</text>
<text x="-30.48" y="-4.826" size="1.6764" layer="97">Long</text>
<text x="-30.48" y="3.556" size="1.6764" layer="97">Short</text>
<text x="-20.066" y="3.302" size="1.6764" layer="97">Yellow</text>
<text x="-20.574" y="-4.826" size="1.6764" layer="97">White</text>
<text x="-69.85" y="112.522" size="1.6764" layer="97" rot="R90">BATTERY
INPUT</text>
<text x="30.734" y="116.078" size="1.6764" layer="97">TO MOTOR</text>
<text x="-7.62" y="71.12" size="1.6764" layer="97">PWR IN</text>
</plain>
<instances>
<instance part="SUPPLY1" gate="+5V" x="47.244" y="7.62" smashed="yes">
<attribute name="VALUE" x="51.181" y="11.557" size="1.6764" layer="96"/>
</instance>
<instance part="GND1" gate="GND" x="43.18" y="-10.16" smashed="yes"/>
<instance part="GND4" gate="GND" x="20.32" y="-22.86" smashed="yes"/>
<instance part="M1" gate="G$1" x="88.9" y="43.18" smashed="yes">
<attribute name="NAME" x="96.52" y="46.736" size="1.6764" layer="95"/>
</instance>
<instance part="GND9" gate="GND" x="5.08" y="71.12" smashed="yes"/>
<instance part="GND10" gate="GND" x="127" y="35.56" smashed="yes"/>
<instance part="GND11" gate="GND" x="63.5" y="17.78" smashed="yes"/>
<instance part="GND13" gate="GND" x="127" y="60.96" smashed="yes"/>
<instance part="R10" gate="G$1" x="12.7" y="73.66" smashed="yes" rot="R90">
<attribute name="NAME" x="10.668" y="71.882" size="1.6764" layer="95" rot="R90"/>
<attribute name="VALUE" x="15.748" y="71.374" size="1.6764" layer="96" rot="R90"/>
</instance>
<instance part="R11" gate="G$1" x="12.7" y="60.96" smashed="yes" rot="R90">
<attribute name="NAME" x="10.668" y="59.182" size="1.6764" layer="95" rot="R90"/>
<attribute name="VALUE" x="15.748" y="58.674" size="1.6764" layer="96" rot="R90"/>
</instance>
<instance part="GND14" gate="GND" x="12.7" y="50.8" smashed="yes"/>
<instance part="GND15" gate="GND" x="63.5" y="35.56" smashed="yes"/>
<instance part="PWR1" gate="G$1" x="20.32" y="17.78" smashed="yes">
<attribute name="VALUE" x="18.415" y="20.955" size="1.6764" layer="96"/>
</instance>
<instance part="PWR2" gate="G$1" x="81.28" y="50.8" smashed="yes">
<attribute name="VALUE" x="79.375" y="53.975" size="1.6764" layer="96"/>
</instance>
<instance part="GND2" gate="GND" x="63.5" y="-12.7" smashed="yes"/>
<instance part="GND20" gate="GND" x="83.82" y="63.5" smashed="yes"/>
<instance part="SUPPLY2" gate="+5V" x="114.3" y="73.66" smashed="yes">
<attribute name="VALUE" x="112.395" y="76.835" size="1.6764" layer="96"/>
</instance>
<instance part="J4" gate="G$1" x="134.62" y="71.12" smashed="yes" rot="MR0">
<attribute name="NAME" x="136.144" y="74.676" size="1.778" layer="95" rot="MR0"/>
</instance>
<instance part="J3" gate="G$1" x="-2.54" y="81.28" smashed="yes">
<attribute name="NAME" x="-4.064" y="84.836" size="1.6764" layer="95"/>
</instance>
<instance part="J1" gate="G$1" x="-5.08" y="2.54" smashed="yes">
<attribute name="NAME" x="-7.112" y="8.128" size="1.6764" layer="95"/>
</instance>
<instance part="J2" gate="G$1" x="-5.08" y="38.1" smashed="yes">
<attribute name="NAME" x="-6.858" y="42.164" size="1.6764" layer="95"/>
</instance>
<instance part="GND5" gate="GND" x="2.54" y="-5.08" smashed="yes"/>
<instance part="LED1" gate="G$1" x="-27.94" y="33.02" smashed="yes" rot="R90"/>
<instance part="R1" gate="G$1" x="10.16" y="40.64" smashed="yes">
<attribute name="NAME" x="8.636" y="42.672" size="1.6764" layer="95"/>
<attribute name="VALUE" x="7.366" y="37.592" size="1.6764" layer="96"/>
</instance>
<instance part="T1" gate="G$1" x="-27.94" y="0" smashed="yes">
<attribute name="NAME" x="-26.924" y="-0.508" size="1.6764" layer="95"/>
</instance>
<instance part="M2" gate="G$1" x="2.54" y="119.38" smashed="yes">
<attribute name="NAME" x="7.112" y="122.682" size="1.6764" layer="95"/>
</instance>
<instance part="F2" gate="G$1" x="-43.18" y="119.38" smashed="yes">
<attribute name="NAME" x="-44.704" y="121.285" size="1.6764" layer="95"/>
<attribute name="VALUE" x="-46.228" y="116.459" size="1.6764" layer="96"/>
</instance>
<instance part="S1" gate="G$1" x="-27.94" y="116.84" smashed="yes">
<attribute name="NAME" x="-27.94" y="121.92" size="1.6764" layer="95"/>
</instance>
<instance part="T2" gate="G$1" x="20.32" y="33.02" smashed="yes" rot="MR0">
<attribute name="VALUE" x="25.4" y="27.94" size="1.6764" layer="96" rot="MR0"/>
<attribute name="NAME" x="18.542" y="32.004" size="1.6764" layer="95" rot="MR0"/>
</instance>
<instance part="P2" gate="G$1" x="20.32" y="-10.16" smashed="yes" rot="R90">
<attribute name="NAME" x="17.78" y="-12.7" size="1.4224" layer="95" rot="R90"/>
<attribute name="VALUE" x="24.13" y="-7.62" size="1.27" layer="96" rot="R90"/>
</instance>
<instance part="R3" gate="G$1" x="20.32" y="7.62" smashed="yes" rot="R90">
<attribute name="NAME" x="18.542" y="4.064" size="1.6764" layer="95" rot="R90"/>
<attribute name="VALUE" x="23.622" y="4.064" size="1.6764" layer="96" rot="R90"/>
</instance>
<instance part="R2" gate="G$1" x="55.88" y="-5.08" smashed="yes" rot="R90">
<attribute name="NAME" x="54.102" y="-8.636" size="1.6764" layer="95" rot="R90"/>
<attribute name="VALUE" x="59.182" y="-8.636" size="1.6764" layer="96" rot="R90"/>
</instance>
<instance part="LED2" gate="G$1" x="60.96" y="-10.16" smashed="yes" rot="R180">
<attribute name="NAME" x="63.5" y="-14.478" size="1.6764" layer="95" rot="R180"/>
</instance>
<instance part="U4" gate="G$1" x="43.18" y="0" smashed="yes">
<attribute name="NAME" x="45.72" y="-5.08" size="1.6764" layer="95"/>
<attribute name="VALUE" x="45.72" y="-7.62" size="1.6764" layer="96"/>
</instance>
<instance part="U1" gate="G$1" x="83.82" y="68.58" smashed="yes">
<attribute name="VALUE" x="85.852" y="79.502" size="1.6764" layer="96"/>
<attribute name="NAME" x="80.772" y="79.756" size="1.6764" layer="95"/>
</instance>
<instance part="SUPPLY4" gate="+5V" x="119.38" y="50.8" smashed="yes">
<attribute name="VALUE" x="117.475" y="53.975" size="1.6764" layer="96"/>
</instance>
<instance part="C2" gate="G$1" x="73.66" y="68.58" smashed="yes" rot="R90">
<attribute name="NAME" x="71.374" y="68.326" size="1.6764" layer="95" rot="R90"/>
<attribute name="VALUE" x="77.216" y="67.818" size="1.6764" layer="96" rot="R90"/>
</instance>
<instance part="C4" gate="G$1" x="93.98" y="68.58" smashed="yes" rot="R90">
<attribute name="NAME" x="91.948" y="68.326" size="1.6764" layer="95" rot="R90"/>
<attribute name="VALUE" x="97.536" y="66.802" size="1.6764" layer="96" rot="R90"/>
</instance>
<instance part="J5" gate="G$1" x="25.4" y="96.52" smashed="yes">
<attribute name="NAME" x="23.876" y="100.076" size="1.6764" layer="95"/>
</instance>
<instance part="GND7" gate="GND" x="35.56" y="83.82" smashed="yes"/>
<instance part="U2" gate="G$1" x="81.28" y="111.76" smashed="yes">
<attribute name="NAME" x="76.2" y="119.38" size="1.6764" layer="95"/>
<attribute name="VALUE" x="76.2" y="104.14" size="1.6764" layer="96"/>
</instance>
<instance part="SUPPLY5" gate="+5V" x="116.84" y="104.14" smashed="yes">
<attribute name="VALUE" x="114.935" y="107.315" size="1.6764" layer="96"/>
</instance>
<instance part="GND8" gate="GND" x="121.92" y="86.36" smashed="yes"/>
<instance part="GND6" gate="GND" x="7.62" y="25.4" smashed="yes"/>
<instance part="SUPPLY6" gate="+5V" x="22.86" y="48.26" smashed="yes">
<attribute name="VALUE" x="20.955" y="51.435" size="1.4224" layer="96"/>
</instance>
<instance part="R4" gate="G$1" x="35.56" y="33.02" smashed="yes">
<attribute name="NAME" x="33.782" y="35.052" size="1.6764" layer="95"/>
<attribute name="VALUE" x="33.274" y="29.972" size="1.6764" layer="96"/>
</instance>
</instances>
<busses>
</busses>
<nets>
<net name="IRE_1" class="0">
<segment>
<pinref part="M1" gate="G$1" pin="P$3"/>
<wire x1="83.82" y1="38.1" x2="71.12" y2="38.1" width="0.1524" layer="91"/>
<label x="71.628" y="38.862" size="1.6764" layer="95"/>
</segment>
<segment>
<pinref part="R4" gate="G$1" pin="2"/>
<wire x1="40.64" y1="33.02" x2="51.562" y2="32.766" width="0.1524" layer="91"/>
<label x="42.672" y="33.782" size="1.6764" layer="95"/>
</segment>
</net>
<net name="IRD_1" class="0">
<segment>
<pinref part="M1" gate="G$1" pin="P$7"/>
<wire x1="83.82" y1="27.94" x2="71.12" y2="27.94" width="0.1524" layer="91"/>
<label x="71.628" y="28.702" size="1.6764" layer="95"/>
</segment>
<segment>
<label x="54.102" y="1.778" size="1.6764" layer="95"/>
<wire x1="50.8" y1="0" x2="55.88" y2="0" width="0.1524" layer="91"/>
<pinref part="R2" gate="G$1" pin="2"/>
<wire x1="55.88" y1="0" x2="60.96" y2="0" width="0.1524" layer="91"/>
<junction x="55.88" y="0"/>
<pinref part="U4" gate="G$1" pin="OUT"/>
</segment>
</net>
<net name="+5V" class="0">
<segment>
<pinref part="SUPPLY1" gate="+5V" pin="+5V"/>
<wire x1="43.18" y1="5.08" x2="47.244" y2="5.08" width="0.1524" layer="91"/>
<pinref part="U4" gate="G$1" pin="P+"/>
</segment>
<segment>
<wire x1="129.54" y1="68.58" x2="114.3" y2="68.58" width="0.1524" layer="91"/>
<wire x1="114.3" y1="68.58" x2="106.68" y2="68.58" width="0.1524" layer="91"/>
<wire x1="106.68" y1="68.58" x2="106.68" y2="73.66" width="0.1524" layer="91"/>
<wire x1="106.68" y1="73.66" x2="93.98" y2="73.66" width="0.1524" layer="91"/>
<pinref part="SUPPLY2" gate="+5V" pin="+5V"/>
<wire x1="93.98" y1="73.66" x2="91.44" y2="73.66" width="0.1524" layer="91"/>
<wire x1="114.3" y1="71.12" x2="114.3" y2="68.58" width="0.1524" layer="91"/>
<junction x="114.3" y="68.58"/>
<pinref part="J4" gate="G$1" pin="2"/>
<pinref part="U1" gate="G$1" pin="OUT"/>
<pinref part="C4" gate="G$1" pin="2"/>
<junction x="93.98" y="73.66"/>
</segment>
<segment>
<pinref part="M1" gate="G$1" pin="P$30"/>
<wire x1="116.84" y1="43.18" x2="119.38" y2="43.18" width="0.1524" layer="91"/>
<pinref part="SUPPLY4" gate="+5V" pin="+5V"/>
<wire x1="119.38" y1="43.18" x2="119.38" y2="48.26" width="0.1524" layer="91"/>
</segment>
<segment>
<wire x1="116.84" y1="99.06" x2="116.84" y2="101.6" width="0.1524" layer="91"/>
<pinref part="SUPPLY5" gate="+5V" pin="+5V"/>
<pinref part="U2" gate="G$1" pin="5V"/>
<wire x1="88.9" y1="114.3" x2="99.06" y2="114.3" width="0.1524" layer="91"/>
<wire x1="99.06" y1="114.3" x2="99.06" y2="99.06" width="0.1524" layer="91"/>
<wire x1="99.06" y1="99.06" x2="116.84" y2="99.06" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="R1" gate="G$1" pin="2"/>
<wire x1="15.24" y1="40.64" x2="22.86" y2="40.64" width="0.1524" layer="91"/>
<wire x1="22.86" y1="40.64" x2="22.86" y2="45.72" width="0.1524" layer="91"/>
<pinref part="SUPPLY6" gate="+5V" pin="+5V"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="GND1" gate="GND" pin="GND"/>
<wire x1="43.18" y1="-5.08" x2="43.18" y2="-7.62" width="0.1524" layer="91"/>
<pinref part="U4" gate="G$1" pin="P-"/>
</segment>
<segment>
<pinref part="GND9" gate="GND" pin="GND"/>
<wire x1="5.08" y1="73.66" x2="5.08" y2="76.2" width="0.1524" layer="91"/>
<wire x1="5.08" y1="76.2" x2="2.54" y2="76.2" width="0.1524" layer="91"/>
<pinref part="J3" gate="G$1" pin="3"/>
<pinref part="J3" gate="G$1" pin="1"/>
<wire x1="2.54" y1="81.28" x2="5.08" y2="81.28" width="0.1524" layer="91"/>
<wire x1="5.08" y1="81.28" x2="5.08" y2="76.2" width="0.1524" layer="91"/>
<junction x="5.08" y="76.2"/>
</segment>
<segment>
<pinref part="M1" gate="G$1" pin="P$9"/>
<wire x1="83.82" y1="22.86" x2="63.5" y2="22.86" width="0.1524" layer="91"/>
<wire x1="63.5" y1="22.86" x2="63.5" y2="20.32" width="0.1524" layer="91"/>
<pinref part="GND11" gate="GND" pin="GND"/>
</segment>
<segment>
<wire x1="129.54" y1="66.04" x2="127" y2="66.04" width="0.1524" layer="91"/>
<wire x1="127" y1="66.04" x2="127" y2="63.5" width="0.1524" layer="91"/>
<pinref part="GND13" gate="GND" pin="GND"/>
<pinref part="J4" gate="G$1" pin="3"/>
</segment>
<segment>
<pinref part="R11" gate="G$1" pin="1"/>
<pinref part="GND14" gate="GND" pin="GND"/>
<wire x1="12.7" y1="55.88" x2="12.7" y2="53.34" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="M1" gate="G$1" pin="P$2"/>
<wire x1="83.82" y1="40.64" x2="63.5" y2="40.64" width="0.1524" layer="91"/>
<wire x1="63.5" y1="40.64" x2="63.5" y2="38.1" width="0.1524" layer="91"/>
<pinref part="GND15" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="M1" gate="G$1" pin="P$29"/>
<wire x1="116.84" y1="40.64" x2="127" y2="40.64" width="0.1524" layer="91"/>
<pinref part="GND10" gate="GND" pin="GND"/>
<wire x1="127" y1="40.64" x2="127" y2="38.1" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="GND20" gate="GND" pin="GND"/>
<wire x1="83.82" y1="66.04" x2="83.82" y2="68.58" width="0.1524" layer="91"/>
<wire x1="73.66" y1="66.04" x2="83.82" y2="66.04" width="0.1524" layer="91"/>
<junction x="83.82" y="66.04"/>
<wire x1="83.82" y1="66.04" x2="93.98" y2="66.04" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$1" pin="GND"/>
<pinref part="C2" gate="G$1" pin="1"/>
<pinref part="C4" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="GND4" gate="GND" pin="GND"/>
<wire x1="20.32" y1="-15.24" x2="20.32" y2="-20.32" width="0.1524" layer="91"/>
<pinref part="P2" gate="G$1" pin="P$1"/>
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="2"/>
<wire x1="0" y1="0" x2="2.54" y2="0" width="0.1524" layer="91"/>
<wire x1="2.54" y1="0" x2="2.54" y2="-2.54" width="0.1524" layer="91"/>
<pinref part="GND5" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="GND2" gate="GND" pin="GND"/>
<pinref part="LED2" gate="G$1" pin="CATHODE"/>
</segment>
<segment>
<pinref part="J5" gate="G$1" pin="1"/>
<wire x1="30.48" y1="96.52" x2="35.56" y2="96.52" width="0.1524" layer="91"/>
<wire x1="35.56" y1="96.52" x2="35.56" y2="86.36" width="0.1524" layer="91"/>
<pinref part="GND7" gate="GND" pin="GND"/>
</segment>
<segment>
<wire x1="121.92" y1="96.52" x2="121.92" y2="88.9" width="0.1524" layer="91"/>
<pinref part="GND8" gate="GND" pin="GND"/>
<pinref part="U2" gate="G$1" pin="GND"/>
<wire x1="88.9" y1="109.22" x2="96.52" y2="109.22" width="0.1524" layer="91"/>
<wire x1="96.52" y1="109.22" x2="96.52" y2="96.52" width="0.1524" layer="91"/>
<wire x1="121.92" y1="96.52" x2="96.52" y2="96.52" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="T2" gate="G$1" pin="EMITTER"/>
<wire x1="17.78" y1="30.48" x2="7.62" y2="30.48" width="0.1524" layer="91"/>
<wire x1="7.62" y1="30.48" x2="7.62" y2="27.94" width="0.1524" layer="91"/>
<pinref part="GND6" gate="GND" pin="GND"/>
</segment>
</net>
<net name="IRDIN_1" class="0">
<segment>
<wire x1="0" y1="2.54" x2="20.32" y2="2.54" width="0.1524" layer="91"/>
<label x="2.794" y="3.556" size="1.6764" layer="95"/>
<pinref part="J1" gate="G$1" pin="1"/>
<pinref part="R3" gate="G$1" pin="1"/>
<wire x1="20.32" y1="2.54" x2="35.56" y2="2.54" width="0.1524" layer="91"/>
<junction x="20.32" y="2.54"/>
<pinref part="U4" gate="G$1" pin="+IN"/>
</segment>
</net>
<net name="NEO_DATA_1" class="0">
<segment>
<wire x1="129.54" y1="71.12" x2="116.84" y2="71.12" width="0.1524" layer="91"/>
<label x="118.618" y="71.882" size="1.6764" layer="95"/>
<pinref part="J4" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="M1" gate="G$1" pin="P$14"/>
<wire x1="83.82" y1="10.16" x2="71.12" y2="10.16" width="0.1524" layer="91"/>
<label x="71.374" y="10.922" size="1.6764" layer="95"/>
</segment>
</net>
<net name="VIN" class="0">
<segment>
<label x="21.082" y="79.248" size="1.6764" layer="95"/>
<pinref part="R10" gate="G$1" pin="2"/>
<wire x1="2.54" y1="78.74" x2="12.7" y2="78.74" width="0.1524" layer="91"/>
<pinref part="J3" gate="G$1" pin="2"/>
<wire x1="12.7" y1="78.74" x2="25.4" y2="78.74" width="0.1524" layer="91"/>
<junction x="12.7" y="78.74"/>
</segment>
<segment>
<label x="59.182" y="74.168" size="1.4224" layer="95"/>
<wire x1="58.42" y1="73.66" x2="73.66" y2="73.66" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$1" pin="IN"/>
<pinref part="C2" gate="G$1" pin="2"/>
<wire x1="73.66" y1="73.66" x2="76.2" y2="73.66" width="0.1524" layer="91"/>
<junction x="73.66" y="73.66"/>
</segment>
</net>
<net name="BATV" class="0">
<segment>
<pinref part="M1" gate="G$1" pin="P$16"/>
<wire x1="116.84" y1="7.62" x2="124.46" y2="7.62" width="0.1524" layer="91"/>
<label x="117.348" y="8.382" size="1.6764" layer="95"/>
</segment>
<segment>
<pinref part="R10" gate="G$1" pin="1"/>
<pinref part="R11" gate="G$1" pin="2"/>
<wire x1="12.7" y1="68.58" x2="12.7" y2="66.04" width="0.1524" layer="91"/>
<wire x1="12.7" y1="68.58" x2="25.4" y2="68.58" width="0.1524" layer="91"/>
<junction x="12.7" y="68.58"/>
<label x="20.066" y="69.342" size="1.6764" layer="95"/>
</segment>
</net>
<net name="+3.3V" class="0">
<segment>
<pinref part="PWR1" gate="G$1" pin="+3.3V"/>
<wire x1="20.32" y1="15.24" x2="20.32" y2="12.7" width="0.1524" layer="91"/>
<wire x1="20.32" y1="15.24" x2="15.24" y2="15.24" width="0.1524" layer="91"/>
<junction x="20.32" y="15.24"/>
<wire x1="15.24" y1="15.24" x2="15.24" y2="-5.08" width="0.1524" layer="91"/>
<wire x1="15.24" y1="-5.08" x2="20.32" y2="-5.08" width="0.1524" layer="91"/>
<pinref part="P2" gate="G$1" pin="P$3"/>
<pinref part="R3" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="M1" gate="G$1" pin="P$1"/>
<wire x1="83.82" y1="43.18" x2="81.28" y2="43.18" width="0.1524" layer="91"/>
<pinref part="PWR2" gate="G$1" pin="+3.3V"/>
<wire x1="81.28" y1="43.18" x2="81.28" y2="48.26" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<wire x1="35.56" y1="-2.54" x2="27.94" y2="-2.54" width="0.1524" layer="91"/>
<wire x1="27.94" y1="-2.54" x2="27.94" y2="-10.16" width="0.1524" layer="91"/>
<wire x1="27.94" y1="-10.16" x2="25.4" y2="-10.16" width="0.1524" layer="91"/>
<pinref part="P2" gate="G$1" pin="P$2"/>
<pinref part="U4" gate="G$1" pin="-IN"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="LED1" gate="G$1" pin="CATHODE"/>
<wire x1="-27.94" y1="30.48" x2="-27.94" y2="27.94" width="0.1524" layer="91"/>
<wire x1="-27.94" y1="27.94" x2="-22.86" y2="27.94" width="0.1524" layer="91"/>
<wire x1="-22.86" y1="27.94" x2="-22.86" y2="35.56" width="0.1524" layer="91"/>
<wire x1="-22.86" y1="35.56" x2="-10.16" y2="35.56" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="LED1" gate="G$1" pin="ANODE"/>
<wire x1="-27.94" y1="38.1" x2="-27.94" y2="40.64" width="0.1524" layer="91"/>
<wire x1="-27.94" y1="40.64" x2="-22.86" y2="40.64" width="0.1524" layer="91"/>
<wire x1="-22.86" y1="40.64" x2="-22.86" y2="38.1" width="0.1524" layer="91"/>
<wire x1="-22.86" y1="38.1" x2="-10.16" y2="38.1" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="T1" gate="G$1" pin="COLLECTOR"/>
<wire x1="-25.4" y1="2.54" x2="-10.16" y2="2.54" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="T1" gate="G$1" pin="EMITTER"/>
<wire x1="-25.4" y1="-2.54" x2="-12.7" y2="-2.54" width="0.1524" layer="91"/>
<wire x1="-12.7" y1="-2.54" x2="-12.7" y2="0" width="0.1524" layer="91"/>
<wire x1="-12.7" y1="0" x2="-10.16" y2="0" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="R2" gate="G$1" pin="1"/>
<pinref part="LED2" gate="G$1" pin="ANODE"/>
</segment>
</net>
<net name="BAT+" class="0">
<segment>
<pinref part="F2" gate="G$1" pin="1"/>
<wire x1="-48.26" y1="119.38" x2="-68.58" y2="119.38" width="0.1524" layer="91"/>
<label x="-66.294" y="120.142" size="1.6764" layer="95"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<pinref part="F2" gate="G$1" pin="2"/>
<pinref part="S1" gate="G$1" pin="P$1"/>
<wire x1="-38.1" y1="119.38" x2="-33.02" y2="119.38" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<pinref part="S1" gate="G$1" pin="P$3"/>
<pinref part="M2" gate="G$1" pin="B+"/>
<wire x1="-22.86" y1="119.38" x2="-15.24" y2="119.38" width="0.1524" layer="91"/>
<wire x1="-15.24" y1="119.38" x2="0" y2="119.38" width="0.1524" layer="91"/>
<wire x1="-15.24" y1="119.38" x2="-15.24" y2="78.74" width="0.1524" layer="91"/>
<junction x="-15.24" y="119.38"/>
<wire x1="-15.24" y1="78.74" x2="-7.62" y2="78.74" width="0.1524" layer="91"/>
</segment>
</net>
<net name="BAT-" class="0">
<segment>
<pinref part="M2" gate="G$1" pin="B-"/>
<wire x1="0" y1="114.3" x2="0" y2="111.76" width="0.1524" layer="91"/>
<wire x1="0" y1="111.76" x2="-40.64" y2="111.76" width="0.1524" layer="91"/>
<wire x1="-40.64" y1="111.76" x2="-68.58" y2="111.76" width="0.1524" layer="91"/>
<wire x1="-40.64" y1="111.76" x2="-40.64" y2="81.28" width="0.1524" layer="91"/>
<wire x1="-40.64" y1="81.28" x2="-40.64" y2="76.2" width="0.1524" layer="91"/>
<wire x1="-40.64" y1="76.2" x2="-7.62" y2="76.2" width="0.1524" layer="91"/>
<wire x1="-40.64" y1="81.28" x2="-7.62" y2="81.28" width="0.1524" layer="91"/>
<junction x="-40.64" y="81.28"/>
<junction x="-40.64" y="111.76"/>
<label x="-65.786" y="112.522" size="1.6764" layer="95"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<pinref part="M2" gate="G$1" pin="M+"/>
<wire x1="22.86" y1="119.38" x2="43.18" y2="119.38" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<pinref part="M2" gate="G$1" pin="M-"/>
<wire x1="22.86" y1="114.3" x2="43.18" y2="114.3" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<wire x1="20.32" y1="96.52" x2="15.24" y2="96.52" width="0.1524" layer="91"/>
<pinref part="M2" gate="G$1" pin="GND"/>
<wire x1="15.24" y1="96.52" x2="15.24" y2="106.68" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<pinref part="M2" gate="G$1" pin="5V"/>
<wire x1="12.7" y1="106.68" x2="12.7" y2="93.98" width="0.1524" layer="91"/>
<wire x1="12.7" y1="93.98" x2="20.32" y2="93.98" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<pinref part="M2" gate="G$1" pin="PWM"/>
<wire x1="10.16" y1="106.68" x2="10.16" y2="91.44" width="0.1524" layer="91"/>
<wire x1="10.16" y1="91.44" x2="20.32" y2="91.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="M_PWM" class="0">
<segment>
<pinref part="J5" gate="G$1" pin="3"/>
<wire x1="30.48" y1="91.44" x2="45.72" y2="91.44" width="0.1524" layer="91"/>
<label x="37.592" y="92.71" size="1.6764" layer="95"/>
</segment>
<segment>
<pinref part="M1" gate="G$1" pin="P$13"/>
<wire x1="83.82" y1="12.7" x2="71.12" y2="12.7" width="0.1524" layer="91"/>
<label x="71.628" y="13.208" size="1.6764" layer="95"/>
</segment>
</net>
<net name="B" class="0">
<segment>
<label x="113.284" y="91.694" size="1.6764" layer="95"/>
<pinref part="U2" gate="G$1" pin="A"/>
<wire x1="73.66" y1="114.3" x2="66.04" y2="114.3" width="0.1524" layer="91"/>
<wire x1="66.04" y1="114.3" x2="66.04" y2="91.44" width="0.1524" layer="91"/>
<wire x1="66.04" y1="91.44" x2="116.84" y2="91.44" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="M1" gate="G$1" pin="P$12"/>
<wire x1="83.82" y1="15.24" x2="71.12" y2="15.24" width="0.1524" layer="91"/>
<label x="72.136" y="15.748" size="1.6764" layer="95"/>
</segment>
</net>
<net name="A" class="0">
<segment>
<label x="113.284" y="94.234" size="1.6764" layer="95"/>
<pinref part="U2" gate="G$1" pin="B"/>
<wire x1="73.66" y1="109.22" x2="71.12" y2="109.22" width="0.1524" layer="91"/>
<wire x1="71.12" y1="109.22" x2="71.12" y2="93.98" width="0.1524" layer="91"/>
<wire x1="71.12" y1="93.98" x2="116.84" y2="93.98" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="M1" gate="G$1" pin="P$11"/>
<wire x1="83.82" y1="17.78" x2="71.12" y2="17.78" width="0.1524" layer="91"/>
<label x="72.136" y="18.288" size="1.6764" layer="95"/>
</segment>
</net>
<net name="N$22" class="0">
<segment>
<pinref part="J2" gate="G$1" pin="2"/>
<pinref part="T2" gate="G$1" pin="COLLECTOR"/>
<wire x1="0" y1="35.56" x2="17.78" y2="35.56" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="J2" gate="G$1" pin="1"/>
<wire x1="0" y1="38.1" x2="2.54" y2="38.1" width="0.1524" layer="91"/>
<wire x1="2.54" y1="38.1" x2="2.54" y2="40.64" width="0.1524" layer="91"/>
<pinref part="R1" gate="G$1" pin="1"/>
<wire x1="2.54" y1="40.64" x2="5.08" y2="40.64" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$23" class="0">
<segment>
<pinref part="T2" gate="G$1" pin="BASE"/>
<wire x1="25.4" y1="33.02" x2="30.48" y2="33.02" width="0.1524" layer="91"/>
<pinref part="R4" gate="G$1" pin="1"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="6.3" minversion="6.2.2" severity="warning">
Since Version 6.2.2 text objects can contain more than one line,
which will not be processed correctly with this version.
</note>
<note version="8.2" severity="warning">
Since Version 8.2, EAGLE supports online libraries. The ids
of those online libraries will not be understood (or retained)
with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports URNs for individual library
assets (packages, symbols, and devices). The URNs of those assets
will not be understood (or retained) with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports the association of 3D packages
with devices in libraries, schematics, and board files. Those 3D
packages will not be understood (or retained) with this version.
</note>
</compatibility>
</eagle>
