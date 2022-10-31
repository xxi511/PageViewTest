import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let pageVC = MyPageVC()
        navigationController?.show(pageVC, sender: nil)
    }


}

