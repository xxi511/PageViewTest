import UIKit

final class MyPageVC: UIPageViewController {
    private let colors = [UIColor.red, UIColor.green, UIColor.blue]

    init() {
        super.init(transitionStyle: .scroll,
                   navigationOrientation: .horizontal)
        self.delegate = self
        self.dataSource = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {

        setViewControllers([tempVC()], direction: .forward, animated: true)
        self.view.backgroundColor = .white
        self.title = "Random title: \(Int.random(in: 0...99))"

        // Enable the following line to test auto scroll
        // autoScroll()
    }

    func autoScroll() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            if let scrollView = self.view.subviews.first(where: { $0 is UIScrollView }) as? UIScrollView {
                var offset = scrollView.contentOffset
                offset.x += 200
                scrollView.setContentOffset(offset, animated: true)
            }
        }
    }

    func tempVC() -> UIViewController {
        let tempVC = UIViewController()
        tempVC.view.backgroundColor = colors[Int.random(in: 0...2)]
        return tempVC
    }
}

extension MyPageVC: UIPageViewControllerDelegate {
    func pageViewController(
        _ pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool,
        previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool
    ) {
        self.title = "Random title: \(Int.random(in: 0...99))"
    }
}

extension MyPageVC: UIPageViewControllerDataSource {
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
    ) -> UIViewController? {
        tempVC()
    }

    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController
    ) -> UIViewController? {
        tempVC()
    }
}
