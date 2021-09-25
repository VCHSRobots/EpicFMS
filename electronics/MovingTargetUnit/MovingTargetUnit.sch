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
<package name="ARDUINO-NANO">
<pad name="D13" x="0" y="0" drill="1" shape="square"/>
<pad name="3.3" x="0" y="-2.54" drill="1"/>
<pad name="REF" x="0" y="-5.08" drill="1"/>
<pad name="A0" x="0" y="-7.62" drill="1"/>
<pad name="A1" x="0" y="-10.16" drill="1"/>
<pad name="A2" x="0" y="-12.7" drill="1" rot="R90"/>
<pad name="A3" x="0" y="-15.24" drill="1" rot="R90"/>
<pad name="A4" x="0" y="-17.78" drill="1" rot="R90"/>
<pad name="A5" x="0" y="-20.32" drill="1" rot="R90"/>
<pad name="A6" x="0" y="-22.86" drill="1" rot="R90"/>
<pad name="A7" x="0" y="-25.4" drill="1" rot="R90"/>
<pad name="5V" x="0" y="-27.94" drill="1" rot="R90"/>
<pad name="RST" x="0" y="-30.48" drill="1" rot="R90"/>
<pad name="GND" x="0" y="-33.02" drill="1" rot="R90"/>
<pad name="VIN" x="0" y="-35.56" drill="1" rot="R90"/>
<pad name="TX" x="15.24" y="-35.56" drill="1" rot="R90"/>
<pad name="RX" x="15.24" y="-33.02" drill="1" rot="R90"/>
<pad name="RST2" x="15.24" y="-30.48" drill="1"/>
<pad name="GND2" x="15.24" y="-27.94" drill="1"/>
<pad name="D2" x="15.24" y="-25.4" drill="1"/>
<pad name="D3" x="15.24" y="-22.86" drill="1"/>
<pad name="D4" x="15.24" y="-20.32" drill="1"/>
<pad name="D5" x="15.24" y="-17.78" drill="1"/>
<pad name="D6" x="15.24" y="-15.24" drill="1"/>
<pad name="D7" x="15.24" y="-12.7" drill="1"/>
<pad name="D8" x="15.24" y="-10.16" drill="1"/>
<pad name="D9" x="15.24" y="-7.62" drill="1"/>
<pad name="D10" x="15.24" y="-5.08" drill="1"/>
<pad name="D11" x="15.24" y="-2.54" drill="1"/>
<pad name="D12" x="15.24" y="0" drill="1"/>
<wire x1="-1.27" y1="3.81" x2="-1.27" y2="-39.37" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-39.37" x2="16.51" y2="-39.37" width="0.1524" layer="21"/>
<wire x1="16.51" y1="-39.37" x2="16.51" y2="3.81" width="0.1524" layer="21"/>
<wire x1="16.51" y1="3.81" x2="10.16" y2="3.81" width="0.1524" layer="21"/>
<text x="5.08" y="5.08" size="1.27" layer="25" font="vector" ratio="12">&gt;Name</text>
<text x="4.572" y="-41.275" size="1.27" layer="25" font="vector" ratio="12">&gt;Value</text>
<text x="8.89" y="-26.67" size="1.6764" layer="21" font="vector" rot="R90">Aruduino - NANO</text>
<circle x="0" y="-38.1" radius="0.635" width="0.1524" layer="21"/>
<circle x="15.24" y="-38.1" radius="0.683915625" width="0.1524" layer="21"/>
<circle x="5.08" y="-38.1" radius="0.381" width="0.1524" layer="21"/>
<circle x="7.62" y="-38.1" radius="0.381" width="0.1524" layer="21"/>
<circle x="10.16" y="-38.1" radius="0.40160625" width="0.1524" layer="21"/>
<circle x="5.08" y="-35.56" radius="0.40160625" width="0.1524" layer="21"/>
<circle x="7.62" y="-35.56" radius="0.457903125" width="0.1524" layer="21"/>
<circle x="10.16" y="-35.56" radius="0.457903125" width="0.1524" layer="21"/>
<circle x="0" y="2.54" radius="0.567959375" width="0.1524" layer="21"/>
<circle x="15.367" y="2.54" radius="0.5388125" width="0.1524" layer="21"/>
<wire x1="10.16" y1="3.81" x2="5.08" y2="3.81" width="0.1524" layer="21"/>
<wire x1="5.08" y1="3.81" x2="-1.27" y2="3.81" width="0.1524" layer="21"/>
<wire x1="5.08" y1="3.81" x2="5.08" y2="1.27" width="0.1524" layer="21"/>
<wire x1="5.08" y1="1.27" x2="10.16" y2="1.27" width="0.1524" layer="21"/>
<wire x1="10.16" y1="1.27" x2="10.16" y2="3.81" width="0.1524" layer="21"/>
</package>
<package name="SO16LNB-14PIN">
<description>16-Lead SOIC Narrow Body
Taken from Fairchild Datasheet for transistor array (MMPQ3904)</description>
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
<package name="DC_DC_MODULE">
<pad name="IN-" x="0" y="0" drill="1" shape="square"/>
<pad name="OUT-" x="39.9542" y="0" drill="1" shape="square"/>
<pad name="OUT+" x="39.9542" y="17.3482" drill="1" shape="square"/>
<pad name="IN+" x="0" y="17.3482" drill="1" shape="square"/>
<wire x1="-1.016" y1="18.415" x2="-1.016" y2="-1.016" width="0.127" layer="21"/>
<wire x1="-1.016" y1="-1.016" x2="41.021" y2="-1.016" width="0.127" layer="21"/>
<wire x1="41.021" y1="-1.016" x2="41.021" y2="18.415" width="0.127" layer="21"/>
<wire x1="41.021" y1="18.415" x2="-1.016" y2="18.415" width="0.127" layer="21"/>
<hole x="34.9504" y="0.7112" drill="3.175"/>
<hole x="4.9784" y="16.7386" drill="3.175"/>
<wire x1="21.9964" y1="16.51" x2="31.4198" y2="16.51" width="0.127" layer="21"/>
<wire x1="31.4198" y1="16.51" x2="31.4198" y2="13.97" width="0.127" layer="21"/>
<wire x1="31.4198" y1="13.97" x2="21.9964" y2="13.97" width="0.127" layer="21"/>
<wire x1="21.9964" y1="13.97" x2="21.9964" y2="16.51" width="0.127" layer="21"/>
<circle x="23.495" y="15.24" radius="0.889" width="0.127" layer="21"/>
<wire x1="24.13" y1="15.875" x2="22.987" y2="14.478" width="0.127" layer="21"/>
<circle x="2.54" y="7.62" radius="2.54" width="0.127" layer="21"/>
<circle x="35.56" y="7.62" radius="2.54" width="0.127" layer="21"/>
<wire x1="21.59" y1="0" x2="30.48" y2="0" width="0.127" layer="21"/>
<wire x1="30.48" y1="0" x2="30.48" y2="8.89" width="0.127" layer="21"/>
<wire x1="30.48" y1="8.89" x2="21.59" y2="8.89" width="0.127" layer="21"/>
<wire x1="21.59" y1="8.89" x2="21.59" y2="0" width="0.127" layer="21"/>
<circle x="26.035" y="4.318" radius="3.9431375" width="0.127" layer="21"/>
<wire x1="7.62" y1="15.24" x2="7.62" y2="7.62" width="0.127" layer="21"/>
<wire x1="7.62" y1="7.62" x2="17.78" y2="7.62" width="0.127" layer="21"/>
<wire x1="17.78" y1="7.62" x2="17.78" y2="15.24" width="0.127" layer="21"/>
<wire x1="17.78" y1="15.24" x2="7.62" y2="15.24" width="0.127" layer="21"/>
<text x="7.62" y="3.81" size="1.6764" layer="25" font="vector" ratio="12">&gt;NAME</text>
<text x="7.62" y="0" size="1.6764" layer="21" font="vector" ratio="12">&gt;VALUE</text>
<text x="20.32" y="11.43" size="1.27" layer="25">DC/DC Convertor</text>
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
<pad name="3" x="-2.5" y="0" drill="1"/>
<pad name="2" x="0" y="0" drill="1"/>
<pad name="1" x="2.5" y="0" drill="1" shape="square"/>
<text x="-2.1746" y="-4.7972" size="1.27" layer="21" ratio="12" rot="R90">1</text>
<text x="-5.54" y="-1.94" size="0.8" layer="25" ratio="15" rot="R90">&gt;NAME</text>
<wire x1="5" y1="-3.5" x2="5" y2="2.5" width="0.16" layer="21"/>
<wire x1="-5" y1="2.5" x2="-5" y2="-3.5" width="0.16" layer="21"/>
<wire x1="-5" y1="-3.5" x2="5" y2="-3.5" width="0.16" layer="21"/>
<text x="6.3" y="-2.3" size="0.8" layer="27" ratio="15" rot="R90">&gt;VALUE</text>
<wire x1="5" y1="2.5" x2="3.5" y2="2.5" width="0.16" layer="21"/>
<wire x1="1.5" y1="2.5" x2="-1.5" y2="2.5" width="0.16" layer="21"/>
<wire x1="-5" y1="2.5" x2="-3.5" y2="2.5" width="0.16" layer="21"/>
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
<wire x1="-7.62" y1="15.24" x2="-7.62" y2="7.62" width="0.127" layer="21"/>
<wire x1="-7.62" y1="7.62" x2="-6.35" y2="7.62" width="0.127" layer="21"/>
<circle x="-3.81" y="6.35" radius="0.508" width="0.127" layer="21"/>
<circle x="-3.81" y="16.51" radius="0.508" width="0.127" layer="21"/>
<wire x1="-7.62" y1="15.24" x2="-6.35" y2="15.24" width="0.127" layer="21"/>
<wire x1="20.32" y1="17.78" x2="34.29" y2="17.78" width="0.127" layer="21"/>
<wire x1="34.29" y1="17.78" x2="34.29" y2="5.08" width="0.127" layer="21"/>
<wire x1="34.29" y1="5.08" x2="20.32" y2="5.08" width="0.127" layer="21"/>
<wire x1="20.32" y1="5.08" x2="20.32" y2="17.78" width="0.127" layer="21"/>
<wire x1="35.56" y1="6.35" x2="35.56" y2="17.78" width="0.127" layer="21"/>
<wire x1="35.56" y1="17.78" x2="40.64" y2="17.78" width="0.127" layer="21"/>
<wire x1="40.64" y1="17.78" x2="40.64" y2="15.24" width="0.127" layer="21"/>
<wire x1="40.64" y1="15.24" x2="36.83" y2="15.24" width="0.127" layer="21"/>
<wire x1="36.83" y1="15.24" x2="36.83" y2="12.7" width="0.127" layer="21"/>
<wire x1="36.83" y1="12.7" x2="40.64" y2="12.7" width="0.127" layer="21"/>
<wire x1="40.64" y1="12.7" x2="40.64" y2="10.16" width="0.127" layer="21"/>
<wire x1="40.64" y1="10.16" x2="36.83" y2="10.16" width="0.127" layer="21"/>
<wire x1="36.83" y1="10.16" x2="36.83" y2="7.62" width="0.127" layer="21"/>
<wire x1="36.83" y1="7.62" x2="40.64" y2="7.62" width="0.127" layer="21"/>
<text x="3.81" y="16.51" size="1.4224" layer="25" font="vector" ratio="12">&gt;NAME</text>
<text x="3.81" y="8.89" size="1.4224" layer="27" font="vector" ratio="12">&gt;VALUE</text>
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
<pad name="1" x="1.25" y="0" drill="1" shape="square"/>
<pad name="2" x="-1.25" y="0" drill="1"/>
<text x="5.2972" y="0.6254" size="1.27" layer="21" ratio="12" rot="R180">1</text>
<text x="-4.14" y="-3.14" size="0.8" layer="25" ratio="15" rot="R90">&gt;NAME</text>
<wire x1="3.7" y1="2.5" x2="3.7" y2="-3.5" width="0.16" layer="21"/>
<wire x1="3.7" y1="-3.5" x2="-3.7" y2="-3.5" width="0.16" layer="21"/>
<wire x1="-3.7" y1="-3.5" x2="-3.7" y2="2.5" width="0.16" layer="21"/>
<wire x1="-3.7" y1="2.5" x2="-1.9" y2="2.5" width="0.16" layer="21"/>
<wire x1="3.7" y1="2.5" x2="1.7" y2="2.5" width="0.16" layer="21"/>
<text x="-0.5" y="-4.6" size="0.8" layer="27" ratio="15">&gt;VALUE</text>
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
<wire x1="-3.3" y1="0.3" x2="-2.4" y2="0.3" width="0.1" layer="51"/>
<wire x1="-2.4" y1="0.3" x2="-2.4" y2="1.3" width="0.1" layer="51"/>
<wire x1="-2.4" y1="1.3" x2="-0.2" y2="1.3" width="0.1" layer="51"/>
<wire x1="-0.2" y1="1.3" x2="-0.2" y2="0.3" width="0.1" layer="51"/>
<wire x1="-0.2" y1="0.3" x2="0.2" y2="0.3" width="0.1" layer="51"/>
<wire x1="0.2" y1="0.3" x2="0.2" y2="1.3" width="0.1" layer="51"/>
<wire x1="0.2" y1="1.3" x2="2.4" y2="1.3" width="0.1" layer="51"/>
<wire x1="2.4" y1="1.3" x2="2.4" y2="0.3" width="0.1" layer="51"/>
<wire x1="2.4" y1="0.3" x2="3.3" y2="0.3" width="0.1" layer="51"/>
<wire x1="3.3" y1="0.3" x2="3.3" y2="-2.3" width="0.1" layer="51"/>
<wire x1="-3.3" y1="0.3" x2="-3.3" y2="-2.3" width="0.1" layer="51"/>
<text x="2.31" y="-1.8" size="1.27" layer="51" rot="R90">1</text>
<text x="-4.2" y="0.7" size="0.8" layer="25" ratio="15" rot="R90">&gt;NAME</text>
<text x="4.9" y="0.2" size="0.8" layer="27" ratio="15" rot="R90">&gt;VALUE</text>
<wire x1="3.7" y1="-2.3" x2="3.7" y2="9.2" width="0.16" layer="21"/>
<wire x1="3.7" y1="9.2" x2="-3.7" y2="9.2" width="0.16" layer="21"/>
<wire x1="-3.7" y1="9.2" x2="-3.7" y2="-2.3" width="0.16" layer="21"/>
<wire x1="-3.7" y1="-2.3" x2="-3.3" y2="-2.3" width="0.16" layer="21"/>
<wire x1="-3.3" y1="-2.3" x2="-3.3" y2="0.3" width="0.16" layer="21"/>
<wire x1="3.7" y1="-2.3" x2="3.3" y2="-2.3" width="0.16" layer="21"/>
<wire x1="3.3" y1="-2.3" x2="3.3" y2="0.3" width="0.16" layer="21"/>
<text x="4.55" y="7.85" size="1.27" layer="51">1</text>
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
<package name="JST-XH_098_VERT_1X6">
<description>JST Connector, XH Series, 0.098 Inch, 1x6</description>
<pad name="6" x="-6.25" y="0" drill="1"/>
<pad name="5" x="-3.75" y="0" drill="1"/>
<pad name="4" x="-1.25" y="0" drill="1"/>
<pad name="3" x="1.25" y="0" drill="1"/>
<text x="9.4028" y="-0.4254" size="1" layer="21" ratio="12">1</text>
<text x="-7.34" y="-4.76" size="0.8" layer="25" ratio="15">&gt;NAME</text>
<pad name="2" x="3.75" y="0" drill="1" rot="R90"/>
<pad name="1" x="6.25" y="0" drill="1" shape="square" rot="R90"/>
<wire x1="8.7" y1="2.5" x2="8.7" y2="-3.5" width="0.16" layer="21"/>
<wire x1="8.7" y1="-3.5" x2="-8.7" y2="-3.5" width="0.16" layer="21"/>
<wire x1="-8.7" y1="-3.5" x2="-8.7" y2="2.5" width="0.16" layer="21"/>
<wire x1="-8.7" y1="2.5" x2="-7.25" y2="2.5" width="0.16" layer="21"/>
<wire x1="-5.24" y1="2.5" x2="5.23" y2="2.49" width="0.16" layer="21"/>
<wire x1="8.7" y1="2.5" x2="7.25" y2="2.5" width="0.16" layer="21"/>
<text x="2.9" y="-4.8" size="0.8" layer="27" ratio="15">&gt;VALUE</text>
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
</packages>
<symbols>
<symbol name="ARDUINO-NANO">
<description>Arduino-Nano</description>
<wire x1="10.16" y1="20.32" x2="10.16" y2="-20.32" width="0.254" layer="94"/>
<wire x1="10.16" y1="-20.32" x2="-12.7" y2="-20.32" width="0.254" layer="94"/>
<wire x1="-12.7" y1="-20.32" x2="-12.7" y2="20.32" width="0.254" layer="94"/>
<wire x1="-12.7" y1="20.32" x2="-5.08" y2="20.32" width="0.254" layer="94"/>
<text x="-5.08" y="21.844" size="1.778" layer="95">&gt;NAME</text>
<text x="-5.842" y="-23.368" size="1.778" layer="96">&gt;VALUE</text>
<text x="-2.54" y="10.16" size="2.54" layer="94" rot="R270">Arduino-Nano</text>
<pin name="D12" x="15.24" y="17.78" visible="pin" length="middle" rot="R180"/>
<pin name="D11" x="15.24" y="15.24" visible="pin" length="middle" rot="R180"/>
<pin name="D10" x="15.24" y="12.7" visible="pin" length="middle" rot="R180"/>
<pin name="D9" x="15.24" y="10.16" visible="pin" length="middle" rot="R180"/>
<pin name="D8" x="15.24" y="7.62" visible="pin" length="middle" rot="R180"/>
<pin name="D7" x="15.24" y="5.08" visible="pin" length="middle" rot="R180"/>
<pin name="D6" x="15.24" y="2.54" visible="pin" length="middle" rot="R180"/>
<pin name="D5" x="15.24" y="0" visible="pin" length="middle" rot="R180"/>
<wire x1="-5.08" y1="20.32" x2="2.54" y2="20.32" width="0.254" layer="94"/>
<wire x1="2.54" y1="20.32" x2="10.16" y2="20.32" width="0.254" layer="94"/>
<wire x1="-5.08" y1="20.32" x2="-5.08" y2="15.24" width="0.254" layer="94"/>
<wire x1="-5.08" y1="15.24" x2="2.54" y2="15.24" width="0.254" layer="94"/>
<wire x1="2.54" y1="15.24" x2="2.54" y2="20.32" width="0.254" layer="94"/>
<pin name="D13" x="-17.78" y="17.78" visible="pin" length="middle"/>
<pin name="3.3V" x="-17.78" y="15.24" visible="pin" length="middle"/>
<pin name="REF" x="-17.78" y="12.7" visible="pin" length="middle"/>
<pin name="A0" x="-17.78" y="10.16" visible="pin" length="middle"/>
<pin name="A1" x="-17.78" y="7.62" visible="pin" length="middle"/>
<pin name="A2" x="-17.78" y="5.08" visible="pin" length="middle"/>
<pin name="A3" x="-17.78" y="2.54" visible="pin" length="middle"/>
<pin name="A4-SDA" x="-17.78" y="0" visible="pin" length="middle"/>
<pin name="A5-SCL" x="-17.78" y="-2.54" visible="pin" length="middle"/>
<pin name="A6" x="-17.78" y="-5.08" visible="pin" length="middle"/>
<pin name="A7" x="-17.78" y="-7.62" visible="pin" length="middle"/>
<pin name="5.0V" x="-17.78" y="-10.16" visible="pin" length="middle"/>
<pin name="RST" x="-17.78" y="-12.7" visible="pin" length="middle"/>
<pin name="GND" x="-17.78" y="-15.24" visible="pin" length="middle" direction="pwr"/>
<pin name="VIN" x="-17.78" y="-17.78" visible="pin" length="middle" direction="pas"/>
<pin name="TX" x="15.24" y="-17.78" visible="pin" length="middle" rot="R180"/>
<pin name="RX" x="15.24" y="-15.24" visible="pin" length="middle" rot="R180"/>
<pin name="RST2" x="15.24" y="-12.7" visible="pin" length="middle" rot="R180"/>
<pin name="GND2" x="15.24" y="-10.16" visible="pin" length="middle" direction="pas" rot="R180"/>
<pin name="D4" x="15.24" y="-2.54" visible="pin" length="middle" rot="R180"/>
<pin name="D2" x="15.24" y="-7.62" visible="pin" length="middle" rot="R180"/>
<pin name="D3" x="15.24" y="-5.08" visible="pin" length="middle" rot="R180"/>
<circle x="-3.81" y="-15.24" radius="0.567959375" width="0.254" layer="94"/>
<circle x="-1.27" y="-15.24" radius="0.567959375" width="0.254" layer="94"/>
<circle x="1.27" y="-15.24" radius="0.567959375" width="0.254" layer="94"/>
<circle x="-3.81" y="-17.78" radius="0.567959375" width="0.254" layer="94"/>
<circle x="-1.27" y="-17.78" radius="0.567959375" width="0.254" layer="94"/>
<circle x="1.27" y="-17.78" radius="0.567959375" width="0.254" layer="94"/>
<text x="2.286" y="-5.842" size="0.8128" layer="94" ratio="10">pwm</text>
<text x="2.286" y="-0.762" size="0.8128" layer="94" ratio="10">pwm</text>
<text x="2.286" y="1.778" size="0.8128" layer="94" ratio="10">pwm</text>
<text x="2.286" y="9.398" size="0.8128" layer="94" ratio="10">pwm</text>
<text x="1.524" y="11.938" size="0.8128" layer="94" ratio="10">pwm</text>
<text x="1.524" y="14.224" size="0.8128" layer="94" ratio="10">pwm</text>
</symbol>
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
<pin name="-IN" x="-10.16" y="-2.54" visible="off" length="middle" direction="in"/>
<pin name="+IN" x="-10.16" y="2.54" visible="off" length="middle" direction="in"/>
<pin name="OUT" x="10.16" y="0" visible="off" length="middle" direction="out" rot="R180"/>
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
<pin name="-IN" x="-10.16" y="-2.54" visible="off" length="middle" direction="in"/>
<pin name="+IN" x="-10.16" y="2.54" visible="off" length="middle" direction="in"/>
<pin name="OUT" x="10.16" y="0" visible="off" length="middle" direction="out" rot="R180"/>
<pin name="P+" x="0" y="7.62" visible="off" length="middle" direction="pas" rot="R270"/>
<pin name="P-" x="0" y="-7.62" visible="off" length="middle" direction="pas" rot="R90"/>
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
<symbol name="DC_DC_MODULE">
<pin name="IN" x="-5.08" y="7.62" visible="off" length="middle" direction="pas"/>
<pin name="G1" x="-5.08" y="0" visible="off" length="middle" direction="pas"/>
<pin name="OUT" x="20.32" y="7.62" visible="off" length="middle" direction="pas" rot="R180"/>
<pin name="G2" x="20.32" y="0" visible="off" length="middle" direction="pas" rot="R180"/>
<wire x1="0" y1="10.16" x2="0" y2="-2.54" width="0.254" layer="94"/>
<wire x1="0" y1="-2.54" x2="15.24" y2="-2.54" width="0.254" layer="94"/>
<wire x1="15.24" y1="-2.54" x2="15.24" y2="10.16" width="0.254" layer="94"/>
<wire x1="15.24" y1="10.16" x2="0" y2="10.16" width="0.254" layer="94"/>
<text x="1.016" y="7.112" size="1.6764" layer="94">In</text>
<text x="10.668" y="6.858" size="1.6764" layer="94">Out</text>
<text x="1.016" y="-0.762" size="1.6764" layer="94">GND</text>
<text x="9.652" y="-0.762" size="1.6764" layer="94">GND</text>
<circle x="10.414" y="3.81" radius="1.135921875" width="0.254" layer="94"/>
<wire x1="10.922" y1="4.826" x2="9.906" y2="3.048" width="0.254" layer="94"/>
<text x="5.588" y="3.302" size="1.6764" layer="94">Adj</text>
<text x="3.556" y="10.922" size="1.6764" layer="95">&gt;NAME</text>
<text x="3.048" y="-4.572" size="1.6764" layer="96">&gt;VALUE</text>
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
</symbols>
<devicesets>
<deviceset name="ARDUINO-NANO" prefix="UU">
<gates>
<gate name="G$1" symbol="ARDUINO-NANO" x="5.08" y="5.08"/>
</gates>
<devices>
<device name="" package="ARDUINO-NANO">
<connects>
<connect gate="G$1" pin="3.3V" pad="3.3"/>
<connect gate="G$1" pin="5.0V" pad="5V"/>
<connect gate="G$1" pin="A0" pad="A0"/>
<connect gate="G$1" pin="A1" pad="A1"/>
<connect gate="G$1" pin="A2" pad="A2"/>
<connect gate="G$1" pin="A3" pad="A3"/>
<connect gate="G$1" pin="A4-SDA" pad="A4"/>
<connect gate="G$1" pin="A5-SCL" pad="A5"/>
<connect gate="G$1" pin="A6" pad="A6"/>
<connect gate="G$1" pin="A7" pad="A7"/>
<connect gate="G$1" pin="D10" pad="D10"/>
<connect gate="G$1" pin="D11" pad="D11"/>
<connect gate="G$1" pin="D12" pad="D12"/>
<connect gate="G$1" pin="D13" pad="D13"/>
<connect gate="G$1" pin="D2" pad="D2"/>
<connect gate="G$1" pin="D3" pad="D3"/>
<connect gate="G$1" pin="D4" pad="D4"/>
<connect gate="G$1" pin="D5" pad="D5"/>
<connect gate="G$1" pin="D6" pad="D6"/>
<connect gate="G$1" pin="D7" pad="D7"/>
<connect gate="G$1" pin="D8" pad="D8"/>
<connect gate="G$1" pin="D9" pad="D9"/>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="GND2" pad="GND2"/>
<connect gate="G$1" pin="REF" pad="REF"/>
<connect gate="G$1" pin="RST" pad="RST"/>
<connect gate="G$1" pin="RST2" pad="RST2"/>
<connect gate="G$1" pin="RX" pad="RX"/>
<connect gate="G$1" pin="TX" pad="TX"/>
<connect gate="G$1" pin="VIN" pad="VIN"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
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
<device name="SIP" package="TRIMPOT_SIP_100">
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
<deviceset name="DC_DC_MODULE" prefix="M">
<gates>
<gate name="G$1" symbol="DC_DC_MODULE" x="-5.08" y="-2.54"/>
</gates>
<devices>
<device name="" package="DC_DC_MODULE">
<connects>
<connect gate="G$1" pin="G1" pad="IN-"/>
<connect gate="G$1" pin="G2" pad="OUT-"/>
<connect gate="G$1" pin="IN" pad="IN+"/>
<connect gate="G$1" pin="OUT" pad="OUT+"/>
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
<device name="-XH" package="JST-XH_098_VERT_1X3">
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
<device name="-XH" package="JST-XH_098_VERT_1X2">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-SIDE" package="JST-XH_098_HORZ_1X2">
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
<deviceset name="PINHDR_1X6" prefix="J">
<gates>
<gate name="G$1" symbol="PINHDR_1X6" x="0" y="-5.08"/>
</gates>
<devices>
<device name="-XH" package="JST-XH_098_VERT_1X6">
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
<part name="M2" library="Dal_V2" deviceset="ARDUINO-NANO" device=""/>
<part name="SUPPLY1" library="Dal_V2" deviceset="+5V" device=""/>
<part name="GND1" library="Dal_V2" deviceset="GND" device=""/>
<part name="GND2" library="Dal_V2" deviceset="GND" device=""/>
<part name="U1" library="Dal_V2" deviceset="LM2902" device=""/>
<part name="GND3" library="Dal_V2" deviceset="GND" device=""/>
<part name="R4" library="Dal_V2" deviceset="R" device="1206(3216METRIC)" value="10K"/>
<part name="R5" library="Dal_V2" deviceset="R" device="1206(3216METRIC)" value="10K"/>
<part name="R6" library="Dal_V2" deviceset="R" device="1206(3216METRIC)" value="10K"/>
<part name="R7" library="Dal_V2" deviceset="R" device="1206(3216METRIC)" value="10K"/>
<part name="SUPPLY2" library="Dal_V2" deviceset="+5V" device=""/>
<part name="P1" library="Dal_V2" deviceset="TRIMPOT" device="SIP" value="10K"/>
<part name="GND4" library="Dal_V2" deviceset="GND" device=""/>
<part name="LED1" library="Dal_V2" deviceset="LED" device="1206" value="IR Emitter LED"/>
<part name="R1" library="Dal_V2" deviceset="R" device="1206(3216METRIC)" value="100"/>
<part name="GND5" library="Dal_V2" deviceset="GND" device=""/>
<part name="T1" library="Dal_V2" deviceset="T_NPN" device=""/>
<part name="GND6" library="Dal_V2" deviceset="GND" device=""/>
<part name="M3" library="Dal_V2" deviceset="DC_DC_MODULE" device=""/>
<part name="GND7" library="Dal_V2" deviceset="GND" device=""/>
<part name="J5" library="Dal_V2" deviceset="PINHDR_1X3" device="-100"/>
<part name="GND8" library="Dal_V2" deviceset="GND" device=""/>
<part name="M1" library="Dal_V2" deviceset="ESP8266_MODULE" device=""/>
<part name="J3" library="Dal_V2" deviceset="PINHDR_1X2" device="-100"/>
<part name="GND9" library="Dal_V2" deviceset="GND" device=""/>
<part name="GND10" library="Dal_V2" deviceset="GND" device=""/>
<part name="GND11" library="Dal_V2" deviceset="GND" device=""/>
<part name="GND12" library="Dal_V2" deviceset="GND" device=""/>
<part name="J4" library="Dal_V2" deviceset="PINHDR_1X3" device="-100"/>
<part name="GND13" library="Dal_V2" deviceset="GND" device=""/>
<part name="R2" library="Dal_V2" deviceset="R" device="1206(3216METRIC)" value="3K"/>
<part name="R3" library="Dal_V2" deviceset="R" device="1206(3216METRIC)" value="2K"/>
<part name="GND14" library="Dal_V2" deviceset="GND" device=""/>
<part name="GND15" library="Dal_V2" deviceset="GND" device=""/>
<part name="J1" library="Dal_V2" deviceset="PINHDR_1X6" device="-XH"/>
<part name="J2" library="Dal_V2" deviceset="PINHDR_1X6" device="-XH"/>
<part name="GND16" library="Dal_V2" deviceset="GND" device=""/>
<part name="GND17" library="Dal_V2" deviceset="GND" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<text x="-67.818" y="22.352" size="1.778" layer="97">Emitter Circuit Draws about 14 mA</text>
<text x="-67.31" y="15.748" size="1.778" layer="97">Nano can supply max 100 mA
for all 4 emitters.  </text>
<text x="-66.04" y="55.88" size="1.778" layer="97">IR Light 
Controls 
Base</text>
<wire x1="-68.58" y1="66.04" x2="-68.58" y2="68.58" width="0.1524" layer="97"/>
<wire x1="-68.58" y1="68.58" x2="-33.02" y2="68.58" width="0.1524" layer="97"/>
<wire x1="-33.02" y1="68.58" x2="-33.02" y2="66.04" width="0.1524" layer="97"/>
<text x="-68.58" y="71.12" size="1.778" layer="97">Detector and Emitter Circuits
4 of each around Ring</text>
<text x="-47.244" y="59.69" size="1.778" layer="97">white</text>
<text x="-47.244" y="64.77" size="1.778" layer="97">yellow</text>
<text x="-67.056" y="34.544" size="1.778" layer="97" rot="R90">black</text>
<text x="-39.878" y="41.656" size="1.778" layer="97">red</text>
<text x="131.572" y="103.124" size="1.4224" layer="97">TO NEO 1</text>
<text x="2.54" y="116.84" size="5.08" layer="97">MOVING TARGET UNIT</text>
<text x="131.826" y="86.106" size="1.4224" layer="97">TO NEO 2</text>
<text x="-63.5" y="34.29" size="1.4224" layer="97">IR Emitter
LED</text>
<text x="-52.07" y="56.896" size="1.016" layer="97">(Long Lead)</text>
<text x="-59.944" y="41.402" size="1.016" layer="97">(Long Lead)</text>
<text x="-43.18" y="-7.62" size="1.6764" layer="97">2S Lipo Bat
6.0-7.8 Volts</text>
<text x="-7.62" y="-20.32" size="1.4224" layer="97">Full Scale = 3.3v for 
Input of 8.25 volts</text>
</plain>
<instances>
<instance part="M2" gate="G$1" x="88.9" y="48.26" smashed="yes">
<attribute name="NAME" x="83.82" y="70.104" size="1.778" layer="95"/>
<attribute name="VALUE" x="78.486" y="25.654" size="1.778" layer="96"/>
</instance>
<instance part="SUPPLY1" gate="+5V" x="50.8" y="43.18" smashed="yes">
<attribute name="VALUE" x="48.895" y="46.355" size="1.778" layer="96"/>
</instance>
<instance part="GND1" gate="GND" x="25.4" y="0" smashed="yes"/>
<instance part="GND2" gate="GND" x="66.04" y="25.4" smashed="yes"/>
<instance part="U1" gate="G$2" x="25.4" y="73.66" smashed="yes">
<attribute name="NAME" x="27.94" y="68.58" size="1.778" layer="95"/>
<attribute name="VALUE" x="27.94" y="66.04" size="1.778" layer="96"/>
</instance>
<instance part="U1" gate="G$3" x="25.4" y="35.56" smashed="yes">
<attribute name="NAME" x="27.94" y="30.48" size="1.778" layer="95"/>
<attribute name="VALUE" x="27.94" y="27.94" size="1.778" layer="96"/>
</instance>
<instance part="U1" gate="G$4" x="25.4" y="55.88" smashed="yes">
<attribute name="NAME" x="27.94" y="50.8" size="1.778" layer="95"/>
<attribute name="VALUE" x="27.94" y="48.26" size="1.778" layer="96"/>
</instance>
<instance part="U1" gate="G$1" x="25.4" y="15.24" smashed="yes">
<attribute name="NAME" x="27.94" y="10.16" size="1.778" layer="95"/>
<attribute name="VALUE" x="27.94" y="7.62" size="1.778" layer="96"/>
</instance>
<instance part="GND3" gate="GND" x="71.12" y="91.44" smashed="yes"/>
<instance part="R4" gate="G$1" x="10.16" y="81.28" smashed="yes" rot="R90">
<attribute name="NAME" x="8.382" y="79.756" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="12.954" y="78.994" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="R5" gate="G$1" x="10.16" y="63.5" smashed="yes" rot="R90">
<attribute name="NAME" x="8.382" y="61.214" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="12.954" y="60.706" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="R6" gate="G$1" x="10.16" y="43.18" smashed="yes" rot="R90">
<attribute name="NAME" x="8.382" y="41.402" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="12.954" y="40.64" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="R7" gate="G$1" x="10.16" y="22.86" smashed="yes" rot="R90">
<attribute name="NAME" x="8.128" y="21.082" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="13.208" y="20.574" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="SUPPLY2" gate="+5V" x="2.54" y="88.9" smashed="yes">
<attribute name="VALUE" x="0.635" y="92.075" size="1.778" layer="96"/>
</instance>
<instance part="P1" gate="G$1" x="2.54" y="7.62" smashed="yes" rot="R90">
<attribute name="NAME" x="0" y="5.08" size="1.27" layer="95" rot="R90"/>
<attribute name="VALUE" x="6.35" y="10.16" size="1.27" layer="96" rot="R90"/>
</instance>
<instance part="GND4" gate="GND" x="2.54" y="0" smashed="yes"/>
<instance part="LED1" gate="G$1" x="-63.5" y="40.64" smashed="yes"/>
<instance part="R1" gate="G$1" x="-45.72" y="40.64" smashed="yes">
<attribute name="VALUE" x="-48.768" y="37.846" size="1.778" layer="96"/>
</instance>
<instance part="GND5" gate="GND" x="-66.04" y="30.48" smashed="yes"/>
<instance part="T1" gate="G$1" x="-50.8" y="60.96" smashed="yes"/>
<instance part="GND6" gate="GND" x="-40.64" y="53.34" smashed="yes"/>
<instance part="M3" gate="G$1" x="78.74" y="96.52" smashed="yes">
<attribute name="NAME" x="82.296" y="107.442" size="1.6764" layer="95"/>
<attribute name="VALUE" x="76.962" y="91.186" size="1.6764" layer="96"/>
</instance>
<instance part="GND7" gate="GND" x="101.6" y="91.44" smashed="yes"/>
<instance part="J5" gate="G$1" x="127" y="86.36" smashed="yes" rot="MR0">
<attribute name="NAME" x="128.27" y="89.916" size="1.778" layer="95" rot="MR0"/>
</instance>
<instance part="GND8" gate="GND" x="119.38" y="76.2" smashed="yes"/>
<instance part="M1" gate="G$1" x="76.2" y="15.24" smashed="yes">
<attribute name="NAME" x="83.82" y="18.796" size="1.6764" layer="95"/>
<attribute name="VALUE" x="78.486" y="-25.4" size="1.6764" layer="96"/>
</instance>
<instance part="J3" gate="G$1" x="-25.4" y="-5.08" smashed="yes">
<attribute name="NAME" x="-29.972" y="-2.032" size="1.778" layer="95"/>
</instance>
<instance part="GND9" gate="GND" x="-17.78" y="-12.7" smashed="yes"/>
<instance part="GND10" gate="GND" x="114.3" y="-10.16" smashed="yes"/>
<instance part="GND11" gate="GND" x="63.5" y="-30.48" smashed="yes"/>
<instance part="GND12" gate="GND" x="114.3" y="22.86" smashed="yes"/>
<instance part="J4" gate="G$1" x="127" y="104.14" smashed="yes" rot="MR0">
<attribute name="NAME" x="128.27" y="107.696" size="1.778" layer="95" rot="MR0"/>
</instance>
<instance part="GND13" gate="GND" x="119.38" y="93.98" smashed="yes"/>
<instance part="R2" gate="G$1" x="-10.16" y="-10.16" smashed="yes" rot="R90">
<attribute name="NAME" x="-12.192" y="-11.938" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="-7.112" y="-12.446" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="R3" gate="G$1" x="-10.16" y="-22.86" smashed="yes" rot="R90">
<attribute name="NAME" x="-12.192" y="-24.638" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="-7.112" y="-25.146" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="GND14" gate="GND" x="-10.16" y="-33.02" smashed="yes"/>
<instance part="GND15" gate="GND" x="50.8" y="5.08" smashed="yes"/>
<instance part="J1" gate="G$1" x="-25.4" y="58.42" smashed="yes">
<attribute name="NAME" x="-28.956" y="66.548" size="1.778" layer="95"/>
</instance>
<instance part="J2" gate="G$1" x="-25.4" y="35.56" smashed="yes">
<attribute name="NAME" x="-28.956" y="43.688" size="1.778" layer="95"/>
</instance>
<instance part="GND16" gate="GND" x="-17.78" y="45.72" smashed="yes"/>
<instance part="GND17" gate="GND" x="-17.78" y="22.86" smashed="yes"/>
</instances>
<busses>
</busses>
<nets>
<net name="IRE_1" class="0">
<segment>
<wire x1="-15.24" y1="40.64" x2="-20.32" y2="40.64" width="0.1524" layer="91"/>
<label x="-20.32" y="41.656" size="1.4224" layer="95"/>
<pinref part="J2" gate="G$1" pin="1"/>
</segment>
<segment>
<pinref part="M2" gate="G$1" pin="D2"/>
<wire x1="104.14" y1="40.64" x2="112.014" y2="40.64" width="0.1524" layer="91"/>
<label x="105.156" y="41.148" size="1.4224" layer="95"/>
</segment>
</net>
<net name="IRE_2" class="0">
<segment>
<wire x1="-20.32" y1="38.1" x2="-15.24" y2="38.1" width="0.1524" layer="91"/>
<label x="-20.574" y="38.862" size="1.4224" layer="95"/>
<pinref part="J2" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="M2" gate="G$1" pin="D3"/>
<wire x1="104.14" y1="43.18" x2="111.76" y2="43.18" width="0.1524" layer="91"/>
<label x="105.156" y="43.688" size="1.4224" layer="95"/>
</segment>
</net>
<net name="IRE_3" class="0">
<segment>
<wire x1="-15.24" y1="35.56" x2="-20.32" y2="35.56" width="0.1524" layer="91"/>
<label x="-20.32" y="36.322" size="1.4224" layer="95"/>
<pinref part="J2" gate="G$1" pin="3"/>
</segment>
<segment>
<pinref part="M2" gate="G$1" pin="D8"/>
<wire x1="104.14" y1="55.88" x2="111.76" y2="55.88" width="0.1524" layer="91"/>
<label x="104.902" y="56.388" size="1.4224" layer="95"/>
</segment>
</net>
<net name="IRE_4" class="0">
<segment>
<wire x1="-20.32" y1="33.02" x2="-15.24" y2="33.02" width="0.1524" layer="91"/>
<label x="-20.32" y="33.782" size="1.4224" layer="95"/>
<pinref part="J2" gate="G$1" pin="4"/>
</segment>
<segment>
<pinref part="M2" gate="G$1" pin="D9"/>
<wire x1="104.14" y1="58.42" x2="111.76" y2="58.42" width="0.1524" layer="91"/>
<label x="104.902" y="58.928" size="1.4224" layer="95"/>
</segment>
</net>
<net name="IRD_1" class="0">
<segment>
<pinref part="M2" gate="G$1" pin="D4"/>
<wire x1="104.14" y1="45.72" x2="111.76" y2="45.72" width="0.1524" layer="91"/>
<label x="104.902" y="46.228" size="1.4224" layer="95"/>
</segment>
<segment>
<pinref part="U1" gate="G$2" pin="OUT"/>
<wire x1="35.56" y1="73.66" x2="45.72" y2="73.66" width="0.1524" layer="91"/>
<label x="38.862" y="74.676" size="1.4224" layer="95"/>
</segment>
</net>
<net name="IRD_2" class="0">
<segment>
<pinref part="M2" gate="G$1" pin="D5"/>
<wire x1="111.76" y1="48.26" x2="104.14" y2="48.26" width="0.1524" layer="91"/>
<label x="104.902" y="48.768" size="1.4224" layer="95"/>
</segment>
<segment>
<pinref part="U1" gate="G$4" pin="OUT"/>
<wire x1="35.56" y1="55.88" x2="45.72" y2="55.88" width="0.1524" layer="91"/>
<label x="38.862" y="56.642" size="1.4224" layer="95"/>
</segment>
</net>
<net name="IRD_3" class="0">
<segment>
<pinref part="M2" gate="G$1" pin="D6"/>
<wire x1="104.14" y1="50.8" x2="111.76" y2="50.8" width="0.1524" layer="91"/>
<label x="104.902" y="51.308" size="1.4224" layer="95"/>
</segment>
<segment>
<pinref part="U1" gate="G$3" pin="OUT"/>
<wire x1="35.56" y1="35.56" x2="45.72" y2="35.56" width="0.1524" layer="91"/>
<label x="39.37" y="36.576" size="1.4224" layer="95"/>
</segment>
</net>
<net name="IRD_4" class="0">
<segment>
<pinref part="M2" gate="G$1" pin="D7"/>
<wire x1="111.76" y1="53.34" x2="104.14" y2="53.34" width="0.1524" layer="91"/>
<label x="104.902" y="53.848" size="1.4224" layer="95"/>
</segment>
<segment>
<pinref part="U1" gate="G$1" pin="OUT"/>
<wire x1="35.56" y1="15.24" x2="45.72" y2="15.24" width="0.1524" layer="91"/>
<label x="38.862" y="17.018" size="1.4224" layer="95"/>
</segment>
</net>
<net name="+5V" class="0">
<segment>
<pinref part="M2" gate="G$1" pin="5.0V"/>
<wire x1="71.12" y1="38.1" x2="50.8" y2="38.1" width="0.1524" layer="91"/>
<wire x1="50.8" y1="38.1" x2="50.8" y2="40.64" width="0.1524" layer="91"/>
<pinref part="SUPPLY1" gate="+5V" pin="+5V"/>
<pinref part="U1" gate="G$1" pin="P+"/>
<wire x1="25.4" y1="22.86" x2="50.8" y2="22.86" width="0.1524" layer="91"/>
<wire x1="50.8" y1="22.86" x2="50.8" y2="38.1" width="0.1524" layer="91"/>
<junction x="50.8" y="38.1"/>
</segment>
<segment>
<pinref part="R7" gate="G$1" pin="2"/>
<wire x1="10.16" y1="27.94" x2="2.54" y2="27.94" width="0.1524" layer="91"/>
<pinref part="R4" gate="G$1" pin="2"/>
<wire x1="2.54" y1="27.94" x2="2.54" y2="48.26" width="0.1524" layer="91"/>
<wire x1="2.54" y1="48.26" x2="2.54" y2="68.58" width="0.1524" layer="91"/>
<wire x1="2.54" y1="68.58" x2="2.54" y2="86.36" width="0.1524" layer="91"/>
<wire x1="2.54" y1="86.36" x2="10.16" y2="86.36" width="0.1524" layer="91"/>
<pinref part="R5" gate="G$1" pin="2"/>
<wire x1="10.16" y1="68.58" x2="2.54" y2="68.58" width="0.1524" layer="91"/>
<junction x="2.54" y="68.58"/>
<pinref part="R6" gate="G$1" pin="2"/>
<wire x1="10.16" y1="48.26" x2="2.54" y2="48.26" width="0.1524" layer="91"/>
<junction x="2.54" y="48.26"/>
<pinref part="SUPPLY2" gate="+5V" pin="+5V"/>
<junction x="2.54" y="86.36"/>
<junction x="2.54" y="27.94"/>
<pinref part="P1" gate="G$1" pin="P$3"/>
<wire x1="2.54" y1="27.94" x2="2.54" y2="12.7" width="0.1524" layer="91"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="P-"/>
<pinref part="GND1" gate="GND" pin="GND"/>
<wire x1="25.4" y1="7.62" x2="25.4" y2="2.54" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="GND2" gate="GND" pin="GND"/>
<wire x1="66.04" y1="27.94" x2="66.04" y2="33.02" width="0.1524" layer="91"/>
<pinref part="M2" gate="G$1" pin="GND"/>
<wire x1="66.04" y1="33.02" x2="71.12" y2="33.02" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="P1" gate="G$1" pin="P$1"/>
<pinref part="GND4" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="LED1" gate="G$1" pin="CATHODE"/>
<wire x1="-66.04" y1="40.64" x2="-66.04" y2="33.02" width="0.1524" layer="91"/>
<pinref part="GND5" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="T1" gate="G$1" pin="EMITTER"/>
<wire x1="-48.26" y1="58.42" x2="-40.64" y2="58.42" width="0.1524" layer="91"/>
<wire x1="-40.64" y1="58.42" x2="-40.64" y2="55.88" width="0.1524" layer="91"/>
<pinref part="GND6" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="GND3" gate="GND" pin="GND"/>
<wire x1="71.12" y1="93.98" x2="71.12" y2="96.52" width="0.1524" layer="91"/>
<pinref part="M3" gate="G$1" pin="G1"/>
<wire x1="71.12" y1="96.52" x2="73.66" y2="96.52" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="M3" gate="G$1" pin="G2"/>
<wire x1="99.06" y1="96.52" x2="101.6" y2="96.52" width="0.1524" layer="91"/>
<pinref part="GND7" gate="GND" pin="GND"/>
<wire x1="101.6" y1="96.52" x2="101.6" y2="93.98" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="J5" gate="G$1" pin="3"/>
<wire x1="121.92" y1="81.28" x2="119.38" y2="81.28" width="0.1524" layer="91"/>
<wire x1="119.38" y1="81.28" x2="119.38" y2="78.74" width="0.1524" layer="91"/>
<pinref part="GND8" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="GND9" gate="GND" pin="GND"/>
<wire x1="-17.78" y1="-10.16" x2="-17.78" y2="-7.62" width="0.1524" layer="91"/>
<pinref part="J3" gate="G$1" pin="2"/>
<wire x1="-17.78" y1="-7.62" x2="-20.32" y2="-7.62" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="M1" gate="G$1" pin="P$25"/>
<wire x1="104.14" y1="2.54" x2="114.3" y2="2.54" width="0.1524" layer="91"/>
<wire x1="114.3" y1="2.54" x2="114.3" y2="-7.62" width="0.1524" layer="91"/>
<pinref part="GND10" gate="GND" pin="GND"/>
<pinref part="M1" gate="G$1" pin="P$29"/>
<wire x1="104.14" y1="12.7" x2="114.3" y2="12.7" width="0.1524" layer="91"/>
<wire x1="114.3" y1="12.7" x2="114.3" y2="2.54" width="0.1524" layer="91"/>
<junction x="114.3" y="2.54"/>
</segment>
<segment>
<pinref part="M1" gate="G$1" pin="P$9"/>
<wire x1="71.12" y1="-5.08" x2="63.5" y2="-5.08" width="0.1524" layer="91"/>
<wire x1="63.5" y1="-5.08" x2="63.5" y2="-27.94" width="0.1524" layer="91"/>
<pinref part="GND11" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="M2" gate="G$1" pin="GND2"/>
<wire x1="104.14" y1="38.1" x2="114.3" y2="38.1" width="0.1524" layer="91"/>
<wire x1="114.3" y1="38.1" x2="114.3" y2="25.4" width="0.1524" layer="91"/>
<pinref part="GND12" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="J4" gate="G$1" pin="3"/>
<wire x1="121.92" y1="99.06" x2="119.38" y2="99.06" width="0.1524" layer="91"/>
<wire x1="119.38" y1="99.06" x2="119.38" y2="96.52" width="0.1524" layer="91"/>
<pinref part="GND13" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="R3" gate="G$1" pin="1"/>
<pinref part="GND14" gate="GND" pin="GND"/>
<wire x1="-10.16" y1="-27.94" x2="-10.16" y2="-30.48" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="M1" gate="G$1" pin="P$2"/>
<wire x1="71.12" y1="12.7" x2="50.8" y2="12.7" width="0.1524" layer="91"/>
<wire x1="50.8" y1="12.7" x2="50.8" y2="7.62" width="0.1524" layer="91"/>
<pinref part="GND15" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="J1" gate="G$1" pin="5"/>
<wire x1="-20.32" y1="53.34" x2="-17.78" y2="53.34" width="0.1524" layer="91"/>
<wire x1="-17.78" y1="53.34" x2="-17.78" y2="50.8" width="0.1524" layer="91"/>
<pinref part="J1" gate="G$1" pin="6"/>
<wire x1="-17.78" y1="50.8" x2="-20.32" y2="50.8" width="0.1524" layer="91"/>
<wire x1="-17.78" y1="50.8" x2="-17.78" y2="48.26" width="0.1524" layer="91"/>
<junction x="-17.78" y="50.8"/>
<pinref part="GND16" gate="GND" pin="GND"/>
</segment>
<segment>
<pinref part="J2" gate="G$1" pin="5"/>
<wire x1="-20.32" y1="30.48" x2="-17.78" y2="30.48" width="0.1524" layer="91"/>
<wire x1="-17.78" y1="30.48" x2="-17.78" y2="27.94" width="0.1524" layer="91"/>
<pinref part="J2" gate="G$1" pin="6"/>
<wire x1="-17.78" y1="27.94" x2="-20.32" y2="27.94" width="0.1524" layer="91"/>
<wire x1="-17.78" y1="27.94" x2="-17.78" y2="25.4" width="0.1524" layer="91"/>
<junction x="-17.78" y="27.94"/>
<pinref part="GND17" gate="GND" pin="GND"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<wire x1="-20.32" y1="63.5" x2="-12.7" y2="63.5" width="0.1524" layer="91"/>
<wire x1="-12.7" y1="63.5" x2="-12.7" y2="76.2" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$2" pin="+IN"/>
<wire x1="-12.7" y1="76.2" x2="10.16" y2="76.2" width="0.1524" layer="91"/>
<pinref part="R4" gate="G$1" pin="1"/>
<wire x1="10.16" y1="76.2" x2="15.24" y2="76.2" width="0.1524" layer="91"/>
<junction x="10.16" y="76.2"/>
<pinref part="J1" gate="G$1" pin="1"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<wire x1="-20.32" y1="60.96" x2="-7.62" y2="60.96" width="0.1524" layer="91"/>
<wire x1="-7.62" y1="60.96" x2="-7.62" y2="58.42" width="0.1524" layer="91"/>
<pinref part="R5" gate="G$1" pin="1"/>
<wire x1="-7.62" y1="58.42" x2="10.16" y2="58.42" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$4" pin="+IN"/>
<wire x1="10.16" y1="58.42" x2="15.24" y2="58.42" width="0.1524" layer="91"/>
<junction x="10.16" y="58.42"/>
<pinref part="J1" gate="G$1" pin="2"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<wire x1="-20.32" y1="58.42" x2="-10.16" y2="58.42" width="0.1524" layer="91"/>
<pinref part="R6" gate="G$1" pin="1"/>
<wire x1="-10.16" y1="58.42" x2="-10.16" y2="38.1" width="0.1524" layer="91"/>
<wire x1="-10.16" y1="38.1" x2="10.16" y2="38.1" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$3" pin="+IN"/>
<wire x1="10.16" y1="38.1" x2="15.24" y2="38.1" width="0.1524" layer="91"/>
<junction x="10.16" y="38.1"/>
<pinref part="J1" gate="G$1" pin="3"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<wire x1="-20.32" y1="55.88" x2="-12.7" y2="55.88" width="0.1524" layer="91"/>
<pinref part="R7" gate="G$1" pin="1"/>
<wire x1="-12.7" y1="55.88" x2="-12.7" y2="17.78" width="0.1524" layer="91"/>
<wire x1="-12.7" y1="17.78" x2="10.16" y2="17.78" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$1" pin="+IN"/>
<wire x1="10.16" y1="17.78" x2="15.24" y2="17.78" width="0.1524" layer="91"/>
<junction x="10.16" y="17.78"/>
<pinref part="J1" gate="G$1" pin="4"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<pinref part="U1" gate="G$1" pin="-IN"/>
<pinref part="U1" gate="G$3" pin="-IN"/>
<wire x1="15.24" y1="12.7" x2="15.24" y2="33.02" width="0.1524" layer="91"/>
<pinref part="U1" gate="G$4" pin="-IN"/>
<wire x1="15.24" y1="33.02" x2="15.24" y2="53.34" width="0.1524" layer="91"/>
<junction x="15.24" y="33.02"/>
<pinref part="U1" gate="G$2" pin="-IN"/>
<wire x1="15.24" y1="53.34" x2="15.24" y2="71.12" width="0.1524" layer="91"/>
<junction x="15.24" y="53.34"/>
<pinref part="P1" gate="G$1" pin="P$2"/>
<wire x1="15.24" y1="12.7" x2="15.24" y2="7.62" width="0.1524" layer="91"/>
<wire x1="15.24" y1="7.62" x2="7.62" y2="7.62" width="0.1524" layer="91"/>
<junction x="15.24" y="12.7"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="R1" gate="G$1" pin="2"/>
<wire x1="-33.02" y1="40.64" x2="-40.64" y2="40.64" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<pinref part="R1" gate="G$1" pin="1"/>
<pinref part="LED1" gate="G$1" pin="ANODE"/>
<wire x1="-50.8" y1="40.64" x2="-58.42" y2="40.64" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<pinref part="T1" gate="G$1" pin="COLLECTOR"/>
<wire x1="-48.26" y1="63.5" x2="-35.56" y2="63.5" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SPI_CS" class="0">
<segment>
<pinref part="M2" gate="G$1" pin="D10"/>
<wire x1="104.14" y1="60.96" x2="114.3" y2="60.96" width="0.1524" layer="91"/>
<label x="104.648" y="61.468" size="1.4224" layer="95"/>
</segment>
<segment>
<pinref part="M1" gate="G$1" pin="P$5"/>
<wire x1="73.66" y1="5.08" x2="58.42" y2="5.08" width="0.1524" layer="91"/>
<label x="61.722" y="5.842" size="1.4224" layer="95"/>
</segment>
</net>
<net name="SPI_MOSI" class="0">
<segment>
<pinref part="M2" gate="G$1" pin="D11"/>
<wire x1="104.14" y1="63.5" x2="114.3" y2="63.5" width="0.1524" layer="91"/>
<label x="104.648" y="64.262" size="1.4224" layer="95"/>
</segment>
<segment>
<pinref part="M1" gate="G$1" pin="P$6"/>
<wire x1="73.66" y1="2.54" x2="58.42" y2="2.54" width="0.1524" layer="91"/>
<label x="61.722" y="3.048" size="1.4224" layer="95"/>
</segment>
</net>
<net name="SPI_MISO" class="0">
<segment>
<pinref part="M2" gate="G$1" pin="D12"/>
<wire x1="104.14" y1="66.04" x2="114.3" y2="66.04" width="0.1524" layer="91"/>
<label x="104.902" y="66.802" size="1.4224" layer="95"/>
</segment>
<segment>
<pinref part="M1" gate="G$1" pin="P$7"/>
<wire x1="73.66" y1="0" x2="58.42" y2="0" width="0.1524" layer="91"/>
<label x="61.722" y="0.508" size="1.4224" layer="95"/>
</segment>
</net>
<net name="SPI_CLK" class="0">
<segment>
<pinref part="M2" gate="G$1" pin="D13"/>
<wire x1="71.12" y1="66.04" x2="60.96" y2="66.04" width="0.1524" layer="91"/>
<label x="60.96" y="66.548" size="1.4224" layer="95"/>
</segment>
<segment>
<pinref part="M1" gate="G$1" pin="P$8"/>
<wire x1="73.66" y1="-2.54" x2="58.42" y2="-2.54" width="0.1524" layer="91"/>
<label x="61.976" y="-2.032" size="1.4224" layer="95"/>
</segment>
</net>
<net name="NEO_PWR" class="0">
<segment>
<pinref part="M3" gate="G$1" pin="OUT"/>
<wire x1="99.06" y1="104.14" x2="104.14" y2="104.14" width="0.1524" layer="91"/>
<label x="111.252" y="102.362" size="1.4224" layer="95"/>
<wire x1="104.14" y1="101.6" x2="104.14" y2="104.14" width="0.1524" layer="91"/>
<pinref part="J4" gate="G$1" pin="2"/>
<wire x1="121.92" y1="101.6" x2="104.14" y2="101.6" width="0.1524" layer="91"/>
<pinref part="J5" gate="G$1" pin="2"/>
<wire x1="104.14" y1="101.6" x2="104.14" y2="83.82" width="0.1524" layer="91"/>
<wire x1="104.14" y1="83.82" x2="121.92" y2="83.82" width="0.1524" layer="91"/>
<junction x="104.14" y="101.6"/>
<label x="110.49" y="84.582" size="1.4224" layer="95"/>
</segment>
</net>
<net name="NEO_DATA_1" class="0">
<segment>
<pinref part="J4" gate="G$1" pin="1"/>
<wire x1="121.92" y1="104.14" x2="109.22" y2="104.14" width="0.1524" layer="91"/>
<label x="110.998" y="104.902" size="1.4224" layer="95"/>
</segment>
<segment>
<pinref part="M1" gate="G$1" pin="P$14"/>
<wire x1="71.12" y1="-17.78" x2="48.26" y2="-17.78" width="0.1524" layer="91"/>
<label x="49.022" y="-17.018" size="1.4224" layer="95"/>
</segment>
</net>
<net name="VIN" class="0">
<segment>
<pinref part="J3" gate="G$1" pin="1"/>
<label x="-19.558" y="-4.572" size="1.4224" layer="95"/>
<pinref part="R2" gate="G$1" pin="2"/>
<wire x1="-20.32" y1="-5.08" x2="-10.16" y2="-5.08" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="M1" gate="G$1" pin="P$30"/>
<wire x1="104.14" y1="15.24" x2="114.3" y2="15.24" width="0.1524" layer="91"/>
<label x="106.68" y="16.002" size="1.4224" layer="95"/>
</segment>
<segment>
<pinref part="M2" gate="G$1" pin="VIN"/>
<wire x1="71.12" y1="30.48" x2="60.96" y2="30.48" width="0.1524" layer="91"/>
<label x="59.69" y="30.988" size="1.4224" layer="95"/>
</segment>
<segment>
<pinref part="M3" gate="G$1" pin="IN"/>
<wire x1="73.66" y1="104.14" x2="68.58" y2="104.14" width="0.1524" layer="91"/>
<label x="69.596" y="105.156" size="1.4224" layer="95"/>
</segment>
</net>
<net name="NEO_DATA_2" class="0">
<segment>
<pinref part="J5" gate="G$1" pin="1"/>
<wire x1="121.92" y1="86.36" x2="109.22" y2="86.36" width="0.1524" layer="91"/>
<label x="110.744" y="87.376" size="1.4224" layer="95"/>
</segment>
<segment>
<pinref part="M1" gate="G$1" pin="P$15"/>
<wire x1="71.12" y1="-20.32" x2="48.26" y2="-20.32" width="0.1524" layer="91"/>
<label x="49.022" y="-19.812" size="1.4224" layer="95"/>
</segment>
</net>
<net name="BATV" class="0">
<segment>
<pinref part="M2" gate="G$1" pin="A0"/>
<wire x1="71.12" y1="58.42" x2="60.96" y2="58.42" width="0.1524" layer="91"/>
<label x="61.468" y="58.674" size="1.4224" layer="95"/>
</segment>
<segment>
<pinref part="M1" gate="G$1" pin="P$16"/>
<wire x1="104.14" y1="-20.32" x2="111.76" y2="-20.32" width="0.1524" layer="91"/>
<label x="104.648" y="-19.558" size="1.4224" layer="95"/>
</segment>
<segment>
<pinref part="R2" gate="G$1" pin="1"/>
<pinref part="R3" gate="G$1" pin="2"/>
<wire x1="-10.16" y1="-15.24" x2="-10.16" y2="-17.78" width="0.1524" layer="91"/>
<wire x1="-10.16" y1="-15.24" x2="0" y2="-15.24" width="0.1524" layer="91"/>
<junction x="-10.16" y="-15.24"/>
<label x="-5.334" y="-14.478" size="1.4224" layer="95"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="M2" gate="G$1" pin="REF"/>
<wire x1="71.12" y1="60.96" x2="66.04" y2="60.96" width="0.1524" layer="91"/>
<wire x1="66.04" y1="60.96" x2="66.04" y2="63.5" width="0.1524" layer="91"/>
<pinref part="M2" gate="G$1" pin="3.3V"/>
<wire x1="66.04" y1="63.5" x2="71.12" y2="63.5" width="0.1524" layer="91"/>
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
