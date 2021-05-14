import UIKit

class ViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var contenedor: UIView!
    @IBOutlet weak var pages: UIPageControl!
    @IBOutlet weak var btnContinuar: UIButton!
    
    // MARK: Properties
    private lazy var vista1ViewController: Vista1ViewController = {
        let storyboard = UIStoryboard(name: "Vista1ViewController", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "vista1ViewController") as! Vista1ViewController
        return viewController
    }()
    private lazy var vista2ViewController: Vista2ViewController = {
        let storyboard = UIStoryboard(name: "Vista2ViewController", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "vista2ViewController") as! Vista2ViewController
        return viewController
    }()
    private lazy var vista3ViewController: Vista3ViewController = {
        let storyboard = UIStoryboard(name: "Vista3ViewController", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "vista3ViewController") as! Vista3ViewController
        return viewController
    }()
    private lazy var vistas = [vista1ViewController, vista2ViewController, vista3ViewController]
    
    // MARK: Ciclo de vida
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.isUserInteractionEnabled = true

        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(gestoSwipe(gesto:)))
        swipe.numberOfTouchesRequired = 1
        swipe.direction = .left
        view.addGestureRecognizer(swipe)
        
        let swipe2 = UISwipeGestureRecognizer(target: self, action: #selector(gestoSwipeAtras(gesto:)))
        swipe2.numberOfTouchesRequired = 1
        swipe2.direction = .right
        view.addGestureRecognizer(swipe2)
        
        btnContinuar.setTitle("Continuar", for: .normal)
        
        pages.numberOfPages = vistas.count
        pages.addTarget(self, action: #selector(pageControl(sender:)), for: .valueChanged)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        contenedor.addSubview(vistas[0].view)
    }
    
    
    // MARK: Private Methods
    @objc private func pageControl(sender: UIPageControl) {
        if sender.currentPage == 2 {
            btnContinuar.setTitle("Finalizar", for: .normal)
        } else {
            btnContinuar.setTitle("Continuar", for: .normal)
        }
        contenedor.addSubview(vistas[sender.currentPage].view)
    }
    
    @objc private func gestoSwipe(gesto: UITapGestureRecognizer) {
        pages.currentPage = pages.currentPage + 1
        if pages.currentPage == 2 {
            btnContinuar.setTitle("Finalizar", for: .normal)
        }
        contenedor.addSubview(vistas[pages.currentPage].view)
    }
    
    @objc private func gestoSwipeAtras(gesto: UITapGestureRecognizer) {
        pages.currentPage = pages.currentPage - 1
        if pages.currentPage != 2 {
            btnContinuar.setTitle("Continuar", for: .normal)
        }
        contenedor.addSubview(vistas[pages.currentPage].view)
    }

    // MARK: Actions
    @IBAction func continuarAction(_ sender: Any) {
        pages.currentPage = pages.currentPage + 1
        if pages.currentPage == 2 {
            btnContinuar.setTitle("Finalizar", for: .normal)
        }
        contenedor.addSubview(vistas[pages.currentPage].view)
    }
    
}
