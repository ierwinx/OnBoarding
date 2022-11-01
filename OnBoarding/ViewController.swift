import UIKit

class ViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var contenedor: UIView!
    @IBOutlet weak var pages: UIPageControl!
    @IBOutlet weak var btnContinuar: UIButton!
    
    // MARK: Properties
    private lazy var vistas = [Vista1ViewController.getController(), Vista2ViewController.getController(), Vista3ViewController.getController()]
    private var iCurrentView = 0
    
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
        showView(iView: 0)
    }
    
    private func showView(iView: Int) {
        let vista = vistas[iView]
        vista.view.frame = CGRect(x: 0, y: 0, width: contenedor.frame.width, height: contenedor.frame.height)
        contenedor.addSubview(vista.view)
        addChild(vista)
        vista.didMove(toParent: self)
    }
    
    private func removeView(iView: Int) {
        let vista = vistas[iView]
        vista.willMove(toParent: nil)
        vista.removeFromParent()
        vista.view.removeFromSuperview()
    }
    
    private func setNewView(iNewView: Int) {
        removeView(iView: iCurrentView)
        iCurrentView = iNewView
        showView(iView: iCurrentView)
    }
    
    // MARK: Private Methods
    @objc private func pageControl(sender: UIPageControl) {
        if sender.currentPage == 2 {
            btnContinuar.setTitle("Finalizar", for: .normal)
        } else {
            btnContinuar.setTitle("Continuar", for: .normal)
        }
        setNewView(iNewView: sender.currentPage)
    }
    
    @objc private func gestoSwipe(gesto: UITapGestureRecognizer) {
        pages.currentPage = pages.currentPage + 1
        if pages.currentPage == 2 {
            btnContinuar.setTitle("Finalizar", for: .normal)
        }
        setNewView(iNewView: pages.currentPage)
    }
    
    @objc private func gestoSwipeAtras(gesto: UITapGestureRecognizer) {
        pages.currentPage = pages.currentPage - 1
        if pages.currentPage != 2 {
            btnContinuar.setTitle("Continuar", for: .normal)
        }
        setNewView(iNewView: pages.currentPage)
    }

    // MARK: Actions
    @IBAction func continuarAction(_ sender: Any) {
        pages.currentPage = pages.currentPage + 1
        if pages.currentPage == 2 {
            btnContinuar.setTitle("Finalizar", for: .normal)
        }
        setNewView(iNewView: pages.currentPage)
    }
    
}
