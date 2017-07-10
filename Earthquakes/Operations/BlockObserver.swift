/*
Copyright (C) 2015 Apple Inc. All Rights Reserved.
See LICENSE.txt for this sample’s licensing information

Abstract:
This file shows how to implement the OperationObserver protocol.
*/

import Foundation

/**
    The `BlockObserver` is a way to attach arbitrary blocks to significant events
    in an `Operation`'s lifecycle.
*/
struct BlockObserver: OperationObserver {
    // MARK: Properties
    
    fileprivate let startHandler: ((YMOperation) -> Void)?
    fileprivate let produceHandler: ((YMOperation, Operation) -> Void)?
    fileprivate let finishHandler: ((YMOperation, [NSError]) -> Void)?
    
    init(startHandler: ((YMOperation) -> Void)? = nil, produceHandler: ((YMOperation, Operation) -> Void)? = nil, finishHandler: ((YMOperation, [NSError]) -> Void)? = nil) {
        self.startHandler = startHandler
        self.produceHandler = produceHandler
        self.finishHandler = finishHandler
    }
    
    // MARK: OperationObserver
    
    func operationDidStart(_ operation: YMOperation) {
        startHandler?(operation)
    }
    
    func operation(_ operation: YMOperation, didProduceOperation newOperation: Operation) {
        produceHandler?(operation, newOperation)
    }
    
    func operationDidFinish(_ operation: YMOperation, errors: [NSError]) {
        finishHandler?(operation, errors)
    }
}
