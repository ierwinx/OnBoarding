import UIKit

class Vista3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    static func getController() -> Vista3ViewController {
        let storyboard = UIStoryboard(name: "Vista3ViewController", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: "vista3ViewController") as! Vista3ViewController
    }

}
