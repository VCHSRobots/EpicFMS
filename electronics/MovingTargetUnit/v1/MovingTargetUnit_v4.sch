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
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
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
<package name="SO16LNB-14PIN">
<description>16-Lead SOIC Narrow Body
Taken from Fairchild Datasheet for transistor array (MMPQ3904)

Should also work for Texas Instruments, LM2902KD</description>
<smd name="P$1" x="0" y="0" dx="1.75" dy="0.65" layer="1"/>
<smd name="P$2" x="0" y="-1.27" dx="1.75" dy="0.65" layer="1"/>
<smd name="P$3" x="0" y="-2.54" dx="1.75" dy="0.65" layer="1"/>
<smd name="P$4" x="0" y="-3.81" dx="1.75" dy="0.65" layer="1"/>
<smd name="P$5" x="0" y="-5.08" dx="1.75" dy="0.65" layer="1"/>
<smd name="P$6" x="0" y="-6.35" dx="1.75" dy="0.65" layer="1"/>
<smd name="P$7" x="0" y="-7.62" dx="1.75" dy="0.65" layer="1"/>
<wire x1="1.524" y1="0" x2="1.524" y2="-7.62" width="0.1524" layer="21"/>
<wire x1="1.524" y1="-7.62" x2="4.064" y2="-7.62" width="0.1524" layer="21"/>
<wire x1="4.064" y1="-7.62" x2="4.064" y2="0" width="0.1524" layer="21"/>
<wire x1="4.064" y1="0" x2="1.524" y2="0" width="0.1524" layer="21"/>
<circle x="2.032" y="-0.508" radius="0.283978125" width="0.1524" layer="21"/>
<smd name="P$8" x="5.6" y="-7.62" dx="1.75" dy="0.65" layer="1"/>
<smd name="P$9" x="5.6" y="-6.35" dx="1.75" dy="0.65" layer="1"/>
<smd name="P$10" x="5.6" y="-5.08" dx="1.75" dy="0.65" layer="1"/>
<smd name="P$11" x="5.6" y="-3.81" dx="1.75" dy="0.65" layer="1"/>
<smd name="P$12" x="5.6" y="-2.54" dx="1.75" dy="0.65" layer="1"/>
<smd name="P$13" x="5.6" y="-1.27" dx="1.75" dy="0.65" layer="1"/>
<smd name="P$14" x="5.6" y="0" dx="1.75" dy="0.65" layer="1"/>
<text x="0" y="1.27" size="1.27" layer="21" font="vector" ratio="12">&gt;Name</text>
<text x="0" y="-10.16" size="1.27" layer="27" font="vector" ratio="12">&gt;Value</text>
</package>
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
<package name="JST-XH_098_VERT_1X6">
<description>JST Connector, XH Series, 0.098 Inch, 1x6</description>
<pad name="6" x="-12.5" y="0" drill="1"/>
<pad name="5" x="-10" y="0" drill="1"/>
<pad name="4" x="-7.5" y="0" drill="1"/>
<pad name="3" x="-5" y="0" drill="1"/>
<text x="0.9938" y="-2.4574" size="1.27" layer="51" font="vector" ratio="12">1</text>
<text x="-14.378" y="-5.334" size="1.27" layer="25" font="vector" ratio="12">&gt;NAME</text>
<pad name="2" x="-2.5" y="0" drill="1" rot="R90"/>
<pad name="1" x="0" y="0" drill="1" shape="square" rot="R90"/>
<wire x1="2.45" y1="2.5" x2="2.45" y2="-3.5" width="0.1524" layer="21"/>
<wire x1="2.45" y1="-3.5" x2="-14.95" y2="-3.5" width="0.1524" layer="21"/>
<wire x1="-14.95" y1="-3.5" x2="-14.95" y2="2.5" width="0.1524" layer="21"/>
<wire x1="-14.95" y1="2.5" x2="-13.5" y2="2.5" width="0.1524" layer="21"/>
<wire x1="-11.49" y1="2.5" x2="-1.02" y2="2.49" width="0.1524" layer="21"/>
<wire x1="2.45" y1="2.5" x2="1" y2="2.5" width="0.1524" layer="21"/>
<text x="-4.747" y="-5.308" size="1.27" layer="27" font="vector" ratio="12">&gt;VALUE</text>
</package>
<package name="PINHDR_TH_100_1X6">
<wire x1="14.1" y1="1.4" x2="-1.4" y2="1.4" width="0.1524" layer="21"/>
<wire x1="-1.4" y1="1.4" x2="-1.4" y2="-1.4" width="0.1524" layer="21"/>
<wire x1="-1.4" y1="-1.4" x2="14.1" y2="-1.4" width="0.1524" layer="21"/>
<wire x1="14.1" y1="-1.4" x2="14.1" y2="1.4" width="0.1524" layer="21"/>
<pad name="1" x="0.02" y="0" drill="1" shape="square"/>
<pad name="2" x="2.52" y="0" drill="1"/>
<text x="-1.983" y="-2.575" size="1.143" layer="25" font="vector" ratio="12" rot="R90">&gt;NAME</text>
<text x="0.6076" y="-2.5048" size="1.143" layer="51" font="vector" ratio="12" rot="R90">1</text>
<text x="15.834" y="-2.962" size="1.143" layer="27" font="vector" ratio="12" rot="R90">&gt;VALUE</text>
<pad name="3" x="5.06" y="0" drill="1"/>
<pad name="4" x="7.6" y="0" drill="1"/>
<pad name="5" x="10.14" y="0" drill="1"/>
<pad name="6" x="12.68" y="0" drill="1"/>
</package>
<package name="TERMBLOCK_TH_200_1X6">
<pad name="P$1" x="0" y="0" drill="1.6"/>
<pad name="P$2" x="5.08" y="0" drill="1.6"/>
<wire x1="-2.54" y1="-5.08" x2="-2.54" y2="5.08" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="5.08" x2="27.94" y2="5.08" width="0.1524" layer="21"/>
<wire x1="27.94" y1="5.08" x2="27.94" y2="-5.08" width="0.1524" layer="21"/>
<wire x1="27.94" y1="-5.08" x2="-2.54" y2="-5.08" width="0.1524" layer="21"/>
<text x="-1.27" y="6.35" size="1.27" layer="25" font="vector" ratio="12">&gt;Name</text>
<text x="-1.27" y="-7.62" size="1.27" layer="27" font="vector" ratio="12">&gt;Value</text>
<text x="-1.27" y="-2.54" size="1.27" layer="21" font="vector" ratio="12">1</text>
<pad name="P$3" x="10.16" y="0" drill="1.6"/>
<pad name="P$4" x="15.24" y="0" drill="1.6"/>
<pad name="P$5" x="20.32" y="0" drill="1.6"/>
<pad name="P$6" x="25.4" y="0" drill="1.6"/>
</package>
<package name="PH2_TH_SIDE_200_1X6">
<description>PHOENIX Header - 2 Pos
Mounting can be vertial or horzantial.  If Horz version is used then must leave at least .375 for plug.  Can be mounted at edge of PCM for either vert or horz version.</description>
<pad name="P$1" x="0" y="0" drill="1.4"/>
<pad name="P$2" x="5.08" y="0" drill="1.4"/>
<wire x1="-3.175" y1="-2.794" x2="-3.175" y2="7.874" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="7.874" x2="28.575" y2="7.874" width="0.1524" layer="21"/>
<wire x1="28.575" y1="7.874" x2="28.575" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="28.575" y1="-2.794" x2="-3.175" y2="-2.794" width="0.1524" layer="21"/>
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
<pad name="P$4" x="15.24" y="0" drill="1.4"/>
<pad name="PA$4" x="15.24" y="5.08" drill="1.4"/>
<wire x1="15.24" y1="5.08" x2="15.24" y2="0" width="0.3048" layer="1"/>
<pad name="P$5" x="20.32" y="0" drill="1.4"/>
<wire x1="20.32" y1="5.08" x2="20.32" y2="0" width="0.3048" layer="1"/>
<pad name="PA$5" x="20.32" y="5.08" drill="1.4"/>
<pad name="P$6" x="25.4" y="0" drill="1.4"/>
<pad name="PA$6" x="25.4" y="5.08" drill="1.4"/>
<wire x1="25.4" y1="5.08" x2="25.4" y2="0" width="0.3048" layer="1"/>
</package>
<package name="PHOENIX_TH_SIDE_200_1X6">
<description>PHOENIX Header - 2 Pos
Mounting can be vertial or horzantial.  If Horz version is used then must leave at least .375 for plug.  Can be mounted at edge of PCM for either vert or horz version.</description>
<pad name="P$1" x="0" y="0" drill="1.5"/>
<pad name="P$2" x="5.08" y="0" drill="1.5"/>
<wire x1="-3.048" y1="-9.779" x2="-3.048" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-3.048" y1="2.032" x2="28.702" y2="2.032" width="0.1524" layer="21"/>
<wire x1="28.702" y1="2.032" x2="28.702" y2="-9.779" width="0.1524" layer="21"/>
<wire x1="28.702" y1="-9.779" x2="-3.048" y2="-9.779" width="0.1524" layer="21"/>
<text x="-1.27" y="2.54" size="1.27" layer="25" font="vector" ratio="12">&gt;Name</text>
<text x="-1.27" y="-3.81" size="1.27" layer="27" font="vector" ratio="12">&gt;Value</text>
<text x="-2.54" y="-1.27" size="1.27" layer="21">1</text>
<pad name="P$3" x="10.16" y="0" drill="1.5"/>
<pad name="P$4" x="15.24" y="0" drill="1.5"/>
<pad name="P$5" x="20.32" y="0" drill="1.5"/>
<pad name="P$6" x="25.4" y="0" drill="1.5"/>
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
<package name="PINHDR_TH_100_1X4">
<pad name="1" x="-2.54" y="0" drill="1"/>
<pad name="2" x="0" y="0" drill="1"/>
<pad name="3" x="2.54" y="0" drill="1"/>
<text x="-2.43" y="-2.675" size="1.27" layer="21" ratio="12" rot="R90">1</text>
<text x="-4.44" y="-1.77" size="0.8" layer="25" ratio="15" rot="R90">&gt;NAME</text>
<wire x1="-4.054" y1="1.524" x2="6.614" y2="1.524" width="0.16" layer="21"/>
<wire x1="6.614" y1="1.524" x2="6.614" y2="-1.524" width="0.16" layer="21"/>
<wire x1="6.614" y1="-1.524" x2="-4.054" y2="-1.524" width="0.16" layer="21"/>
<wire x1="-4.054" y1="-1.524" x2="-4.054" y2="1.524" width="0.16" layer="21"/>
<text x="7.74" y="-2.33" size="0.8" layer="27" ratio="15" rot="R90">&gt;VALUE</text>
<pad name="4" x="5.08" y="0" drill="1"/>
</package>
<package name="WIRE_HARNES_4">
<pad name="1" x="0" y="0" drill="1.5875" diameter="2.54" shape="square" thermals="no"/>
<pad name="2" x="3.81" y="0" drill="1.5875" diameter="2.54" thermals="no"/>
<pad name="3" x="7.62" y="0" drill="1.5875" diameter="2.54" thermals="no"/>
<text x="0.491" y="-3.056" size="1.27" layer="51" font="vector" ratio="12" rot="R90">1</text>
<text x="-2.408" y="-1.897" size="1.143" layer="25" font="vector" ratio="12" rot="R90">&gt;NAME</text>
<wire x1="-1.641" y1="1.778" x2="13.091" y2="1.778" width="0.16" layer="21"/>
<wire x1="13.091" y1="1.778" x2="13.091" y2="-1.778" width="0.16" layer="21"/>
<wire x1="13.091" y1="-1.778" x2="-1.641" y2="-1.778" width="0.16" layer="21"/>
<wire x1="-1.641" y1="-1.778" x2="-1.641" y2="1.778" width="0.16" layer="21"/>
<text x="14.725" y="-2.838" size="1.143" layer="27" font="vector" ratio="12" rot="R90">&gt;VALUE</text>
<pad name="4" x="11.43" y="0" drill="1.5875" diameter="2.54" thermals="no"/>
</package>
<package name="TERMBLOCK_TH_200_1X4">
<pad name="P$1" x="0" y="0" drill="1.6"/>
<pad name="P$2" x="5.08" y="0" drill="1.6"/>
<wire x1="-2.54" y1="-5.08" x2="-2.54" y2="5.08" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="5.08" x2="17.78" y2="5.08" width="0.1524" layer="21"/>
<wire x1="17.78" y1="5.08" x2="17.78" y2="-5.08" width="0.1524" layer="21"/>
<wire x1="17.78" y1="-5.08" x2="-2.54" y2="-5.08" width="0.1524" layer="21"/>
<text x="-1.27" y="6.35" size="1.27" layer="25" font="vector" ratio="12">&gt;Name</text>
<text x="-1.27" y="-7.62" size="1.27" layer="27" font="vector" ratio="12">&gt;Value</text>
<text x="-1.27" y="-2.54" size="1.27" layer="21">1</text>
<pad name="P$3" x="10.16" y="0" drill="1.6"/>
<pad name="P$4" x="15.24" y="0" drill="1.6"/>
</package>
<package name="PH2_TH_SIDE_200_1X4">
<description>PHOENIX Header - 2 Pos
Mounting can be vertial or horzantial.  If Horz version is used then must leave at least .375 for plug.  Can be mounted at edge of PCM for either vert or horz version.</description>
<pad name="P$1" x="0" y="0" drill="1.4"/>
<pad name="P$2" x="5.08" y="0" drill="1.4"/>
<wire x1="-3.175" y1="-2.794" x2="-3.175" y2="7.874" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="7.874" x2="18.415" y2="7.874" width="0.1524" layer="21"/>
<wire x1="18.415" y1="7.874" x2="18.415" y2="-2.794" width="0.1524" layer="21"/>
<wire x1="18.415" y1="-2.794" x2="-3.175" y2="-2.794" width="0.1524" layer="21"/>
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
<pad name="P$4" x="15.24" y="0" drill="1.4"/>
<pad name="PA$4" x="15.24" y="5.08" drill="1.4"/>
<wire x1="15.24" y1="5.08" x2="15.24" y2="0" width="0.3048" layer="1"/>
</package>
<package name="PHOENIX_TH_SIDE_200_1X4">
<description>PHOENIX Header - 2 Pos
Mounting can be vertial or horzantial.  If Horz version is used then must leave at least .375 for plug.  Can be mounted at edge of PCM for either vert or horz version.</description>
<pad name="P$1" x="0" y="0" drill="1.5"/>
<pad name="P$2" x="5.08" y="0" drill="1.5"/>
<wire x1="-3.048" y1="-9.779" x2="-3.048" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-3.048" y1="2.032" x2="18.542" y2="2.032" width="0.1524" layer="21"/>
<wire x1="18.542" y1="2.032" x2="18.542" y2="-9.779" width="0.1524" layer="21"/>
<wire x1="18.542" y1="-9.779" x2="-3.048" y2="-9.779" width="0.1524" layer="21"/>
<text x="-1.27" y="2.54" size="1.27" layer="25" font="vector" ratio="12">&gt;Name</text>
<text x="-1.27" y="-3.81" size="1.27" layer="27" font="vector" ratio="12">&gt;Value</text>
<text x="-2.54" y="-1.27" size="1.27" layer="21">1</text>
<pad name="P$3" x="10.16" y="0" drill="1.5"/>
<pad name="P$4" x="15.24" y="0" drill="1.5"/>
</package>
<package name="JST-XH_098_VERT_1X4">
<description>JST Connector, XH Series, 0.098 Inch, 1x6</description>
<pad name="4" x="-7.5" y="0" drill="1"/>
<pad name="3" x="-5" y="0" drill="1"/>
<text x="0.9938" y="-2.4574" size="1.27" layer="51" font="vector" ratio="12">1</text>
<text x="-10.668" y="-3.329" size="1.27" layer="25" font="vector" ratio="12" rot="R90">&gt;NAME</text>
<pad name="2" x="-2.5" y="0" drill="1" rot="R90"/>
<pad name="1" x="0" y="0" drill="1" shape="square" rot="R90"/>
<wire x1="2.45" y1="2.5" x2="2.45" y2="-3.5" width="0.1524" layer="21"/>
<wire x1="2.45" y1="-3.5" x2="-9.87" y2="-3.5" width="0.1524" layer="21"/>
<wire x1="-9.87" y1="-3.5" x2="-9.87" y2="2.5" width="0.1524" layer="21"/>
<wire x1="-9.87" y1="2.5" x2="-8.42" y2="2.5" width="0.1524" layer="21"/>
<wire x1="-6.41" y1="2.5" x2="-1.02" y2="2.49" width="0.1524" layer="21"/>
<wire x1="2.45" y1="2.5" x2="1" y2="2.5" width="0.1524" layer="21"/>
<text x="-7.287" y="-5.181" size="1.27" layer="27" font="vector" ratio="12">&gt;VALUE</text>
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
<package name="TO252-3-HS">
<description>&lt;b&gt;SMALL OUTLINE TRANSISTOR&lt;/b&gt;&lt;p&gt;
TS-003 T0252, TO252-3 
DPAK Recommended footport from ST
With Solder On Heat Sink from AAVID PN: 573100D00010G</description>
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
<text x="-2.54" y="6.35" size="1.27" layer="25" font="vector" ratio="12">&gt;NAME</text>
<text x="8.89" y="-0.635" size="1.27" layer="27" font="vector" ratio="12" rot="R90">&gt;VALUE</text>
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
<rectangle x1="-6.985" y1="-1.27" x2="6.985" y2="8.382" layer="1"/>
<rectangle x1="-6.731" y1="-0.889" x2="-5.207" y2="8.128" layer="29"/>
<rectangle x1="5.207" y1="-0.889" x2="6.731" y2="8.128" layer="29"/>
<rectangle x1="-6.604" y1="-0.762" x2="-5.334" y2="8.001" layer="31"/>
<rectangle x1="5.334" y1="-0.762" x2="6.604" y2="8.001" layer="31"/>
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
<text x="1.27" y="-0.254" size="1.27" layer="94">3v3</text>
<text x="1.27" y="-2.794" size="1.27" layer="94">GND</text>
<text x="1.27" y="-5.334" size="1.27" layer="94">D10-G1/Tx</text>
<text x="1.27" y="-7.874" size="1.27" layer="94">D9-G3/Rx</text>
<text x="1.27" y="-10.414" size="1.27" layer="94">D8-G15</text>
<text x="1.27" y="-12.954" size="1.27" layer="94">D7-G13</text>
<text x="1.27" y="-15.494" size="1.27" layer="94">D6-G12</text>
<text x="1.27" y="-18.034" size="1.27" layer="94">D5-G14</text>
<text x="1.27" y="-20.574" size="1.27" layer="94">GND</text>
<text x="1.27" y="-23.114" size="1.27" layer="94">3V3</text>
<text x="1.27" y="-25.654" size="1.27" layer="94">D4-G2</text>
<text x="1.27" y="-28.194" size="1.27" layer="94">D3-G0</text>
<text x="1.27" y="-30.734" size="1.27" layer="94">D2-G4</text>
<text x="1.27" y="-33.274" size="1.27" layer="94">D1-G5</text>
<text x="1.27" y="-35.814" size="1.27" layer="94">D0-G16</text>
<text x="21.59" y="-34.798" size="1.27" layer="94" rot="R180">A0</text>
<text x="21.59" y="-32.258" size="1.27" layer="94" rot="R180">RSV</text>
<text x="21.59" y="-29.718" size="1.27" layer="94" rot="R180">RSV</text>
<text x="21.59" y="-27.432" size="1.27" layer="94" rot="R180">SD3-G10</text>
<text x="21.59" y="-24.638" size="1.27" layer="94" rot="R180">SD2-G9</text>
<text x="21.59" y="-22.098" size="1.27" layer="94" rot="R180">MOSI</text>
<text x="21.59" y="-19.558" size="1.27" layer="94" rot="R180">CS</text>
<text x="21.59" y="-17.018" size="1.27" layer="94" rot="R180">MISO</text>
<text x="21.59" y="-14.478" size="1.27" layer="94" rot="R180">SCLK</text>
<text x="21.59" y="-11.938" size="1.27" layer="94" rot="R180">GND</text>
<text x="21.59" y="-9.398" size="1.27" layer="94" rot="R180">3V3</text>
<text x="21.59" y="-6.858" size="1.27" layer="94" rot="R180">EN</text>
<text x="21.59" y="-4.318" size="1.27" layer="94" rot="R180">RST</text>
<text x="21.59" y="-1.524" size="1.27" layer="94" rot="R180">GND</text>
<text x="21.59" y="0.762" size="1.27" layer="94" rot="R180">VIN</text>
<text x="13.716" y="-14.732" size="1.6764" layer="94" rot="R90">ESP8266</text>
<wire x1="0" y1="2.54" x2="22.86" y2="2.54" width="0.254" layer="94"/>
<wire x1="22.86" y1="2.54" x2="22.86" y2="-38.1" width="0.254" layer="94"/>
<wire x1="22.86" y1="-38.1" x2="0" y2="-38.1" width="0.254" layer="94"/>
<wire x1="0" y1="-38.1" x2="0" y2="2.54" width="0.254" layer="94"/>
<text x="7.62" y="3.556" size="1.6764" layer="95">&gt;NAME</text>
<text x="6.858" y="-40.894" size="1.6764" layer="96">&gt;VALUE</text>
<wire x1="7.62" y1="-28.448" x2="7.62" y2="-26.67" width="0.254" layer="94"/>
<wire x1="7.112" y1="-27.686" x2="7.62" y2="-26.67" width="0.254" layer="94"/>
<wire x1="8.128" y1="-27.686" x2="7.62" y2="-26.67" width="0.254" layer="94"/>
<wire x1="7.62" y1="-24.13" x2="7.62" y2="-25.908" width="0.254" layer="94"/>
<wire x1="7.62" y1="-24.13" x2="8.128" y2="-25.146" width="0.254" layer="94"/>
<wire x1="8.636" y1="-9.398" x2="8.636" y2="-10.922" width="0.254" layer="94"/>
<wire x1="8.636" y1="-10.922" x2="9.144" y2="-10.16" width="0.254" layer="94"/>
<wire x1="8.636" y1="-10.922" x2="8.128" y2="-10.16" width="0.254" layer="94"/>
<wire x1="7.62" y1="-24.13" x2="7.112" y2="-25.146" width="0.254" layer="94"/>
<text x="8.128" y="-35.814" size="1.27" layer="94">(Wake)</text>
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
<symbol name="PINHDR_1X6">
<wire x1="2.54" y1="5.08" x2="0.762" y2="5.08" width="0.254" layer="94"/>
<wire x1="2.54" y1="2.54" x2="0.762" y2="2.54" width="0.254" layer="94"/>
<wire x1="2.54" y1="0" x2="0.762" y2="0" width="0.254" layer="94"/>
<wire x1="2.54" y1="-2.54" x2="0.762" y2="-2.54" width="0.254" layer="94"/>
<wire x1="2.54" y1="7.62" x2="-3.175" y2="7.62" width="0.254" layer="94"/>
<wire x1="-3.175" y1="7.62" x2="-3.175" y2="-10.16" width="0.254" layer="94"/>
<wire x1="-3.175" y1="-10.16" x2="2.54" y2="-10.16" width="0.254" layer="94"/>
<wire x1="2.54" y1="-10.16" x2="2.54" y2="-7.62" width="0.254" layer="94"/>
<circle x="0" y="5.08" radius="0.762" width="0.254" layer="94"/>
<circle x="0" y="2.54" radius="0.762" width="0.254" layer="94"/>
<circle x="0" y="0" radius="0.762" width="0.254" layer="94"/>
<circle x="0" y="-2.54" radius="0.762" width="0.254" layer="94"/>
<text x="-3.556" y="8.128" size="1.778" layer="95">&gt;NAME</text>
<pin name="1" x="5.08" y="5.08" visible="off" length="short" direction="pas" rot="R180"/>
<pin name="2" x="5.08" y="2.54" visible="off" length="short" direction="pas" rot="R180"/>
<pin name="3" x="5.08" y="0" visible="off" length="short" direction="pas" rot="R180"/>
<pin name="4" x="5.08" y="-2.54" visible="off" length="short" direction="pas" rot="R180"/>
<pin name="5" x="5.08" y="-5.08" visible="off" length="short" direction="pas" rot="R180"/>
<pin name="6" x="5.08" y="-7.62" visible="off" length="short" direction="pas" rot="R180"/>
<circle x="0" y="-5.08" radius="0.762" width="0.254" layer="94"/>
<circle x="0" y="-7.62" radius="0.762" width="0.254" layer="94"/>
<wire x1="2.54" y1="-7.62" x2="2.54" y2="-5.08" width="0.254" layer="94"/>
<wire x1="2.54" y1="-5.08" x2="2.54" y2="7.62" width="0.254" layer="94"/>
<wire x1="2.54" y1="-5.08" x2="0.762" y2="-5.08" width="0.254" layer="94"/>
<wire x1="2.54" y1="-7.62" x2="0.762" y2="-7.62" width="0.254" layer="94"/>
<text x="-2.54" y="4.445" size="1.27" layer="94">1</text>
<text x="-2.54" y="1.905" size="1.27" layer="94">2</text>
<text x="-2.54" y="-0.635" size="1.27" layer="94">3</text>
<text x="-2.54" y="-3.175" size="1.27" layer="94">4</text>
<text x="-2.54" y="-5.715" size="1.27" layer="94">5</text>
<text x="-2.54" y="-8.255" size="1.27" layer="94">6</text>
<text x="-4.064" y="-12.446" size="1.778" layer="96">&gt;VALUE</text>
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
<symbol name="PINHDR_1X4">
<wire x1="2.54" y1="0" x2="0.762" y2="0" width="0.254" layer="94"/>
<wire x1="2.54" y1="-2.54" x2="0.762" y2="-2.54" width="0.254" layer="94"/>
<wire x1="2.54" y1="-5.08" x2="0.762" y2="-5.08" width="0.254" layer="94"/>
<wire x1="2.54" y1="2.54" x2="-3.175" y2="2.54" width="0.254" layer="94"/>
<wire x1="-3.175" y1="2.54" x2="-3.175" y2="-10.16" width="0.254" layer="94"/>
<wire x1="-3.175" y1="-10.16" x2="2.54" y2="-10.16" width="0.254" layer="94"/>
<wire x1="2.54" y1="-10.16" x2="2.54" y2="-7.62" width="0.254" layer="94"/>
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
<text x="-4.572" y="-12.446" size="1.778" layer="96">&gt;VALUE</text>
<pin name="4" x="5.08" y="-7.62" visible="off" length="short" direction="pas" rot="R180"/>
<circle x="0" y="-7.62" radius="0.762" width="0.254" layer="94"/>
<wire x1="2.54" y1="-7.62" x2="2.54" y2="2.54" width="0.254" layer="94"/>
<wire x1="2.54" y1="-7.62" x2="0.762" y2="-7.62" width="0.254" layer="94"/>
<text x="-2.54" y="-8.255" size="1.27" layer="94">4</text>
</symbol>
<symbol name="BUFFER_PWR">
<wire x1="0" y1="5.08" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="2.54" y2="1.27" width="0.254" layer="94"/>
<wire x1="2.54" y1="1.27" x2="5.08" y2="2.54" width="0.254" layer="94"/>
<wire x1="5.08" y1="2.54" x2="2.54" y2="3.81" width="0.254" layer="94"/>
<pin name="IN" x="-2.54" y="2.54" visible="off" length="short" direction="pas"/>
<pin name="OUT" x="7.62" y="2.54" visible="off" length="short" direction="pas" rot="R180"/>
<pin name="VCC" x="2.54" y="7.62" visible="off" length="short" direction="pas" rot="R270"/>
<pin name="GND" x="2.54" y="-2.54" visible="off" length="short" direction="pas" rot="R90"/>
<text x="5.08" y="5.08" size="1.6764" layer="95" font="vector" ratio="12">&gt;NAME</text>
<text x="5.08" y="-2.54" size="1.6764" layer="96" font="vector" ratio="12">&gt;VALUE</text>
<pin name="OE" x="-2.54" y="-2.54" visible="off" length="short" direction="pas"/>
<circle x="1.27" y="0.254" radius="0.254" width="0.254" layer="94"/>
<wire x1="2.54" y1="3.81" x2="0" y2="5.08" width="0.254" layer="94"/>
<wire x1="0" y1="-2.54" x2="1.27" y2="-2.54" width="0.254" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="2.54" y1="0" x2="2.54" y2="1.27" width="0.254" layer="94"/>
<wire x1="2.54" y1="5.08" x2="2.54" y2="3.81" width="0.254" layer="94"/>
</symbol>
<symbol name="BUFFER">
<wire x1="0" y1="5.08" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="5.08" y2="2.54" width="0.254" layer="94"/>
<wire x1="5.08" y1="2.54" x2="0" y2="5.08" width="0.254" layer="94"/>
<pin name="IN" x="-2.54" y="2.54" visible="off" length="short" direction="pas"/>
<pin name="OUT" x="7.62" y="2.54" visible="off" length="short" direction="pas" rot="R180"/>
<text x="2.54" y="5.08" size="1.6764" layer="95" font="vector" ratio="12">&gt;NAME</text>
<text x="2.54" y="-2.54" size="1.6764" layer="96" font="vector" ratio="12">&gt;VALUE</text>
<pin name="OE" x="-2.54" y="-2.54" visible="off" length="short" direction="pas"/>
<circle x="1.524" y="0.254" radius="0.359209375" width="0.254" layer="94"/>
<wire x1="1.524" y1="-2.54" x2="0" y2="-2.54" width="0.254" layer="94"/>
<wire x1="1.524" y1="-2.54" x2="1.524" y2="-0.254" width="0.254" layer="94"/>
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
<deviceset name="LM2902" prefix="U" uservalue="yes">
<description>Texas Instruments, LM2902KD</description>
<gates>
<gate name="G$2" symbol="OPAMP" x="0" y="5.08"/>
<gate name="G$3" symbol="OPAMP" x="0" y="-7.62"/>
<gate name="G$4" symbol="OPAMP" x="0" y="-20.32"/>
<gate name="G$1" symbol="OPAMP_PWR" x="0" y="22.86"/>
</gates>
<devices>
<device name="" package="SO16LNB-14PIN">
<connects>
<connect gate="G$1" pin="+IN" pad="P$3"/>
<connect gate="G$1" pin="-IN" pad="P$2"/>
<connect gate="G$1" pin="OUT" pad="P$1"/>
<connect gate="G$1" pin="P+" pad="P$4"/>
<connect gate="G$1" pin="P-" pad="P$11"/>
<connect gate="G$2" pin="+IN" pad="P$5"/>
<connect gate="G$2" pin="-IN" pad="P$6"/>
<connect gate="G$2" pin="OUT" pad="P$7"/>
<connect gate="G$3" pin="+IN" pad="P$10"/>
<connect gate="G$3" pin="-IN" pad="P$9"/>
<connect gate="G$3" pin="OUT" pad="P$8"/>
<connect gate="G$4" pin="+IN" pad="P$12"/>
<connect gate="G$4" pin="-IN" pad="P$13"/>
<connect gate="G$4" pin="OUT" pad="P$14"/>
</connects>
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
<device name="-HS" package="TO252-3-HS">
<connects>
<connect gate="G$1" pin="GND" pad="FIN"/>
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
<deviceset name="PINHDR_1X6" prefix="J">
<gates>
<gate name="G$1" symbol="PINHDR_1X6" x="0" y="-5.08"/>
</gates>
<devices>
<device name="-JST" package="JST-XH_098_VERT_1X6">
<connects>
<connect gate="G$1" pin="1" pad="6"/>
<connect gate="G$1" pin="2" pad="5"/>
<connect gate="G$1" pin="3" pad="4"/>
<connect gate="G$1" pin="4" pad="3"/>
<connect gate="G$1" pin="5" pad="2"/>
<connect gate="G$1" pin="6" pad="1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-100" package="PINHDR_TH_100_1X6">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-200" package="TERMBLOCK_TH_200_1X6">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
<connect gate="G$1" pin="3" pad="P$3"/>
<connect gate="G$1" pin="4" pad="P$4"/>
<connect gate="G$1" pin="5" pad="P$5"/>
<connect gate="G$1" pin="6" pad="P$6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-PH2" package="PH2_TH_SIDE_200_1X6">
<connects>
<connect gate="G$1" pin="1" pad="P$1 PA$1"/>
<connect gate="G$1" pin="2" pad="P$2 PA$2"/>
<connect gate="G$1" pin="3" pad="P$3 PA$3"/>
<connect gate="G$1" pin="4" pad="P$4 PA$4"/>
<connect gate="G$1" pin="5" pad="P$5 PA$5"/>
<connect gate="G$1" pin="6" pad="P$6 PA$6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-PH1" package="PHOENIX_TH_SIDE_200_1X6">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
<connect gate="G$1" pin="3" pad="P$3"/>
<connect gate="G$1" pin="4" pad="P$4"/>
<connect gate="G$1" pin="5" pad="P$5"/>
<connect gate="G$1" pin="6" pad="P$6"/>
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
<deviceset name="PINHDR_1X4" prefix="J">
<gates>
<gate name="G$1" symbol="PINHDR_1X4" x="0" y="2.54"/>
</gates>
<devices>
<device name="TH_VERT_100" package="PINHDR_TH_100_1X4">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="18AWG_WIRE" package="WIRE_HARNES_4">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-200" package="TERMBLOCK_TH_200_1X4">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
<connect gate="G$1" pin="3" pad="P$3"/>
<connect gate="G$1" pin="4" pad="P$4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-PH2" package="PH2_TH_SIDE_200_1X4">
<connects>
<connect gate="G$1" pin="1" pad="P$1 PA$1"/>
<connect gate="G$1" pin="2" pad="P$2 PA$2"/>
<connect gate="G$1" pin="3" pad="P$3 PA$3"/>
<connect gate="G$1" pin="4" pad="P$4 PA$4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-PH1" package="PHOENIX_TH_SIDE_200_1X4">
<connects>
<connect gate="G$1" pin="1" pad="P$1"/>
<connect gate="G$1" pin="2" pad="P$2"/>
<connect gate="G$1" pin="3" pad="P$3"/>
<connect gate="G$1" pin="4" pad="P$4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-JST" package="JST-XH_098_VERT_1X4">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="74ABT125" prefix="U">
<gates>
<gate name="G$1" symbol="BUFFER_PWR" x="-2.54" y="-2.54"/>
<gate name="G$2" symbol="BUFFER" x="-2.54" y="-17.78"/>
<gate name="G$3" symbol="BUFFER" x="-2.54" y="-30.48"/>
<gate name="G$4" symbol="BUFFER" x="-2.54" y="-45.72"/>
</gates>
<devices>
<device name="-D" package="SO16LNB-14PIN">
<connects>
<connect gate="G$1" pin="GND" pad="P$7"/>
<connect gate="G$1" pin="IN" pad="P$2"/>
<connect gate="G$1" pin="OE" pad="P$1"/>
<connect gate="G$1" pin="OUT" pad="P$3"/>
<connect gate="G$1" pin="VCC" pad="P$14"/>
<connect gate="G$2" pin="IN" pad="P$5"/>
<connect gate="G$2" pin="OE" pad="P$4"/>
<connect gate="G$2" pin="OUT" pad="P$6"/>
<connect gate="G$3" pin="IN" pad="P$9"/>
<connect gate="G$3" pin="OE" pad="P$10"/>
<connect gate="G$3" pin="OUT" pad="P$8"/>
<connect gate="G$4" pin="IN" pad="P$12"/>
<connect gate="G$4" pin="OE" pad="P$13"/>
<connect gate="G$4" pin="OUT" pad="P$11"/>
</connects>
<technologies>
<technology name=""/>
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
<part name="U1" library="Dal_V2" deviceset="LM2902" device="" value="LM2902"/>
<part name="R2" library="Dal_V2" deviceset="R" device="1206(3216METRIC)" value="10K"/>
<part name="R3" library="Dal_V2" deviceset="R" device="1206(3216METRIC)" value="10K"/>
<part name="R4" library="Dal_V2" deviceset="R" device="1206(3216METRIC)" value="10K"/>
<part name="R5" library="Dal_V2" deviceset="R" device="1206(3216METRIC)" value="10K"/>
<part name="GND4" library="Dal_V2" deviceset="GND" device=""/>
<part name="GND8" library="Dal_V2" deviceset="GND" device=""/>
<part name="M1" library="Dal_V2" deviceset="ESP8266_MODULE" device=""/>
<part name="GND9" library="Dal_V2" deviceset="GND" device=""/>
<part name="GND10" library="Dal_V2" deviceset="GND" device=""/>
<part name="GND11" library="Dal_V2" deviceset="GND" device=""/>
<part name="GND13" library="Dal_V2" deviceset="GND" device=""/>
<part name="R10" library="Dal_V2" deviceset="R" device="1206(3216METRIC)" value="3K"/>
<part name="R11" library="Dal_V2" deviceset="R" device="1206(3216METRIC)" value="2K"/>
<part name="GND14" library="Dal_V2" deviceset="GND" device=""/>
<part name="GND15" library="Dal_V2" deviceset="GND" device=""/>
<part name="GND17" library="Dal_V2" deviceset="GND" device=""/>
<part name="PWR1" library="Dal_V2" deviceset="+3.3V" device=""/>
<part name="PWR2" library="Dal_V2" deviceset="+3.3V" device=""/>
<part name="LED5" library="Dal_V2" deviceset="LED" device="1206"/>
<part name="LED4" library="Dal_V2" deviceset="LED" device="1206"/>
<part name="LED3" library="Dal_V2" deviceset="LED" device="1206"/>
<part name="LED2" library="Dal_V2" deviceset="LED" device="1206"/>
<part name="R9" library="Dal_V2" deviceset="R" device="1206(3216METRIC)" value="330"/>
<part name="R8" library="Dal_V2" deviceset="R" device="1206(3216METRIC)" value="330"/>
<part name="R7" library="Dal_V2" deviceset="R" device="1206(3216METRIC)" value="330"/>
<part name="R6" library="Dal_V2" deviceset="R" device="1206(3216METRIC)" value="330"/>
<part name="GND2" library="Dal_V2" deviceset="GND" device=""/>
<part name="GND12" library="Dal_V2" deviceset="GND" device=""/>
<part name="GND18" library="Dal_V2" deviceset="GND" device=""/>
<part name="GND19" library="Dal_V2" deviceset="GND" device=""/>
<part name="U2" library="Dal_V2" deviceset="VREG-3" device="L7805CDT"/>
<part name="U3" library="Dal_V2" deviceset="VREG-3" device="L7805CDT"/>
<part name="GND20" library="Dal_V2" deviceset="GND" device=""/>
<part name="GND21" library="Dal_V2" deviceset="GND" device=""/>
<part name="SUPPLY2" library="Dal_V2" deviceset="+5V" device=""/>
<part name="C1" library="Dal_V2" deviceset="CAP" device="1206" value="1uf"/>
<part name="C2" library="Dal_V2" deviceset="CAP" device="1206" value="1uf"/>
<part name="C3" library="Dal_V2" deviceset="CAP" device="1206" value="100uf"/>
<part name="C4" library="Dal_V2" deviceset="CAP" device="1206" value="100uf"/>
<part name="SUPPLY3" library="Dal_V2" deviceset="+5V" device=""/>
<part name="GND3" library="Dal_V2" deviceset="GND" device=""/>
<part name="GND7" library="Dal_V2" deviceset="GND" device=""/>
<part name="R12" library="Dal_V2" deviceset="R" device="1206(3216METRIC)" value="10K"/>
<part name="R13" library="Dal_V2" deviceset="R" device="1206(3216METRIC)" value="10K"/>
<part name="PWR3" library="Dal_V2" deviceset="+3.3V" device=""/>
<part name="J1" library="Dal_V2" deviceset="PINHDR_1X6" device="-JST"/>
<part name="J2" library="Dal_V2" deviceset="PINHDR_1X6" device="-JST"/>
<part name="J4" library="Dal_V2" deviceset="PINHDR_1X3" device="-JST" technology="XH"/>
<part name="J5" library="Dal_V2" deviceset="PINHDR_1X3" device="-JST" technology="XH"/>
<part name="J6" library="Dal_V2" deviceset="PINHDR_1X4" device="-JST"/>
<part name="J3" library="Dal_V2" deviceset="PINHDR_1X3" device="-JST" technology="XH"/>
<part name="J7" library="Dal_V2" deviceset="PINHDR_1X6" device="-JST"/>
<part name="GND16" library="Dal_V2" deviceset="GND" device=""/>
<part name="U4" library="Dal_V2" deviceset="74ABT125" device="-D"/>
<part name="P1" library="Dal_V2" deviceset="TRIMPOT" device="-SM" value="10K"/>
<part name="R14" library="Dal_V2" deviceset="R" device="1206(3216METRIC)" value="100"/>
<part name="R15" library="Dal_V2" deviceset="R" device="1206(3216METRIC)" value="100"/>
<part name="R16" library="Dal_V2" deviceset="R" device="1206(3216METRIC)" value="100"/>
<part name="R17" library="Dal_V2" deviceset="R" device="1206(3216METRIC)" value="100"/>
</parts>
<sheets>
<sheet>
<plain>
<text x="111.252" y="103.124" size="1.4224" layer="97">TO NEO 1</text>
<text x="48.26" y="116.84" size="5.08" layer="97">MOVING TARGET UNIT, V4</text>
<text x="111.506" y="86.106" size="1.4224" layer="97">TO NEO 2</text>
<text x="60.96" y="5.08" size="1.6764" layer="97">2S Lipo Bat
6.0-7.8 Volts</text>
<text x="86.36" y="0" size="1.4224" layer="97">Full Scale = 3.3v for 
Input of 8.25 volts</text>
<text x="163.576" y="84.074" size="1.6764" layer="97" rot="R90">Top Controls</text>
<text x="135.636" y="0.254" size="1.6764" layer="97" rot="R90">SPI Interface</text>
<text x="-30.48" y="55.88" size="1.778" layer="97" rot="R90">IR Detectors</text>
<text x="-30.48" y="30.48" size="1.778" layer="97" rot="R90">IR Emitters</text>
</plain>
<instances>
<instance part="SUPPLY1" gate="+5V" x="32.004" y="22.86" smashed="yes">
<attribute name="VALUE" x="25.781" y="21.717" size="1.778" layer="96"/>
</instance>
<instance part="GND1" gate="GND" x="27.94" y="5.08" smashed="yes"/>
<instance part="U1" gate="G$2" x="27.94" y="73.66" smashed="yes">
<attribute name="NAME" x="24.638" y="67.056" size="1.778" layer="95"/>
<attribute name="VALUE" x="22.352" y="80.264" size="1.778" layer="96"/>
</instance>
<instance part="U1" gate="G$3" x="27.94" y="35.56" smashed="yes">
<attribute name="NAME" x="25.146" y="29.21" size="1.778" layer="95"/>
<attribute name="VALUE" x="30.48" y="27.94" size="1.778" layer="96"/>
</instance>
<instance part="U1" gate="G$4" x="27.94" y="55.88" smashed="yes">
<attribute name="NAME" x="23.876" y="49.53" size="1.778" layer="95"/>
<attribute name="VALUE" x="30.48" y="48.26" size="1.778" layer="96"/>
</instance>
<instance part="U1" gate="G$1" x="27.94" y="15.24" smashed="yes">
<attribute name="NAME" x="28.448" y="10.16" size="1.778" layer="95"/>
<attribute name="VALUE" x="30.48" y="7.62" size="1.778" layer="96"/>
</instance>
<instance part="R2" gate="G$1" x="10.16" y="81.28" smashed="yes" rot="R90">
<attribute name="NAME" x="8.382" y="79.756" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="12.954" y="78.994" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="R3" gate="G$1" x="10.16" y="63.5" smashed="yes" rot="R90">
<attribute name="NAME" x="8.382" y="61.214" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="12.954" y="60.706" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="R4" gate="G$1" x="10.16" y="43.18" smashed="yes" rot="R90">
<attribute name="NAME" x="8.382" y="41.402" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="12.954" y="40.64" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="R5" gate="G$1" x="10.16" y="22.86" smashed="yes" rot="R90">
<attribute name="NAME" x="8.128" y="21.082" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="13.208" y="20.574" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="GND4" gate="GND" x="2.54" y="0" smashed="yes"/>
<instance part="GND8" gate="GND" x="99.06" y="76.2" smashed="yes"/>
<instance part="M1" gate="G$1" x="86.36" y="63.5" smashed="yes">
<attribute name="NAME" x="93.98" y="67.056" size="1.6764" layer="95"/>
<attribute name="VALUE" x="88.646" y="22.86" size="1.6764" layer="96"/>
</instance>
<instance part="GND9" gate="GND" x="76.2" y="7.62" smashed="yes"/>
<instance part="GND10" gate="GND" x="124.46" y="55.88" smashed="yes"/>
<instance part="GND11" gate="GND" x="60.96" y="38.1" smashed="yes"/>
<instance part="GND13" gate="GND" x="99.06" y="93.98" smashed="yes"/>
<instance part="R10" gate="G$1" x="83.82" y="10.16" smashed="yes" rot="R90">
<attribute name="NAME" x="81.788" y="8.382" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="86.868" y="7.874" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="R11" gate="G$1" x="83.82" y="-2.54" smashed="yes" rot="R90">
<attribute name="NAME" x="81.788" y="-4.318" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="86.868" y="-4.826" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="GND14" gate="GND" x="83.82" y="-12.7" smashed="yes"/>
<instance part="GND15" gate="GND" x="60.96" y="55.88" smashed="yes"/>
<instance part="GND17" gate="GND" x="-17.78" y="22.86" smashed="yes"/>
<instance part="PWR1" gate="G$1" x="2.54" y="91.44" smashed="yes">
<attribute name="VALUE" x="0.635" y="94.615" size="1.778" layer="96"/>
</instance>
<instance part="PWR2" gate="G$1" x="78.74" y="71.12" smashed="yes">
<attribute name="VALUE" x="76.835" y="74.295" size="1.778" layer="96"/>
</instance>
<instance part="LED5" gate="G$1" x="45.72" y="5.08" smashed="yes" rot="R180">
<attribute name="NAME" x="50.8" y="9.144" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="LED4" gate="G$1" x="45.72" y="25.4" smashed="yes" rot="R180">
<attribute name="NAME" x="51.308" y="29.21" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="LED3" gate="G$1" x="45.72" y="45.72" smashed="yes" rot="R180">
<attribute name="NAME" x="50.8" y="49.53" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="LED2" gate="G$1" x="45.72" y="63.5" smashed="yes" rot="R180">
<attribute name="NAME" x="50.546" y="67.31" size="1.778" layer="95" rot="R180"/>
</instance>
<instance part="R9" gate="G$1" x="40.64" y="10.16" smashed="yes" rot="R90">
<attribute name="NAME" x="38.608" y="8.382" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="43.688" y="7.874" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="R8" gate="G$1" x="40.64" y="30.48" smashed="yes" rot="R270">
<attribute name="NAME" x="39.37" y="29.21" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="42.164" y="32.766" size="1.778" layer="96" rot="R270"/>
</instance>
<instance part="R7" gate="G$1" x="40.64" y="50.8" smashed="yes" rot="R90">
<attribute name="NAME" x="38.862" y="48.514" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="43.942" y="48.514" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="R6" gate="G$1" x="40.64" y="68.58" smashed="yes" rot="R90">
<attribute name="NAME" x="38.862" y="66.548" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="43.434" y="66.802" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="GND2" gate="GND" x="48.26" y="2.54" smashed="yes"/>
<instance part="GND12" gate="GND" x="48.26" y="22.86" smashed="yes"/>
<instance part="GND18" gate="GND" x="48.26" y="43.18" smashed="yes"/>
<instance part="GND19" gate="GND" x="48.26" y="60.96" smashed="yes"/>
<instance part="U2" gate="G$1" x="55.88" y="101.6" smashed="yes">
<attribute name="NAME" x="52.832" y="112.776" size="1.778" layer="95"/>
</instance>
<instance part="U3" gate="G$1" x="55.88" y="81.28" smashed="yes">
<attribute name="NAME" x="52.832" y="92.456" size="1.778" layer="95"/>
</instance>
<instance part="GND20" gate="GND" x="55.88" y="96.52" smashed="yes"/>
<instance part="GND21" gate="GND" x="55.88" y="76.2" smashed="yes"/>
<instance part="SUPPLY2" gate="+5V" x="86.36" y="106.68" smashed="yes">
<attribute name="VALUE" x="84.455" y="109.855" size="1.778" layer="96"/>
</instance>
<instance part="C1" gate="G$1" x="45.72" y="101.6" smashed="yes" rot="R90">
<attribute name="NAME" x="43.434" y="101.6" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="49.276" y="100.838" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="C2" gate="G$1" x="45.72" y="81.28" smashed="yes" rot="R90">
<attribute name="NAME" x="43.688" y="81.28" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="49.276" y="80.518" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="C3" gate="G$1" x="66.04" y="101.6" smashed="yes" rot="R90">
<attribute name="NAME" x="64.008" y="101.346" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="69.596" y="99.06" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="C4" gate="G$1" x="68.58" y="81.28" smashed="yes" rot="R90">
<attribute name="NAME" x="66.548" y="81.026" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="72.136" y="78.74" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="SUPPLY3" gate="+5V" x="157.48" y="76.2" smashed="yes">
<attribute name="VALUE" x="155.575" y="79.375" size="1.778" layer="96"/>
</instance>
<instance part="GND3" gate="GND" x="157.48" y="55.88" smashed="yes"/>
<instance part="GND7" gate="GND" x="147.32" y="78.74" smashed="yes"/>
<instance part="R12" gate="G$1" x="134.62" y="101.6" smashed="yes" rot="R90">
<attribute name="NAME" x="132.588" y="99.822" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="137.922" y="99.822" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="R13" gate="G$1" x="144.78" y="101.6" smashed="yes" rot="R90">
<attribute name="NAME" x="142.748" y="99.822" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="148.082" y="99.568" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="PWR3" gate="G$1" x="139.7" y="111.76" smashed="yes">
<attribute name="VALUE" x="137.795" y="114.935" size="1.778" layer="96"/>
</instance>
<instance part="J1" gate="G$1" x="-25.4" y="60.96" smashed="yes">
<attribute name="NAME" x="-27.178" y="69.596" size="1.778" layer="95"/>
</instance>
<instance part="J2" gate="G$1" x="-25.4" y="35.56" smashed="yes">
<attribute name="NAME" x="-26.924" y="44.196" size="1.778" layer="95"/>
</instance>
<instance part="J4" gate="G$1" x="106.68" y="104.14" smashed="yes" rot="MR0">
<attribute name="NAME" x="110.744" y="107.188" size="1.778" layer="95" rot="MR0"/>
</instance>
<instance part="J5" gate="G$1" x="106.68" y="86.36" smashed="yes" rot="MR0">
<attribute name="NAME" x="110.744" y="89.408" size="1.778" layer="95" rot="MR0"/>
</instance>
<instance part="J6" gate="G$1" x="157.48" y="93.98" smashed="yes" rot="MR0">
<attribute name="NAME" x="159.004" y="97.536" size="1.778" layer="95" rot="MR0"/>
</instance>
<instance part="J3" gate="G$1" x="68.58" y="17.78" smashed="yes">
<attribute name="NAME" x="67.056" y="21.336" size="1.778" layer="95"/>
</instance>
<instance part="J7" gate="G$1" x="129.54" y="7.62" smashed="yes" rot="MR0">
<attribute name="NAME" x="130.556" y="16.51" size="1.778" layer="95" rot="MR0"/>
</instance>
<instance part="GND16" gate="GND" x="119.38" y="-7.62" smashed="yes"/>
<instance part="U4" gate="G$1" x="154.94" y="63.5" smashed="yes">
<attribute name="NAME" x="160.274" y="72.644" size="1.6764" layer="95" font="vector" ratio="12"/>
<attribute name="VALUE" x="159.766" y="70.358" size="1.6764" layer="96" font="vector" ratio="12"/>
</instance>
<instance part="U4" gate="G$2" x="154.94" y="45.72" smashed="yes">
<attribute name="NAME" x="158.242" y="50.292" size="1.6764" layer="95" font="vector" ratio="12"/>
</instance>
<instance part="U4" gate="G$3" x="154.94" y="33.02" smashed="yes">
<attribute name="NAME" x="157.48" y="38.1" size="1.6764" layer="95" font="vector" ratio="12"/>
</instance>
<instance part="U4" gate="G$4" x="154.94" y="20.32" smashed="yes">
<attribute name="NAME" x="157.48" y="25.4" size="1.6764" layer="95" font="vector" ratio="12"/>
</instance>
<instance part="P1" gate="G$1" x="2.54" y="7.62" smashed="yes" rot="R90">
<attribute name="NAME" x="0" y="5.08" size="1.27" layer="95" rot="R90"/>
<attribute name="VALUE" x="6.35" y="10.16" size="1.27" layer="96" rot="R90"/>
</instance>
<instance part="R14" gate="G$1" x="175.26" y="66.04" smashed="yes">
<attribute name="NAME" x="171.704" y="67.818" size="1.778" layer="95"/>
<attribute name="VALUE" x="171.704" y="62.738" size="1.778" layer="96"/>
</instance>
<instance part="R15" gate="G$1" x="175.26" y="48.26" smashed="yes">
<attribute name="NAME" x="171.704" y="50.038" size="1.778" layer="95"/>
<attribute name="VALUE" x="171.704" y="44.958" size="1.778" layer="96"/>
</instance>
<instance part="R16" gate="G$1" x="175.26" y="35.56" smashed="yes">
<attribute name="NAME" x="171.704" y="37.338" size="1.778" layer="95"/>
<attribute name="VALUE" x="171.704" y="32.258" size="1.778" layer="96"/>
</instance>
<instance part="R17" gate="G$1" x="175.26" y="22.86" smashed="yes">
<attribute name="NAME" x="171.704" y="24.638" size="1.778" layer="95"/>
<attribute name="VALUE" x="171.704" y="19.558" size="1.778" layer="96"/>
</instance>
</instances>
<busses>
</busses>
<nets>
<net name="IRE_1" class="0">
<segment>
<pinref part="M1" gate="G$1" pin="P$3"/>
<wire x1="81.28" y1="58.42" x2="68.58" y2="58.42" width="0.1524" layer="91"/>
<label x="69.088" y="59.182" size="1.4224" layer="95"/>
</segment>
<segment>
<wire x1="152.4" y1="66.04" x2="139.7" y2="66.04" width="0.1524" layer="91"/>
<label x="139.954" y="66.802" size="1.4224" layer="95"/>
<pinref part="U4" gate="G$1" pin="IN"/>
</segment>
</net>
<net name="IRE_2" class="0">
<segment>
<pinref part="M1" gate="G$1" pin="P$4"/>
<wire x1="81.28" y1="55.88" x2="68.58" y2="55.88" width="0.1524" layer="91"/>
<label x="69.088" y="56.642" size="1.4224" layer="95"/>
</segment>
<segment>
<wire x1="152.4" y1="48.26" x2="139.7" y2="48.26" width="0.1524" layer="91"/>
<label x="139.954" y="49.022" size="1.4224" layer="95"/>
<pinref part="U4" gate="G$2" pin="IN"/>
</segment>
</net>
<net name="IRE_3" class="0">
<segment>
<pinref part="M1" gate="G$1" pin="P$5"/>
<wire x1="81.28" y1="53.34" x2="68.58" y2="53.34" width="0.1524" layer="91"/>
<label x="69.088" y="54.102" size="1.4224" layer="95"/>
</segment>
<segment>
<wire x1="152.4" y1="35.56" x2="139.7" y2="35.56" width="0.1524" layer="91"/>
<label x="140.208" y="36.576" size="1.4224" layer="95"/>
<pinref part="U4" gate="G$3" pin="IN"/>
</segment>
</net>
<net name="IRE_4" class="0">
<segment>
<pinref part="M1" gate="G$1" pin="P$6"/>
<wire x1="81.28" y1="50.8" x2="68.58" y2="50.8" width="0.1524" layer="91"/>
<label x="69.088" y="51.562" size="1.4224" layer="95"/>
</segment>
<segment>
<wire x1="152.4" y1="22.86" x2="139.7" y2="22.86" width="0.1524" layer="91"/>
<label x="140.208" y="23.622" size="1.4224" layer="95"/>
<pinref part="U4" gate="G$4" pin="IN"/>
</segment>
</net>
<net name="IRD_1" class="0">
<segment>
<pinref part="U1" gate="G$2" pin="OUT"/>
<wire x1="35.56" y1="73.66" x2="40.64" y2="73.66" width="0.1524" layer="91"/>
<label x="38.862" y="74.676" size="1.4224" layer="95"/>
<pinref part="R6" gate="G$1" pin="2"/>
<wire x1="40.64" y1="73.66" x2="45.72" y2="73.66" width="0.1524" layer="91"/>
<junction x="40.64" y="73.66"/>
</segment>
<segment>
<pinref part="M1" gate="G$1" pin="P$7"/>
<wire x1="81.28" y1="48.26" x2="68.58" y2="48.26" width="0.1524" layer="91"/>
<label x="69.088" y="49.022" size="1.4224" layer="95"/>
</segment>
</net>
<net name="IRD_2" class="0">
<segment>
<pinref part="U1" gate="G$4" pin="OUT"/>
<wire x1="35.56" y1="55.88" x2="40.64" y2="55.88" width="0.1524" layer="91"/>
<label x="38.862" y="56.642" size="1.4224" layer="95"/>
<pinref part="R7" gate="G$1" pin="2"/>
<wire x1="40.64" y1="55.88" x2="45.72" y2="55.88" width="0.1524" layer="91"/>
<junction x="40.64" y="55.88"/>
</segment>
<segment>
<pinref part="M1" gate="G$1" pin="P$8"/>
<wire x1="81.28" y1="45.72" x2="68.58" y2="45.72" width="0.1524" layer="91"/>
<label x="69.088" y="46.482" size="1.4224" layer="95"/>
</segment>
</net>
<net name="IRD_3" class="0">
<segment>
<pinref part="U1" gate="G$3" pin="OUT"/>
<wire x1="35.56" y1="35.56" x2="40.64" y2="35.56" width="0.1524" layer="91"/>
<label x="39.37" y="36.576" size="1.4224" layer="95"/>
<pinref part="R8" gate="G$1" pin="1"/>
<wire x1="40.64" y1="35.56" x2="45.72" y2="35.56" width="0.1524" layer="91"/>
<junction x="40.64" y="35.56"/>
</segment>
<segment>
<pinref part="M1" gate="G$1" pin="P$11"/>
<wire x1="81.28" y1="38.1" x2="68.58" y2="38.1" width="0.1524" layer="91"/>
<label x="69.088" y="38.862" size="1.4224" layer="95"/>
</segment>
</net>
<net name="IRD_4" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="OUT"/>
<wire x1="35.56" y1="15.24" x2="40.64" y2="15.24" width="0.1524" layer="91"/>
<label x="38.862" y="17.018" size="1.4224" layer="95"/>
<pinref part="R9" gate="G$1" pin="2"/>
<wire x1="40.64" y1="15.24" x2="45.72" y2="15.24" width="0.1524" layer="91"/>
<junction x="40.64" y="15.24"/>
</segment>
<segment>
<pinref part="M1" gate="G$1" pin="P$12"/>
<wire x1="81.28" y1="35.56" x2="68.58" y2="35.56" width="0.1524" layer="91"/>
<label x="69.088" y="36.322" size="1.4224" layer="95"/>
</segment>
</net>
<net name="+5V" class="0">
<segment>
<pinref part="SUPPLY1" gate="+5V" pin="+5V"/>
<pinref part="U1" gate="G$1" pin="P+"/>
<wire x1="27.94" y1="20.32" x2="32.004" y2="20.32" width="0.1524" layer="91"/>
</segment>
<segment>
<wire x1="101.6" y1="101.6" x2="86.36" y2="101.6" width="0.1524" layer="91"/>
<wire x1="86.36" y1="101.6" x2="78.74" y2="101.6" width="0.1524" layer="91"/>
<wire x1="78.74" y1="101.6" x2="78.74" y2="106.68" width="0.1524" layer="91"/>
<pinref part="U2" gate="G$1" pin="OUT"/>
<wire x1="78.74" y1="106.68" x2="66.04" y2="106.68" width="0.1524" layer="91"/>
<pinref part="SUPPLY2" gate="+5V" pin="+5V"/>
<wire x1="66.04" y1="106.68" x2="63.5" y2="106.68" width="0.1524" layer="91"/>
<wire x1="86.36" y1="104.14" x2="86.36" y2="101.6" width="0.1524" layer="91"/>
<junction x="86.36" y="101.6"/>
<pinref part="C3" gate="G$1" pin="2"/>
<junction x="66.04" y="106.68"/>
<pinref part="J4" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="SUPPLY3" gate="+5V" pin="+5V"/>
<pinref part="U4" gate="G$1" pin="VCC"/>
<wire x1="157.48" y1="73.66" x2="157.48" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="P-"/>
<pinref part="GND1" gate="GND" pin="GND"/>
<wire x1="27.94" y1="10.16" x2="27.94" y2="7.62" width="0.1524" layer="91"/>
</segment>
<segment>
<wire x1="101.6" y1="81.28" x2="99.06" y2="81.28" width="0.1524" layer="91"/>
<wire x1="99.06" y1="81.28" x2="99.06" y2="78.74" width="0.1524" layer="91"/>
<pinref part="GND8" gate="GND" pin="GND"/>
<pinref part="J5" gate="G$1" pin="3"/>
</segment>
<segment>
<pinref part="GND9" gate="GND" pin="GND"/>
<wire x1="76.2" y1="10.16" x2="76.2" y2="12.7" width="0.1524" layer="91"/>
<wire x1="76.2" y1="12.7" x2="73.66" y2="12.7" width="0.1524" layer="91"/>
<pinref part="J3" gate="G$1" pin="3"/>
<pinref part="J3" gate="G$1" pin="1"/>
<wire x1="73.66" y1="17.78" x2="76.2" y2="17.78" width="0.1524" layer="91"/>
<wire x1="76.2" y1="17.78" x2="76.2" y2="12.7" width="0.1524" layer="91"/>
<junction x="76.2" y="12.7"/>
</segment>
<segment>
<pinref part="M1" gate="G$1" pin="P$9"/>
<wire x1="81.28" y1="43.18" x2="60.96" y2="43.18" width="0.1524" layer="91"/>
<wire x1="60.96" y1="43.18" x2="60.96" y2="40.64" width="0.1524" layer="91"/>
<pinref part="GND11" gate="GND" pin="GND"/>
</segment>
<segment>
<wire x1="101.6" y1="99.06" x2="99.06" y2="99.06" width="0.1524" layer="91"/>
<wire x1="99.06" y1="99.06" x2="99.06" y2="96.52" width="0.1524" layer="91"/>
<pinref part="GND13" gate="GND" pin="GND"/>
<pinref part="J4" gate="G$1" pin="3"/>
</segment>
<segment>
<pinref part="R11" gate="G$1" pin="1"/>
<pinref part="GND14" gate="GND" pin="GND"/>
<wire x1="83.82" y1="-7.62" x2="83.82" y2="-10.16" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="M1" gate="G$1" pin="P$2"/>
<wire x1="81.28" y1="60.96" x2="60.96" y2="60.96" width="0.1524" layer="91"/>
<wire x1="60.96" y1="60.96" x2="60.96" y2="58.42" width="0.1524" layer="91"/>
<pinref part="GND15" gate="GND" pin="GND"/>
</segment>
<segment>
<wire x1="-17.78" y1="27.94" x2="-20.32" y2="27.94" width="0.1524" layer="91"/>
<wire x1="-17.78" y1="27.94" x2="-17.78" y2="25.4" width="0.1524" layer="91"/>
<pinref part="GND17" gate="GND" pin="GND"/>
<pinref part="J2" gate="G$1" pin="6"/>
<wire x1="-20.32" y1="53.34" x2="-17.78" y2="53.34" width="0.1524" layer="91"/>
<pinref part="J1" gate="G$1" pin="6"/>
<wire x1="-17.78" y1="53.34" x2="-17.78" y2="40.64" width="0.1524" layer="91"/>
<junction x="-17.78" y="27.94"/>
<pinref part="J2" gate="G$1" pin="1"/>
<wire x1="-17.78" y1="40.64" x2="-17.78" y2="27.94" width="0.1524" layer="91"/>
<wire x1="-20.32" y1="40.64" x2="-17.78" y2="40.64" width="0.1524" layer="91"/>
<junction x="-17.78" y="40.64"/>
<pinref part="J1" gate="G$1" pin="1"/>
<wire x1="-20.32" y1="66.04" x2="-17.78" y2="66.04" width="0.1524" layer="91"/>
<wire x1="-17.78" y1="66.04" x2="-17.78" y2="53.34" width="0.1524" layer="91"/>
<junction x="-17.78" y="53.34"/>
</segment>
<segment>
<pinref part="M1" gate="G$1" pin="P$29"/>
<wire x1="114.3" y1="60.96" x2="124.46" y2="60.96" width="0.1524" layer="91"/>
<pinref part="GND10" gate="GND" pin="GND"/>
<wire x1="124.46" y1="60.96" x2="124.46" y2="58.42" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="LED5" gate="G$1" pin="CATHODE"/>
<pinref part="GND2" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="LED4" gate="G$1" pin="CATHODE"/>
<pinref part="GND12" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="LED3" gate="G$1" pin="CATHODE"/>
<pinref part="GND18" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="LED2" gate="G$1" pin="CATHODE"/>
<pinref part="GND19" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="U2" gate="G$1" pin="GND"/>
<pinref part="GND20" gate="GND" pin="GND"/>
<wire x1="55.88" y1="99.06" x2="55.88" y2="101.6" width="0.1524" layer="91"/>
<pinref part="C1" gate="G$1" pin="1"/>
<wire x1="45.72" y1="99.06" x2="55.88" y2="99.06" width="0.1524" layer="91"/>
<junction x="55.88" y="99.06"/>
<pinref part="C3" gate="G$1" pin="1"/>
<wire x1="55.88" y1="99.06" x2="66.04" y2="99.06" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U3" gate="G$1" pin="GND"/>
<pinref part="GND21" gate="GND" pin="GND"/>
<wire x1="55.88" y1="78.74" x2="55.88" y2="81.28" width="0.1524" layer="91"/>
<pinref part="C2" gate="G$1" pin="1"/>
<wire x1="45.72" y1="78.74" x2="55.88" y2="78.74" width="0.1524" layer="91"/>
<junction x="55.88" y="78.74"/>
<pinref part="C4" gate="G$1" pin="1"/>
<wire x1="55.88" y1="78.74" x2="68.58" y2="78.74" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="GND3" gate="GND" pin="GND"/>
<wire x1="149.86" y1="58.42" x2="157.48" y2="58.42" width="0.1524" layer="91"/>
<wire x1="149.86" y1="17.78" x2="149.86" y2="30.48" width="0.1524" layer="91"/>
<pinref part="U4" gate="G$4" pin="OE"/>
<wire x1="149.86" y1="30.48" x2="149.86" y2="43.18" width="0.1524" layer="91"/>
<wire x1="149.86" y1="43.18" x2="149.86" y2="58.42" width="0.1524" layer="91"/>
<wire x1="149.86" y1="17.78" x2="152.4" y2="17.78" width="0.1524" layer="91"/>
<pinref part="U4" gate="G$2" pin="OE"/>
<wire x1="152.4" y1="43.18" x2="149.86" y2="43.18" width="0.1524" layer="91"/>
<junction x="149.86" y="43.18"/>
<pinref part="U4" gate="G$3" pin="OE"/>
<wire x1="152.4" y1="30.48" x2="149.86" y2="30.48" width="0.1524" layer="91"/>
<junction x="149.86" y="30.48"/>
<wire x1="149.86" y1="58.42" x2="149.86" y2="60.96" width="0.1524" layer="91"/>
<junction x="149.86" y="58.42"/>
<pinref part="U4" gate="G$1" pin="OE"/>
<wire x1="149.86" y1="60.96" x2="152.4" y2="60.96" width="0.1524" layer="91"/>
<pinref part="U4" gate="G$1" pin="GND"/>
<wire x1="157.48" y1="60.96" x2="157.48" y2="58.42" width="0.1524" layer="91"/>
<junction x="157.48" y="58.42"/>
</segment>
<segment>
<wire x1="152.4" y1="91.44" x2="147.32" y2="91.44" width="0.1524" layer="91"/>
<wire x1="147.32" y1="91.44" x2="147.32" y2="86.36" width="0.1524" layer="91"/>
<wire x1="147.32" y1="86.36" x2="147.32" y2="81.28" width="0.1524" layer="91"/>
<wire x1="152.4" y1="86.36" x2="147.32" y2="86.36" width="0.1524" layer="91"/>
<junction x="147.32" y="86.36"/>
<pinref part="GND7" gate="GND" pin="GND"/>
<pinref part="J6" gate="G$1" pin="2"/>
<pinref part="J6" gate="G$1" pin="4"/>
</segment>
<segment>
<pinref part="J7" gate="G$1" pin="5"/>
<wire x1="124.46" y1="2.54" x2="119.38" y2="2.54" width="0.1524" layer="91"/>
<wire x1="119.38" y1="2.54" x2="119.38" y2="0" width="0.1524" layer="91"/>
<pinref part="GND16" gate="GND" pin="GND"/>
<pinref part="J7" gate="G$1" pin="6"/>
<wire x1="119.38" y1="0" x2="119.38" y2="-5.08" width="0.1524" layer="91"/>
<wire x1="124.46" y1="0" x2="119.38" y2="0" width="0.1524" layer="91"/>
<junction x="119.38" y="0"/>
</segment>
<segment>
<pinref part="GND4" gate="GND" pin="GND"/>
<pinref part="P1" gate="G$1" pin="P$1"/>
</segment>
</net>
<net name="IRDIN_1" class="0">
<segment>
<wire x1="-20.32" y1="63.5" x2="0" y2="63.5" width="0.1524" layer="91"/>
<wire x1="0" y1="63.5" x2="0" y2="76.2" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$2" pin="+IN"/>
<wire x1="0" y1="76.2" x2="10.16" y2="76.2" width="0.1524" layer="91"/>
<pinref part="R2" gate="G$1" pin="1"/>
<wire x1="10.16" y1="76.2" x2="20.32" y2="76.2" width="0.1524" layer="91"/>
<junction x="10.16" y="76.2"/>
<pinref part="J1" gate="G$1" pin="2"/>
<label x="-16.002" y="64.262" size="1.778" layer="95"/>
</segment>
</net>
<net name="IRDIN_2" class="0">
<segment>
<wire x1="-20.32" y1="60.96" x2="0" y2="60.96" width="0.1524" layer="91"/>
<wire x1="0" y1="60.96" x2="0" y2="58.42" width="0.1524" layer="91"/>
<pinref part="R3" gate="G$1" pin="1"/>
<wire x1="0" y1="58.42" x2="10.16" y2="58.42" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$4" pin="+IN"/>
<wire x1="10.16" y1="58.42" x2="20.32" y2="58.42" width="0.1524" layer="91"/>
<junction x="10.16" y="58.42"/>
<pinref part="J1" gate="G$1" pin="3"/>
<label x="-16.002" y="61.722" size="1.778" layer="95"/>
</segment>
</net>
<net name="IRDIN_3" class="0">
<segment>
<wire x1="-20.32" y1="58.42" x2="-2.54" y2="58.42" width="0.1524" layer="91"/>
<pinref part="R4" gate="G$1" pin="1"/>
<wire x1="-2.54" y1="58.42" x2="-2.54" y2="38.1" width="0.1524" layer="91"/>
<wire x1="-2.54" y1="38.1" x2="10.16" y2="38.1" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$3" pin="+IN"/>
<wire x1="10.16" y1="38.1" x2="20.32" y2="38.1" width="0.1524" layer="91"/>
<junction x="10.16" y="38.1"/>
<pinref part="J1" gate="G$1" pin="4"/>
<label x="-16.002" y="59.182" size="1.778" layer="95"/>
</segment>
</net>
<net name="IRDIN_4" class="0">
<segment>
<wire x1="-20.32" y1="55.88" x2="-5.08" y2="55.88" width="0.1524" layer="91"/>
<pinref part="R5" gate="G$1" pin="1"/>
<wire x1="-5.08" y1="55.88" x2="-5.08" y2="17.78" width="0.1524" layer="91"/>
<wire x1="-5.08" y1="17.78" x2="10.16" y2="17.78" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$1" pin="+IN"/>
<wire x1="10.16" y1="17.78" x2="20.32" y2="17.78" width="0.1524" layer="91"/>
<junction x="10.16" y="17.78"/>
<pinref part="J1" gate="G$1" pin="5"/>
<label x="-16.256" y="56.642" size="1.778" layer="95"/>
</segment>
</net>
<net name="NEO_DATA_1" class="0">
<segment>
<wire x1="101.6" y1="104.14" x2="88.9" y2="104.14" width="0.1524" layer="91"/>
<label x="90.678" y="104.902" size="1.4224" layer="95"/>
<pinref part="J4" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="M1" gate="G$1" pin="P$14"/>
<wire x1="81.28" y1="30.48" x2="68.58" y2="30.48" width="0.1524" layer="91"/>
<label x="68.834" y="31.242" size="1.4224" layer="95"/>
</segment>
</net>
<net name="VIN" class="0">
<segment>
<label x="92.202" y="15.748" size="1.4224" layer="95"/>
<pinref part="R10" gate="G$1" pin="2"/>
<wire x1="73.66" y1="15.24" x2="83.82" y2="15.24" width="0.1524" layer="91"/>
<pinref part="J3" gate="G$1" pin="2"/>
<wire x1="83.82" y1="15.24" x2="96.52" y2="15.24" width="0.1524" layer="91"/>
<junction x="83.82" y="15.24"/>
</segment>
<segment>
<pinref part="M1" gate="G$1" pin="P$30"/>
<wire x1="114.3" y1="63.5" x2="124.46" y2="63.5" width="0.1524" layer="91"/>
<label x="116.84" y="64.262" size="1.4224" layer="95"/>
</segment>
<segment>
<label x="31.242" y="107.188" size="1.4224" layer="95"/>
<pinref part="U2" gate="G$1" pin="IN"/>
<wire x1="30.48" y1="106.68" x2="40.64" y2="106.68" width="0.1524" layer="91"/>
<pinref part="U3" gate="G$1" pin="IN"/>
<wire x1="40.64" y1="106.68" x2="45.72" y2="106.68" width="0.1524" layer="91"/>
<wire x1="45.72" y1="106.68" x2="48.26" y2="106.68" width="0.1524" layer="91"/>
<wire x1="48.26" y1="86.36" x2="45.72" y2="86.36" width="0.1524" layer="91"/>
<wire x1="45.72" y1="86.36" x2="40.64" y2="86.36" width="0.1524" layer="91"/>
<wire x1="40.64" y1="86.36" x2="40.64" y2="106.68" width="0.1524" layer="91"/>
<junction x="40.64" y="106.68"/>
<pinref part="C1" gate="G$1" pin="2"/>
<junction x="45.72" y="106.68"/>
<pinref part="C2" gate="G$1" pin="2"/>
<junction x="45.72" y="86.36"/>
</segment>
</net>
<net name="NEO_DATA_2" class="0">
<segment>
<wire x1="101.6" y1="86.36" x2="88.9" y2="86.36" width="0.1524" layer="91"/>
<label x="90.424" y="87.376" size="1.4224" layer="95"/>
<pinref part="J5" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="M1" gate="G$1" pin="P$13"/>
<wire x1="81.28" y1="33.02" x2="68.58" y2="33.02" width="0.1524" layer="91"/>
<label x="69.088" y="33.782" size="1.4224" layer="95"/>
</segment>
</net>
<net name="BATV" class="0">
<segment>
<pinref part="M1" gate="G$1" pin="P$16"/>
<wire x1="114.3" y1="27.94" x2="121.92" y2="27.94" width="0.1524" layer="91"/>
<label x="114.808" y="28.702" size="1.4224" layer="95"/>
</segment>
<segment>
<pinref part="R10" gate="G$1" pin="1"/>
<pinref part="R11" gate="G$1" pin="2"/>
<wire x1="83.82" y1="5.08" x2="83.82" y2="2.54" width="0.1524" layer="91"/>
<wire x1="83.82" y1="5.08" x2="96.52" y2="5.08" width="0.1524" layer="91"/>
<junction x="83.82" y="5.08"/>
<label x="91.186" y="5.842" size="1.4224" layer="95"/>
</segment>
</net>
<net name="+3.3V" class="0">
<segment>
<pinref part="R5" gate="G$1" pin="2"/>
<wire x1="10.16" y1="27.94" x2="2.54" y2="27.94" width="0.1524" layer="91"/>
<pinref part="R2" gate="G$1" pin="2"/>
<wire x1="2.54" y1="27.94" x2="2.54" y2="48.26" width="0.1524" layer="91"/>
<wire x1="2.54" y1="48.26" x2="2.54" y2="68.58" width="0.1524" layer="91"/>
<wire x1="2.54" y1="68.58" x2="2.54" y2="86.36" width="0.1524" layer="91"/>
<wire x1="2.54" y1="86.36" x2="10.16" y2="86.36" width="0.1524" layer="91"/>
<pinref part="R3" gate="G$1" pin="2"/>
<wire x1="10.16" y1="68.58" x2="2.54" y2="68.58" width="0.1524" layer="91"/>
<junction x="2.54" y="68.58"/>
<pinref part="R4" gate="G$1" pin="2"/>
<wire x1="10.16" y1="48.26" x2="2.54" y2="48.26" width="0.1524" layer="91"/>
<junction x="2.54" y="48.26"/>
<junction x="2.54" y="27.94"/>
<wire x1="2.54" y1="27.94" x2="2.54" y2="12.7" width="0.1524" layer="91"/>
<pinref part="PWR1" gate="G$1" pin="+3.3V"/>
<wire x1="2.54" y1="88.9" x2="2.54" y2="86.36" width="0.1524" layer="91"/>
<junction x="2.54" y="86.36"/>
<pinref part="P1" gate="G$1" pin="P$3"/>
</segment>
<segment>
<pinref part="M1" gate="G$1" pin="P$1"/>
<wire x1="81.28" y1="63.5" x2="78.74" y2="63.5" width="0.1524" layer="91"/>
<pinref part="PWR2" gate="G$1" pin="+3.3V"/>
<wire x1="78.74" y1="63.5" x2="78.74" y2="68.58" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="R12" gate="G$1" pin="2"/>
<wire x1="134.62" y1="106.68" x2="134.62" y2="109.22" width="0.1524" layer="91"/>
<wire x1="134.62" y1="109.22" x2="139.7" y2="109.22" width="0.1524" layer="91"/>
<pinref part="R13" gate="G$1" pin="2"/>
<wire x1="139.7" y1="109.22" x2="144.78" y2="109.22" width="0.1524" layer="91"/>
<wire x1="144.78" y1="109.22" x2="144.78" y2="106.68" width="0.1524" layer="91"/>
<pinref part="PWR3" gate="G$1" pin="+3.3V"/>
<junction x="139.7" y="109.22"/>
</segment>
</net>
<net name="HITRST" class="0">
<segment>
<pinref part="M1" gate="G$1" pin="P$19"/>
<wire x1="114.3" y1="35.56" x2="124.46" y2="35.56" width="0.1524" layer="91"/>
<label x="115.316" y="36.068" size="1.4224" layer="95"/>
</segment>
<segment>
<wire x1="152.4" y1="88.9" x2="144.78" y2="88.9" width="0.1524" layer="91"/>
<pinref part="R13" gate="G$1" pin="1"/>
<wire x1="144.78" y1="88.9" x2="121.92" y2="88.9" width="0.1524" layer="91"/>
<wire x1="144.78" y1="96.52" x2="144.78" y2="88.9" width="0.1524" layer="91"/>
<junction x="144.78" y="88.9"/>
<label x="122.428" y="89.408" size="1.4224" layer="95"/>
<pinref part="J6" gate="G$1" pin="3"/>
</segment>
</net>
<net name="GMODE" class="0">
<segment>
<pinref part="M1" gate="G$1" pin="P$20"/>
<wire x1="114.3" y1="38.1" x2="124.46" y2="38.1" width="0.1524" layer="91"/>
<label x="115.316" y="38.354" size="1.4224" layer="95"/>
</segment>
<segment>
<wire x1="152.4" y1="93.98" x2="134.62" y2="93.98" width="0.1524" layer="91"/>
<pinref part="R12" gate="G$1" pin="1"/>
<wire x1="134.62" y1="93.98" x2="121.92" y2="93.98" width="0.1524" layer="91"/>
<wire x1="134.62" y1="96.52" x2="134.62" y2="93.98" width="0.1524" layer="91"/>
<junction x="134.62" y="93.98"/>
<label x="122.174" y="94.488" size="1.4224" layer="95"/>
<pinref part="J6" gate="G$1" pin="1"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="R7" gate="G$1" pin="1"/>
<pinref part="LED3" gate="G$1" pin="ANODE"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="R6" gate="G$1" pin="1"/>
<pinref part="LED2" gate="G$1" pin="ANODE"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="LED4" gate="G$1" pin="ANODE"/>
<pinref part="R8" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="R9" gate="G$1" pin="1"/>
<pinref part="LED5" gate="G$1" pin="ANODE"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<pinref part="U3" gate="G$1" pin="OUT"/>
<pinref part="C4" gate="G$1" pin="2"/>
<wire x1="68.58" y1="86.36" x2="63.5" y2="86.36" width="0.1524" layer="91"/>
<wire x1="68.58" y1="86.36" x2="78.74" y2="86.36" width="0.1524" layer="91"/>
<wire x1="78.74" y1="86.36" x2="78.74" y2="83.82" width="0.1524" layer="91"/>
<junction x="68.58" y="86.36"/>
<wire x1="78.74" y1="83.82" x2="101.6" y2="83.82" width="0.1524" layer="91"/>
<pinref part="J5" gate="G$1" pin="2"/>
</segment>
</net>
<net name="IRED_1" class="0">
<segment>
<wire x1="-20.32" y1="38.1" x2="-10.16" y2="38.1" width="0.1524" layer="91"/>
<label x="-16.51" y="38.862" size="1.4224" layer="95"/>
<pinref part="J2" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="R14" gate="G$1" pin="2"/>
<wire x1="180.34" y1="66.04" x2="187.96" y2="66.04" width="0.1524" layer="91"/>
<label x="181.102" y="67.056" size="1.4224" layer="95"/>
</segment>
</net>
<net name="IRED_2" class="0">
<segment>
<wire x1="-20.32" y1="35.56" x2="-10.16" y2="35.56" width="0.1524" layer="91"/>
<label x="-16.51" y="36.322" size="1.4224" layer="95"/>
<pinref part="J2" gate="G$1" pin="3"/>
</segment>
<segment>
<pinref part="R15" gate="G$1" pin="2"/>
<wire x1="180.34" y1="48.26" x2="187.96" y2="48.26" width="0.1524" layer="91"/>
<label x="181.61" y="49.276" size="1.4224" layer="95"/>
</segment>
</net>
<net name="IRED_3" class="0">
<segment>
<wire x1="-20.32" y1="33.02" x2="-10.16" y2="33.02" width="0.1524" layer="91"/>
<label x="-16.51" y="33.782" size="1.4224" layer="95"/>
<pinref part="J2" gate="G$1" pin="4"/>
</segment>
<segment>
<pinref part="R16" gate="G$1" pin="2"/>
<wire x1="180.34" y1="35.56" x2="187.96" y2="35.56" width="0.1524" layer="91"/>
<label x="181.61" y="36.576" size="1.4224" layer="95"/>
</segment>
</net>
<net name="IRED_4" class="0">
<segment>
<wire x1="-20.32" y1="30.48" x2="-10.16" y2="30.48" width="0.1524" layer="91"/>
<label x="-16.51" y="31.242" size="1.4224" layer="95"/>
<pinref part="J2" gate="G$1" pin="5"/>
</segment>
<segment>
<pinref part="R17" gate="G$1" pin="2"/>
<wire x1="180.34" y1="22.86" x2="187.96" y2="22.86" width="0.1524" layer="91"/>
<label x="181.61" y="23.876" size="1.4224" layer="95"/>
</segment>
</net>
<net name="MOSI" class="0">
<segment>
<pinref part="M1" gate="G$1" pin="P$21"/>
<wire x1="114.3" y1="40.64" x2="124.46" y2="40.64" width="0.1524" layer="91"/>
<label x="115.316" y="40.894" size="1.4224" layer="95"/>
</segment>
<segment>
<pinref part="J7" gate="G$1" pin="4"/>
<wire x1="124.46" y1="5.08" x2="119.38" y2="5.08" width="0.1524" layer="91"/>
<label x="118.872" y="5.588" size="1.4224" layer="95"/>
</segment>
</net>
<net name="CS" class="0">
<segment>
<pinref part="M1" gate="G$1" pin="P$22"/>
<wire x1="114.3" y1="43.18" x2="124.46" y2="43.18" width="0.1524" layer="91"/>
<label x="115.316" y="43.434" size="1.4224" layer="95"/>
</segment>
<segment>
<pinref part="J7" gate="G$1" pin="3"/>
<wire x1="124.46" y1="7.62" x2="119.38" y2="7.62" width="0.1524" layer="91"/>
<label x="118.872" y="8.128" size="1.4224" layer="95"/>
</segment>
</net>
<net name="MISO" class="0">
<segment>
<pinref part="M1" gate="G$1" pin="P$23"/>
<wire x1="114.3" y1="45.72" x2="124.46" y2="45.72" width="0.1524" layer="91"/>
<label x="115.316" y="45.974" size="1.4224" layer="95"/>
</segment>
<segment>
<pinref part="J7" gate="G$1" pin="2"/>
<wire x1="124.46" y1="10.16" x2="119.38" y2="10.16" width="0.1524" layer="91"/>
<label x="118.872" y="10.668" size="1.4224" layer="95"/>
</segment>
</net>
<net name="SCLK" class="0">
<segment>
<pinref part="M1" gate="G$1" pin="P$24"/>
<wire x1="114.3" y1="48.26" x2="124.46" y2="48.26" width="0.1524" layer="91"/>
<label x="115.316" y="48.514" size="1.4224" layer="95"/>
</segment>
<segment>
<pinref part="J7" gate="G$1" pin="1"/>
<wire x1="124.46" y1="12.7" x2="119.38" y2="12.7" width="0.1524" layer="91"/>
<label x="118.872" y="13.208" size="1.4224" layer="95"/>
</segment>
</net>
<net name="IREDD_1" class="0">
<segment>
<wire x1="162.56" y1="66.04" x2="170.18" y2="66.04" width="0.1524" layer="91"/>
<pinref part="U4" gate="G$1" pin="OUT"/>
<pinref part="R14" gate="G$1" pin="1"/>
</segment>
</net>
<net name="IREDD_2" class="0">
<segment>
<wire x1="162.56" y1="48.26" x2="170.18" y2="48.26" width="0.1524" layer="91"/>
<pinref part="U4" gate="G$2" pin="OUT"/>
<pinref part="R15" gate="G$1" pin="1"/>
</segment>
</net>
<net name="IREDD_3" class="0">
<segment>
<wire x1="162.56" y1="35.56" x2="170.18" y2="35.56" width="0.1524" layer="91"/>
<pinref part="U4" gate="G$3" pin="OUT"/>
<pinref part="R16" gate="G$1" pin="1"/>
</segment>
</net>
<net name="IREDD_4" class="0">
<segment>
<wire x1="162.56" y1="22.86" x2="170.18" y2="22.86" width="0.1524" layer="91"/>
<pinref part="U4" gate="G$4" pin="OUT"/>
<pinref part="R17" gate="G$1" pin="1"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<pinref part="U1" gate="G$2" pin="-IN"/>
<wire x1="20.32" y1="71.12" x2="17.78" y2="71.12" width="0.1524" layer="91"/>
<wire x1="17.78" y1="71.12" x2="17.78" y2="53.34" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$4" pin="-IN"/>
<wire x1="17.78" y1="53.34" x2="20.32" y2="53.34" width="0.1524" layer="91"/>
<wire x1="17.78" y1="53.34" x2="17.78" y2="33.02" width="0.1524" layer="91"/>
<junction x="17.78" y="53.34"/>
<pinref part="U1" gate="G$3" pin="-IN"/>
<wire x1="17.78" y1="33.02" x2="20.32" y2="33.02" width="0.1524" layer="91"/>
<wire x1="17.78" y1="33.02" x2="17.78" y2="12.7" width="0.1524" layer="91"/>
<junction x="17.78" y="33.02"/>
<pinref part="U1" gate="G$1" pin="-IN"/>
<wire x1="17.78" y1="12.7" x2="20.32" y2="12.7" width="0.1524" layer="91"/>
<wire x1="17.78" y1="7.62" x2="7.62" y2="7.62" width="0.1524" layer="91"/>
<pinref part="P1" gate="G$1" pin="P$2"/>
<wire x1="17.78" y1="12.7" x2="17.78" y2="7.62" width="0.1524" layer="91"/>
<junction x="17.78" y="12.7"/>
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
</compatibility>
</eagle>
