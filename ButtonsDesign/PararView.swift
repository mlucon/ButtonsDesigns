//
//  PararView.swift
//  ButtonsDesign
//
//  Created by Mauricio Lucon on 4/14/15.
//  Copyright (c) 2015 AppFact. All rights reserved.
//



import UIKit

@IBDesignable
class PararView : UIView {


	var animationCompletions = Dictionary<CAAnimation, (Bool) -> Void>()
	var viewsByName: [String : UIView]!

	// - MARK: Life Cycle


	override init(frame: CGRect) {
		super.init(frame: frame)
		self.setupHierarchy()
	}

	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.setupHierarchy()
	}

	// - MARK: Scaling

	override func layoutSubviews() {
		super.layoutSubviews()

		if let scalingView = self.viewsByName["__scaling__"] {
			var xScale = self.bounds.size.width / scalingView.bounds.size.width
			var yScale = self.bounds.size.height / scalingView.bounds.size.height
			switch contentMode {
			case .ScaleToFill:
				break
			case .ScaleAspectFill:
				let scale = max(xScale, yScale)
				xScale = scale
				yScale = scale
			default:
				let scale = min(xScale, yScale)
				xScale = scale
				yScale = scale
			}
			scalingView.transform = CGAffineTransformMakeScale(xScale, yScale)
			scalingView.center = CGPoint(x:CGRectGetMidX(self.bounds), y:CGRectGetMidY(self.bounds))
		}
	}

	// - MARK: Setup

	func setupHierarchy() {
		var viewsByName: [String : UIView] = [:]
		let bundle = NSBundle(forClass:self.dynamicType)
		let __scaling__ = UIView()
		__scaling__.bounds = CGRect(x:0, y:0, width:210, height:210)
		__scaling__.center = CGPoint(x:105.0, y:105.0)
		self.addSubview(__scaling__)
		viewsByName["__scaling__"] = __scaling__

		let parar1 = UIImageView()
		parar1.bounds = CGRect(x:0, y:0, width:200.0, height:200.0)
		var imgParar1: UIImage!
		if let imagePath = bundle.pathForResource("Parar1.png", ofType:nil) {
			imgParar1 = UIImage(contentsOfFile:imagePath)
		}
		parar1.image = imgParar1
		parar1.contentMode = .Center;
		parar1.layer.position = CGPoint(x:105.000, y:105.000)
		__scaling__.addSubview(parar1)
		viewsByName["Parar1"] = parar1

		let parar2 = UIImageView()
		parar2.bounds = CGRect(x:0, y:0, width:200.0, height:200.0)
		var imgParar2: UIImage!
		if let imagePath = bundle.pathForResource("Parar2.png", ofType:nil) {
			imgParar2 = UIImage(contentsOfFile:imagePath)
		}
		parar2.image = imgParar2
		parar2.contentMode = .Center;
		parar2.layer.position = CGPoint(x:105.000, y:105.000)
		__scaling__.addSubview(parar2)
		viewsByName["Parar2"] = parar2

		self.viewsByName = viewsByName
	}
    
    

	// - MARK: playAnimation

	func addPlayAnimation() {
		addPlayAnimationWithBeginTime(0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: nil)
	}

	func addPlayAnimation(completion: ((Bool) -> Void)?) {
		addPlayAnimationWithBeginTime(0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: nil)
	}

	func addPlayAnimation(#removedOnCompletion: Bool) {
		addPlayAnimationWithBeginTime(0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: nil)
	}

	func addPlayAnimation(#removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		addPlayAnimationWithBeginTime(0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: nil)
	}

	func addPlayAnimationWithBeginTime(beginTime: CFTimeInterval, fillMode: String, removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		let linearTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
		if let complete = completion {
			let representativeAnimation = CABasicAnimation(keyPath: "not.a.real.key")
			representativeAnimation.duration = 1.000
			representativeAnimation.delegate = self
			self.layer.addAnimation(representativeAnimation, forKey: "PlayAnimation")
			self.animationCompletions[layer.animationForKey("PlayAnimation")] = complete
		}

		let parar1RotationAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
		parar1RotationAnimation.duration = 1.000
		parar1RotationAnimation.values = [0.000 as Float, 0.000 as Float]
		parar1RotationAnimation.keyTimes = [0.000 as Float, 1.000 as Float]
		parar1RotationAnimation.timingFunctions = [linearTiming]
		parar1RotationAnimation.beginTime = beginTime
		parar1RotationAnimation.fillMode = fillMode
		parar1RotationAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["Parar1"]?.layer.addAnimation(parar1RotationAnimation, forKey:"playAnimation_Rotation")

		let parar2RotationAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
		parar2RotationAnimation.duration = 1.000
		parar2RotationAnimation.values = [0.000 as Float, 3.138 as Float]
		parar2RotationAnimation.keyTimes = [0.000 as Float, 1.000 as Float]
		parar2RotationAnimation.timingFunctions = [linearTiming]
		parar2RotationAnimation.beginTime = beginTime
		parar2RotationAnimation.fillMode = fillMode
		parar2RotationAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["Parar2"]?.layer.addAnimation(parar2RotationAnimation, forKey:"playAnimation_Rotation")

		let parar2TranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		parar2TranslationXAnimation.duration = 1.000
		parar2TranslationXAnimation.values = [0.000 as Float, 1.000 as Float]
		parar2TranslationXAnimation.keyTimes = [0.000 as Float, 1.000 as Float]
		parar2TranslationXAnimation.timingFunctions = [linearTiming]
		parar2TranslationXAnimation.beginTime = beginTime
		parar2TranslationXAnimation.fillMode = fillMode
		parar2TranslationXAnimation.removedOnCompletion = removedOnCompletion
		self.viewsByName["Parar2"]?.layer.addAnimation(parar2TranslationXAnimation, forKey:"playAnimation_TranslationX")
	}

	func removePlayAnimation() {
		self.layer.removeAnimationForKey("PlayAnimation")
		self.viewsByName["Parar1"]?.layer.removeAnimationForKey("playAnimation_Rotation")
		self.viewsByName["Parar2"]?.layer.removeAnimationForKey("playAnimation_Rotation")
		self.viewsByName["Parar2"]?.layer.removeAnimationForKey("playAnimation_TranslationX")
	}

	override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
		if let completion = self.animationCompletions[anim] {
			self.animationCompletions.removeValueForKey(anim)
			completion(flag)
		}
	}

	func removeAllAnimations() {
		for subview in viewsByName.values {
			subview.layer.removeAllAnimations()
		}
		self.layer.removeAnimationForKey("PlayAnimation")
	}
}