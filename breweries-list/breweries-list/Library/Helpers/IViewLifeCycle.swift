import Foundation

@objc
protocol IViewLifeCycle: class {
    @objc optional
    func viewDidLoad()
    
    @objc optional
    func viewWillAppear()
    
    @objc optional
    func viewDidAppear()
    
    @objc optional
    func viewWillDisappear()
    
    @objc optional
    func viewDidDisappear()
}
