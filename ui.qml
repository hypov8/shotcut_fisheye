/*
 * Copyright (c) 2015 Meltytech, LLC
 * Author: Dan Dennedy <dan@dennedy.org>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1
import Shotcut.Controls 1.0
import QtQuick.Controls.Styles 1.1

Item {
    property string amount: '0'
    property double amountd: 0
	property string deFish: '1'
    property bool deFishd: false
	property string type: '2'
    property double typed: 0.6
    property string scaling: '3'
	property double scalingd: 0.6
	property string manualScale: '4'
	property double manualScaled: 0.5
	property string interpolator: '5'
    property double interpolatord: 0.16
    property string aspectType: '6'
	property double aspectTyped: 0
	property string manualAspect: '7'
	property double manualAspectd: 0.5
    
	property var defaultParameters: [amount, deFish, type,
		scaling, manualScale, interpolator, aspectType, manualAspect]
   
    width: 300
    height: 150
    Component.onCompleted: {
        presetItem.parameters = defaultParameters
        if (filter.isNew) {
            // Set default parameter values
            filter.set(amount, amountd)
            filter.set(deFish, deFishd)
			filter.set(type, typed)
			filter.set(scaling, scalingd)
			filter.set(manualScale, manualScaled)
			filter.set(interpolator, interpolatord)
			filter.set(aspectType, aspectTyped)
			filter.set(manualAspect, manualAspectd)
            filter.savePreset(defaultParameters)
        }
        ratioSlider.value = filter.getDouble(amount)
        df.value = filter.get(deFish)
        typeSlider.value = filter.getDouble(type)
        scaleSlider.value = filter.getDouble(scaling)
        manscaleSlider.value = filter.getDouble(manualScale)
        intSlider.value = filter.getDouble(interpolator)
        aspSlider.value = filter.getDouble(aspectType)
        manaspSlider.value = filter.getDouble(manualAspect)
    }

    GridLayout {
        columns: 3
        anchors.fill: parent
        anchors.margins: 8

        Label {
            text: qsTr('Preset')
            Layout.alignment: Qt.AlignRight
        }
        Preset {
            id: presetItem
            Layout.columnSpan: 2
            onPresetSelected: {
                ratioSlider.value = filter.getDouble(amount)
                dfcheck.value = filter.get(deFish)
                typeSlider.value = filter.getDouble(type)
                scaleSlider.value = filter.getDouble(scaling)
                manscaleSlider.value = filter.getDouble(manualScale)
                intSlider.value = filter.getDouble(interpolator)
                aspSlider.value = filter.getDouble(aspectType)
                manaspSlider.value = filter.getDouble(manualAspect)
            }
        }

        // Row 1
        Label {
            text: qsTr('Focal Ratio')
            Layout.alignment: Qt.AlignRight
        }
       SliderSpinner {
            id: ratioSlider
            minimumValue: 0
            maximumValue: 1
            decimals: 3
            suffix: ''
            value: filter.getDouble(amount)
            onValueChanged: filter.set(amount, value)
        }
        UndoButton {
            onClicked: ratioSlider.value = amountd
        } 
		// Row 2
       Label {
          text: qsTr('DeFish or Fish')
          Layout.alignment: Qt.AlignRight
       }
        Button {
        id: dfcheck
        text: qsTr("DeFish")
        onClicked: filter.set(deFish, true)
        }
        Button {
        id: dfcheck1
        text: qsTr("Fish")
        onClicked: filter.set(deFish, false)
        }

        // Row 3
        Label {
            text: qsTr('Mapping Fct')
            Layout.alignment: Qt.AlignRight
        }
       SliderSpinner {
            id: typeSlider
            minimumValue: 0
            maximumValue: 1
            decimals: 3
            suffix: ''
            value: filter.getDouble(type)
            onValueChanged: filter.set(type, value)

        }
        UndoButton {
            onClicked: typeSlider.value = typed
        } 

		// Row 4
        Label {
            text: qsTr('Scaling Method')
            Layout.alignment: Qt.AlignRight
        }
       SliderSpinner {
            id: scaleSlider
            minimumValue: 0
            maximumValue: 1
            decimals: 3
            suffix: ''
            value: filter.getDouble(scaling)
            onValueChanged: filter.set(scaling, value)
        }
        UndoButton {
            onClicked: scaleSlider.value = scalingd
        } 

		// Row 5
        Label {
            text: qsTr('Manual Scale')
            Layout.alignment: Qt.AlignRight
        }
       SliderSpinner {
            id: manscaleSlider
            minimumValue: 0
            maximumValue: 1
            decimals: 3
            suffix: ''
            value: filter.getDouble(manualScale)
            onValueChanged: filter.set(manualScale, value)
        }
        UndoButton {
            onClicked: manscaleSlider.value = manualScaled
        } 

		// Row 6
        Label {
            text: qsTr('Quality of Interpol')
            Layout.alignment: Qt.AlignRight
        }
       SliderSpinner {
            id: intSlider
            minimumValue: 0
            maximumValue: 1
            decimals: 3
            suffix: ''
            value: filter.getDouble(interpolator)
            onValueChanged: filter.set(interpolator, value)
        }
        UndoButton {
            onClicked: intSlider.value = interpolatord
        } 
		
		// Row 7
        Label {
            text: qsTr('Px asp ratio presets')
            Layout.alignment: Qt.AlignRight
        }
       SliderSpinner {
            id: aspSlider 
            minimumValue: 0
            maximumValue: 1
            decimals: 3
            suffix: ''
            value: filter.geDoublet(aspectType)
            onValueChanged: filter.set(aspectType, value)
        }
        UndoButton {
            onClicked: aspSlider.value = aspectTyped
        } 

		// Row 8
        Label {
            text: qsTr('Manual Px Aspect Ratio')
            Layout.alignment: Qt.AlignRight
        }
       SliderSpinner {
            id: manaspSlider 
            minimumValue: 0
            maximumValue: 1
            decimals: 3
            suffix: ''
            value: filter.getDouble(manualAspect)
            onValueChanged: filter.set(manualAspect, value)
        }
        UndoButton {
            onClicked: manaspSlider.value = manualAspectd
        } 


        Item {
            Layout.fillHeight: true
        }
    }
}
