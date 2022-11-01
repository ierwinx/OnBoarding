import UIKit

class Vista2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    static func getController() -> Vista2ViewController {
        let storyboard = UIStoryboard(name: "Vista2ViewController", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: "vista2ViewController") as! Vista2ViewController
    }
    
}
