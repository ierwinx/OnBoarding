import UIKit

class Vista1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    static func getController() -> Vista1ViewController {
        let storyboard = UIStoryboard(name: "Vista1ViewController", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: "vista1ViewController") as! Vista1ViewController
    }
    
}
