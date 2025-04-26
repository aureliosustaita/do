import UIKit

class TaskDetailViewController: UIViewController {

    var task: Task!
    var onTaskDeleted: ((Task) -> Void)?

    @IBAction func didSwipeUpToDelete(_ sender: UISwipeGestureRecognizer) {
        // Delete the task
        onTaskDeleted?(task)
        navigationController?.popViewController(animated: true)
    }
}

