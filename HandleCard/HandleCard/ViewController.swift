//
//  ViewController.swift
//  HandleCard
//
//  Created by Lucas Eiki Okada on 28/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    enum CardState {
        case expanded
        case collapsed
    }
    
    var cardViewController: CardViewController!
    var visualEffectView: UIVisualEffectView!
    
    let cardHeigth: CGFloat = 543
    let cardHandleAreaHeigth: CGFloat = 66
    
    var cardVisible = false
    
    var nextState: CardState {
        return cardVisible ? .collapsed : .expanded
    }
    
    var runningAnimations = [UIViewPropertyAnimator]()
    var animationProgressWhenInterrupted: CGFloat = 0.0
    
    func setupCard() {
        visualEffectView = UIVisualEffectView();
        visualEffectView.frame = self.view.frame
        self.view.addSubview(visualEffectView)
        
        cardViewController = CardViewController(nibName: "CardViewController", bundle: nil)
        
        self.addChild(cardViewController)
        self.view.addSubview(cardViewController.view)
        
        cardViewController.view.frame = CGRect(x: 0, y: self.view.frame.height - cardHandleAreaHeigth, width: self.view.bounds.width, height: cardHeigth)
        
        cardViewController.view.clipsToBounds = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleCardTap(recognizer:)))
        
        let panGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleCardTap(recognizer:)))
        
        cardViewController.handleArea.addGestureRecognizer(tapGestureRecognizer)
        cardViewController.handleArea.addGestureRecognizer(panGestureRecognizer)
    }
    
    func startIteractiveTransition(state: CardState, duration: TimeInterval) {
        if runningAnimations.isEmpty {
            
        }
        
        for animator in runningAnimations {
            animator.pauseAnimation()
            animationProgressWhenInterrupted = animator.fractionComplete
        }
    }
    
    func updateIteractiveTransition(fractionCompleted: CGFloat) {
        for animator in runningAnimations {
            animator.fractionComplete = fractionCompleted + animationProgressWhenInterrupted
        }
    }
    
    func continueIteractiveTransition() {
        for animator in runningAnimations {
            animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
        }
    }
    
    func animateTransitionIfNeeded(state: CardState, duration: TimeInterval) {
        if runningAnimations.isEmpty {
            let frameAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1) {
                switch state {
                case.expanded:
                    self.cardViewController.view.frame.origin.y = self.view.frame.height - self.cardHeigth
                    
                case .collapsed:
                    self.cardViewController.view.frame.origin.y = self.view.frame.height - self.cardHandleAreaHeigth
                }
            }
            
            frameAnimator.addCompletion { _ in
                self.cardVisible = !self.cardVisible
                self.runningAnimations.removeAll()
            }
            
            frameAnimator.startAnimation()
            runningAnimations.append(frameAnimator)
        }
    }

    
    @objc
    func handleCardTap(recognizer: UITapGestureRecognizer) {
        
    }
    
    @objc
    func handleCardPan(recognizer: UITapGestureRecognizer) {
        switch recognizer.state {
        case .began:
            startIteractiveTransition(state: nextState, duration: 0.9)
        case .changed:
            updateIteractiveTransition(fractionCompleted: 0)
        case .ended:
            continueIteractiveTransition()
            
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCard()
    }
}

