//
//  AppDelegate.swift
//  Demo
//
//  Created by Edmond on 2019/4/21.
//  Copyright © 2019 Edmond. All rights reserved.
//

import UIKit
//import BlocksKit

class Solution1 {

    func minWindow(_ s: String, _ t: String) -> String {
        if s.isEmpty || t.isEmpty { return "" }
        var start = 0, minLen = Int.max, left = 0, right = 0
        var needs = [Character : Int]()
        var window = [Character : Int]()
        let charS = Array(s)
        let charT = Array(t)
        for char in charT {
            needs[char] = (needs[char] ?? 0) + 1
        }

        var match = 0
        while right < charS.count {
            let c = charS[right]
            if let value = needs[c] {
                window[c] = (window[c] ?? 0) + 1
                if window[c] == value {
                    match += 1
                }
            }
            right += 1
            while match == needs.count {
                if (right - left < minLen) {
                    // 更新最小子串的位置和长度
                    start = left
                    minLen = right - left
                }
                let c2 = charS[left]
                if let count = needs[c2], count > 0 {
                    window[c2] = (window[c2] ?? 0) - 1
                    if window[c2]! < count {
                        match -= 1
                    }
                }
                left += 1
            }
        }
        return minLen == Int.max ? "" : String(charS[start..<(minLen + start)])
    }


    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        var match = 0, left = 0, right = 0, res = [Int]()
        var window = [Character : Int]()
        var needs = [Character : Int]()
        let charsS = Array(s)
        let charsP = Array(p)
        for c in charsP {
            needs[c] = (needs[c] ?? 0) + 1
        }

        while right < charsS.count {
            let c = charsS[right]
            if let value = needs[c] {
                window[c] = (window[c] ?? 0) + 1
                if window[c] == value {
                    match += 1
                }
            }
            right += 1
            while match == needs.count {
                if right - left == charsP.count {
                    res.append(left)
                }
                let c2 = charsS[left]
                if let value = needs[c2] {
                    window[c2] = (window[c2] ?? 0) - 1
                    if window[c2]! < value {
                        match -= 1
                    }
                }
                left += 1
            }
        }
        return res


        while right < charsS.count {
            let c1 = charsS[right]
            if let value = needs[c1] {
                window[c1] = (window[c1] ?? 0) + 1
                if window[c1] == value {
                    match += 1
                }
            }
            right += 1
        }
    }
}
// import statements

/**
 * @author      Firstname Lastname <address @ example.com>
 * @version     1.6                 (current version number of program)
 * @since       1.2          (the version of the package this class was first added to)
 */
public class Test {
    // class body
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        let pd = DJProduct(code: "")
//        TestCategory.test()
//        TestCategory.initialize()
//        NSArray(array: [1, 2, 3]).bk_each {
//            print($0)
//        }
//
//        prices =  [7,6,4,3,1]
//        prices =  [1, 2]
//        prices = [1,2,3,4,5]
//        prices = [-2,1,-3,4,-1,2,1,-5,4]
//        let resutl = Solution1().minWindow("ADOBECODEBANC", "ABC")
        let resutl = Solution1().findAnagrams("baa", "aa")
        let a = Dog()

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}




