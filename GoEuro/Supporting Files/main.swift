//
//  main.swift
//  GoEuro
//
//  Created by Marcilio Junior on 27/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import UIKit

let isRunningTests = NSClassFromString("XCTestCase") != nil
/// the application's delegate class
let delegateClass: AnyClass = isRunningTests ? TestsAppDelegate.self : AppDelegate.self

let argv = UnsafeMutableRawPointer(CommandLine.unsafeArgv)
    .bindMemory(to: UnsafeMutablePointer<Int8>.self, capacity: Int(CommandLine.argc))

//start application with the proper AppDelegate
UIApplicationMain(CommandLine.argc, argv, nil, NSStringFromClass(delegateClass))
