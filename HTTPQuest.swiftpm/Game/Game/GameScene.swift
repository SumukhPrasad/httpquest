//
//  GameScene.swift
//  
//
//  Created by Sumukh Prasad on 24/02/24.
//

import Foundation
import SpriteKit

class GameScene: SKScene {
    
    var packetNode: SKSpriteNode!
    var lastSpawnTime: TimeInterval = 0
    let timeBetweenSpawns: TimeInterval = 2.0
    var selectedNode: SKNode?
    var originalPosition: CGPoint?
    var availableRouters: [String] = []
    var lastInteractionTime: TimeInterval = 0
    var inactivityTimer: Timer?
    var logicIsRunning: Bool = false
    
    var score: Int = 0 {
        didSet {
            scoreDidChange?(score)
        }
    }
    
    typealias ScoreDidChangeClosure = (Int) -> Void
    var scoreDidChange: ScoreDidChangeClosure?
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor.white
        setupNetworkGrid()
        setupUI()
        startUpdateLogicSequence()
        startInactivityTimer()
    }
    
    func startInactivityTimer() {
        inactivityTimer = Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { [weak self] _ in
            self?.handleInactivity()
        }
    }

    func handleInactivity() {
        // Handle inactivity (e.g., pause the game, show a message, etc.)
        stopUpdateLogicSequence()
    }
    
    func startUpdateLogicSequence() {
        if !logicIsRunning {
            let updateLogicAction = SKAction.sequence([
                SKAction.run(updateLogic),
                SKAction.wait(forDuration: 1.0 / 60.0)
            ])
            
            let repeatForeverAction = SKAction.repeatForever(updateLogicAction)
            self.run(repeatForeverAction, withKey: "updateLogic")
        }
        logicIsRunning = true
    }

    func stopUpdateLogicSequence() {
        if logicIsRunning {
            self.removeAction(forKey: "updateLogic")
        }
        logicIsRunning = false
    }
    
    func setupNetworkGrid() {
        let routerTexture = SKTexture(imageNamed: "Router")
        let hubTexture = SKTexture(imageNamed: "InternetHub")
        
        let screenSize = view?.bounds.size ?? CGSize(width: 400, height: 300)
        let nodeSize = CGSize(width: 40, height: 40)
        let horizontalSpacing: CGFloat = 60
        let verticalSpacing: CGFloat = 60
        
        let maxNodesHorizontal = Int((screenSize.width - horizontalSpacing) / (nodeSize.width + horizontalSpacing))
        let maxNodesVertical = Int((screenSize.height - verticalSpacing) / (nodeSize.height + verticalSpacing))
        
        let gridSize = CGSize(
            width: CGFloat(maxNodesHorizontal) * (nodeSize.width + horizontalSpacing) - horizontalSpacing,
            height: CGFloat(maxNodesVertical) * (nodeSize.height + verticalSpacing) - verticalSpacing
        )
        
        let gridStartX = (screenSize.width - gridSize.width) / 2 + nodeSize.width / 2
        let gridStartY = (screenSize.height - gridSize.height) / 2 + nodeSize.height / 2
        
        for row in 0..<maxNodesVertical {
            for col in 0..<maxNodesHorizontal {
                let nodeType: NodeType = (row + col) % 2 == 0 ? .router : .hub
                let label: String = (row + col) % 2 == 0 ? "\(row+1).\(col+1)" : "IH"
                if (row + col) % 2 == 0 {
                    availableRouters.append(label)
                }
                let node = NetworkNode(type: nodeType, texture: nodeType == .router ? routerTexture : hubTexture, size: nodeSize, label: label)
                let xPos = gridStartX + CGFloat(col) * (nodeSize.width + horizontalSpacing)
                let yPos = gridStartY + CGFloat(row) * (nodeSize.height + verticalSpacing)
                node.position = CGPoint(x: xPos, y: yPos)
                addChild(node)
            }
        }
        
    }
    
    func spawnPacketAtRandomNode() {
        guard let nodes = children.filter({ $0 is NetworkNode }) as? [NetworkNode] else {
            return
        }
        
        if let randomNode = nodes.randomElement() {
            let packet = PacketNode(label: "\(Int.random(in: 1..<6)).\(Int.random(in: 1..<10))")
            packet.size = CGSize(width: 32, height: 32)
            packet.position = CGPoint(x: randomNode.position.x+(40)/2, y: randomNode.position.y+(40)/2)
            addChild(packet)
            
            let initialScaleAction = SKAction.scale(to: 0.1, duration: 0)
            let scaleUpAction = SKAction.scale(to: 1.0, duration: 0.2)
            scaleUpAction.timingMode = .easeOut

            packet.run(SKAction.sequence([initialScaleAction, SKAction.group([scaleUpAction])]))
        }
    }
    
    func setupUI() {
        // Implement UI elements and controls here
        // You can add buttons or gestures for user interaction
    }
    
    func updateLogic() {
        let currentTime = CACurrentMediaTime()
        if currentTime > lastSpawnTime + timeBetweenSpawns {
            spawnPacketAtRandomNode()
            lastSpawnTime = currentTime
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        resetInactivityTimer()
        guard let touch = touches.first else { return }
        let touchLocation = touch.location(in: self)
        
        let touchedNodes = nodes(at: touchLocation)
        selectedNode = touchedNodes.first { $0 is PacketNode }
        
        selectedNode?.alpha = 0.7
        originalPosition = selectedNode?.position
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        resetInactivityTimer()
        guard let touch = touches.first, let selectedNode = selectedNode else { return }
        let touchLocation = touch.location(in: self)
        
        if selectedNode.action(forKey: "fadeOut") != nil {
            return
        }
        
        selectedNode.position = touchLocation
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        resetInactivityTimer()
        selectedNode?.alpha = 1.0

        guard let touch = touches.first, let selectedNode = selectedNode else { return }
        let touchLocation = touch.location(in: self)

        
        if let dropTarget = nodes(at: touchLocation).first(where: { $0 is NetworkNode }) as? NetworkNode {
            
            selectedNode.position = dropTarget.position
            
            if let selectedNodeLabel = selectedNode.name {
                if availableRouters.contains(selectedNodeLabel) {
                    if let dropTargetLabel = dropTarget.name {
                        if selectedNodeLabel == dropTargetLabel {
                            score+=10
                            showScoreIndicator(score: 10, pos: dropTarget.position)
                        } else {
                            score-=2
                            showScoreIndicator(score: -2, pos: dropTarget.position)
                        }
                    }
                } else {
                    if let dropTargetLabel = dropTarget.name {
                        if dropTargetLabel == "IH" {
                            score+=10
                            showScoreIndicator(score: 10, pos: dropTarget.position)
                        } else {
                            score-=2
                            showScoreIndicator(score: -2, pos: dropTarget.position)
                        }
                    }
                }
            }
            
            let fadeOut = SKAction.fadeOut(withDuration: 0.5)
            selectedNode.run(fadeOut) {
                selectedNode.removeFromParent()
            }

        } else {
            selectedNode.position = originalPosition ?? selectedNode.position
        }
        
        self.selectedNode = nil
        self.originalPosition = nil
    }
    
    func showScoreIndicator(score: Int, pos: CGPoint) {
        let scoreIndicator = ScoreIndicatorNode(score: score)
        scoreIndicator.position = pos
        addChild(scoreIndicator)
        let fadeOut = SKAction.fadeOut(withDuration: 2.0)
        let moveUp = SKAction.moveBy(x: 0, y: 50, duration: 2.0)
        let groupAction = SKAction.group([fadeOut, moveUp])
        scoreIndicator.run(groupAction) {
            scoreIndicator.removeFromParent()
        }
    }
    
    func resetInactivityTimer() {
        inactivityTimer?.invalidate()
        startInactivityTimer()
        startUpdateLogicSequence()
    }
}
