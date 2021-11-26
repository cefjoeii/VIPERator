#!/bin/bash

# This bash script was created to generate VIPER Module files quickly.
# Created by Ceferino Jose II on 11/3/21.
# Copyright © 2021 Ceferino Jose II

today=$(date +'%-m/%-d/%y')
year=$(date +'%Y')
default_project='Project'
default_author=$(id -u -n)
default_org='Organization'

while read -r -p 'VIPER Module Name: ' viper && [[ -z "$viper" ]] ; do
 echo "No, please no blank names."
done

printf "Xcode Project Name (default: \"${default_project}\"): "
read -r project
printf "Author (default: \"${default_author}\"): "
read -r author
printf "Organization (default: \"${default_org}\"): "
read -r org

if [ -z "$project" ]
then
    project=$default_project
fi

if [ -z "$author" ]
then
    author=$default_author
fi

if [ -z "$org" ]
then
    org=$default_org
fi

# Contract.swift
echo "//
//  ${viper}Contract.swift
//  ${project}
//
//  Created by ${author} on ${today}.
//  Copyright © ${year} ${org}. All rights reserved.
//

import UIKit

// MARK: - View Input (Presenter -> View)
protocol ${viper}Viewable: AnyObject {
    
}

// MARK: - View Output (View -> Presenter)
protocol ${viper}ViewPresentable {
    func viewDidLoad()
}

// MARK: - Interactor Input (Presenter -> Interactor)
protocol ${viper}Interactable {
    
}

// MARK: - Interactor Output (Interactor -> Presenter)
protocol ${viper}InteractorPresentable: AnyObject {
    func didFail(error: Error)
}

// MARK: - Router Input (Presenter -> Router)
protocol ${viper}Routable {
    static func createModule() -> UIViewController
}" >> ${viper}Contract.swift

# ViewController.swift
echo "//
//  ${viper}ViewController.swift
//  ${project}
//
//  Created by ${author} on ${today}.
//  Copyright © ${year} ${org}. All rights reserved.
//

import UIKit

final class ${viper}ViewController: UIViewController {
    // MARK: - VIPER
    var presenter: ${viper}ViewPresentable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }
}

// MARK: - ${viper}Viewable
extension ${viper}ViewController: ${viper}Viewable {
    
}" >> ${viper}ViewController.swift

# ViewController.xib
echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<document type=\"com.apple.InterfaceBuilder3.CocoaTouch.XIB\" version=\"3.0\" toolsVersion=\"18122\" targetRuntime=\"iOS.CocoaTouch\" propertyAccessControl=\"none\" useAutolayout=\"YES\" useTraitCollections=\"YES\" useSafeAreas=\"YES\" colorMatched=\"YES\">
    <device id=\"retina6_0\" orientation=\"portrait\" appearance=\"light\"/>
    <dependencies>
        <plugIn identifier=\"com.apple.InterfaceBuilder.IBCocoaTouchPlugin\" version=\"18093\"/>
        <capability name=\"Safe area layout guides\" minToolsVersion=\"9.0\"/>
        <capability name=\"System colors in document resources\" minToolsVersion=\"11.0\"/>
        <capability name=\"documents saved in the Xcode 8 format\" minToolsVersion=\"8.0\"/>
    </dependencies>
    <objects>
        <placeholder placeholderIdentifier=\"IBFilesOwner\" id=\"-1\" userLabel=\"File's Owner\" customClass=\"${viper}ViewController\">
            <connections>
                <outlet property=\"view\" destination=\"i5M-Pr-FkT\" id=\"sfx-zR-JGt\"/>
            </connections>
        </placeholder>
        <placeholder placeholderIdentifier=\"IBFirstResponder\" id=\"-2\" customClass=\"UIResponder\"/>
        <view clearsContextBeforeDrawing=\"NO\" contentMode=\"scaleToFill\" id=\"i5M-Pr-FkT\">
            <rect key=\"frame\" x=\"0.0\" y=\"0.0\" width=\"390\" height=\"844\"/>
            <autoresizingMask key=\"autoresizingMask\" widthSizable=\"YES\" heightSizable=\"YES\"/>
            <viewLayoutGuide key=\"safeArea\" id=\"fnl-2z-Ty3\"/>
            <color key=\"backgroundColor\" systemColor=\"systemBackgroundColor\"/>
            <point key=\"canvasLocation\" x=\"131.8840579710145\" y=\"125.89285714285714\"/>
        </view>
    </objects>
    <resources>
        <systemColor name=\"systemBackgroundColor\">
            <color white=\"1\" alpha=\"1\" colorSpace=\"custom\" customColorSpace=\"genericGamma22GrayColorSpace\"/>
        </systemColor>
    </resources>
</document>" >> ${viper}ViewController.xib

# Interactor.swift
echo "//
//  ${viper}Interactor.swift
//  ${project}
//
//  Created by ${author} on ${today}.
//  Copyright © ${year} ${org}. All rights reserved.
//

final class ${viper}Interactor {
    // MARK: - VIPER
    weak var presenter: ${viper}InteractorPresentable?
}

// MARK: - ${viper}Interactable
extension ${viper}Interactor: ${viper}Interactable {
    
}" >> ${viper}Interactor.swift

# Presenter.swift
echo "//
//  ${viper}Presenter.swift
//  ${project}
//
//  Created by ${author} on ${today}.
//  Copyright © ${year} ${org}. All rights reserved.
//

final class ${viper}Presenter {
    // MARK: - VIPER
    weak var view: ${viper}Viewable?
    var router: ${viper}Routable?
    var interactor: ${viper}Interactable?
    
    init() {
        
    }
}

// MARK: - ${viper}ViewPresentable
extension ${viper}Presenter: ${viper}ViewPresentable {
    func viewDidLoad() {
        
    }
}

// MARK: - ${viper}InteractorPresentable
extension ${viper}Presenter: ${viper}InteractorPresentable {
    func didFail(error: Error) {
        
    }
}" >> ${viper}Presenter.swift

# Router.swift
echo "//
//  ${viper}Router.swift
//  ${project}
//
//  Created by ${author} on ${today}.
//  Copyright © ${year} ${org}. All rights reserved.
//

import UIKit

final class ${viper}Router {
    // MARK: - VIPER
    weak var vc: UIViewController?
}

// MARK: - ${viper}Routable
extension ${viper}Router: ${viper}Routable {
    static func createModule() -> UIViewController {
        let view = ${viper}ViewController()
        let interactor = ${viper}Interactor()
        let presenter = ${viper}Presenter()
        let router = ${viper}Router()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        router.vc = view
        
        return view
    }
}" >> ${viper}Router.swift

mkdir -p ./${viper}

mv ./${viper}Contract.swift ./${viper}
mv ./${viper}ViewController.swift ./${viper}
mv ./${viper}ViewController.xib ./${viper}
mv ./${viper}Interactor.swift ./${viper}
mv ./${viper}Presenter.swift ./${viper}
mv ./${viper}Router.swift ./${viper}

printf "\nSuccess."

printf "\n\nThe following six (6) files were generated:"

printf "\n\n${viper}Contract.swift"
printf "\n${viper}ViewController.swift"
printf "\n${viper}ViewController.xib"
printf "\n${viper}Interactor.swift"
printf "\n${viper}Presenter.swift"
printf "\n${viper}Router.swift"

printf "\n\nThese are located in a folder named \"${viper}\"."
printf "\nYou can delete the .xib file if it's not needed.\n\n"

open ./${viper}