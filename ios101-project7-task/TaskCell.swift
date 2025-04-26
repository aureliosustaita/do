////
////  TaskCell.swift
////
//
//import UIKit
//
//// A cell to display a task
//class TaskCell: UITableViewCell {
//    @IBOutlet weak var titleLabel: UILabel!
//
//    // The closure called, passing in the associated task, when the "Complete" button is tapped.
//    var onCompleteButtonTapped: ((Task) -> Void)?
//
//    // The task associated with the cell
//    var task: Task!
//
//    // The function called when the "Complete" button is tapped.
//    // 1. Toggle the isComplete boolean state of the task
//    // 2. Update the cell's UI with the current task state
//    // 3. Call the `onCompleteButtonTapped` closure, passing in the current task so other view controllers can react to the change in task completed status.
//    @IBAction func didTapCompleteButton(_ sender: UIButton) {
//        // 1.
//        task.isComplete = !task.isComplete
//        // 2.
//        update(with: task)
//        // 3.
//        onCompleteButtonTapped?(task)
//    }
//
//    // Initial configuration of the task cell
//    // 1. Set the main task property
//    // 2. Set the onCompleteButtonTapped closure
//    // 3. Update the UI for the given task
//    func configure(with task: Task, onCompleteButtonTapped: ((Task) -> Void)?) {
//        // 1.
//        self.task = task
//        // 2.
//        self.onCompleteButtonTapped = onCompleteButtonTapped
//        // 3.
//        update(with: task)
//    }
//
//    // Update the UI for the given task
//    // The complete button's image has already been configured in the storyboard for default and selected states.
//    // 1. Set the title and note labels
//    // 2. Hide the note label if task.note property is empty. (This just helps the title label align with the completed button when there's no note)
//    // 3. Set the text color based on the task completed state
//    // 4. Set the "Completed" button's selected state based on the task's completed state.
//    // 5. Set the button's tint color based on the task's completed state. (blue if complete, system gray if not)
//    private func update(with task: Task) {
//        titleLabel.text = task.title
//        titleLabel.textColor = task.isComplete ? .secondaryLabel : .label
//    }
//
//    // This overrides the table view cell's default selected and highlighted behavior to do nothing, otherwise, the row would darken when tapped
//    // This is just a design / UI polish for this particular use case. Since we also have the "Completed" button in the row, it looks kinda weird if the whole cell darkens during selection.
//    override func setSelected(_ selected: Bool, animated: Bool) { }
//    override func setHighlighted(_ highlighted: Bool, animated: Bool) { }
//}
//
////import UIKit
////
////class TaskCell: UITableViewCell, UITextViewDelegate {
////
////    @IBOutlet weak var completeButton: UIButton!
////    @IBOutlet weak var titleLabel: UILabel!
////    @IBOutlet weak var noteLabel: UILabel!
////
////    var task: Task!
////    var onCompleteButtonTapped: ((Task) -> Void)?
////    var onTaskTitleUpdated: ((Task) -> Void)?
////
////    private var titleTextView: UITextView!
////
////    override func awakeFromNib() {
////        super.awakeFromNib()
////
////        // Setup double-tap gesture
////        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(enableTitleEditing))
////        doubleTap.numberOfTapsRequired = 2
////        titleLabel.isUserInteractionEnabled = true
////        titleLabel.addGestureRecognizer(doubleTap)
////
////        // Setup titleTextView
////        titleTextView = UITextView(frame: titleLabel.frame)
////        titleTextView.font = titleLabel.font
////        titleTextView.isHidden = true
////        titleTextView.delegate = self
////        titleTextView.backgroundColor = .clear
////        titleTextView.isScrollEnabled = false
////        contentView.addSubview(titleTextView)
////    }
////
////    @objc func enableTitleEditing() {
////        titleTextView.text = titleLabel.text
////        titleLabel.isHidden = true
////        titleTextView.isHidden = false
////        titleTextView.becomeFirstResponder()
////    }
////
////    func textViewDidEndEditing(_ textView: UITextView) {
////        guard let newText = textView.text else { return }
////        titleLabel.text = newText
////        task.title = newText // Update task model
////        onTaskTitleUpdated?(task) // Notify parent view controller if needed
////        titleLabel.isHidden = false
////        titleTextView.isHidden = true
////    }
////
////    func configure(with task: Task, onCompleteButtonTapped: ((Task) -> Void)?, onTaskTitleUpdated: ((Task) -> Void)?) {
////        self.task = task
////        self.onCompleteButtonTapped = onCompleteButtonTapped
////        self.onTaskTitleUpdated = onTaskTitleUpdated
////        update(with: task)
////    }
////
////    private func update(with task: Task) {
////        titleLabel.text = task.title
////        noteLabel.text = task.note
////        noteLabel.isHidden = task.note == "" || task.note == nil
////        titleLabel.textColor = task.isComplete ? .secondaryLabel : .label
////        completeButton.isSelected = task.isComplete
////        completeButton.tintColor = task.isComplete ? .systemBlue : .tertiaryLabel
////    }
////
////    @IBAction func didTapCompleteButton(_ sender: UIButton) {
////        task.isComplete.toggle()
////        update(with: task)
////        onCompleteButtonTapped?(task)
////    }
////
////    override func setSelected(_ selected: Bool, animated: Bool) { }
////    override func setHighlighted(_ highlighted: Bool, animated: Bool) { }
////}


//import UIKit
//
//class TaskCell: UITableViewCell, UITextViewDelegate {
//
//    @IBOutlet weak var titleLabel: UILabel!
//
//    var task: Task!
//    var onTaskTitleUpdated: ((Task) -> Void)?
//
//    private var titleTextView: UITextView!
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
//        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(enableTitleEditing))
//        doubleTap.numberOfTapsRequired = 2
//        titleLabel.isUserInteractionEnabled = true
//        titleLabel.addGestureRecognizer(doubleTap)
//
//        titleTextView = UITextView(frame: titleLabel.frame)
//        titleTextView.font = titleLabel.font
//        titleTextView.isHidden = true
//        titleTextView.delegate = self
//        titleTextView.backgroundColor = .clear
//        titleTextView.isScrollEnabled = false
//        contentView.addSubview(titleTextView)
//    }
//
//    @objc func enableTitleEditing() {
//        titleTextView.frame = titleLabel.frame
//        titleTextView.text = titleLabel.text
//        titleLabel.isHidden = true
//        titleTextView.isHidden = false
//        titleTextView.becomeFirstResponder()
//    }
//
//    func textViewDidEndEditing(_ textView: UITextView) {
//        guard let newText = textView.text else { return }
//        titleLabel.text = newText
//        task.title = newText
//        onTaskTitleUpdated?(task)
//        titleLabel.isHidden = false
//        titleTextView.isHidden = true
//    }
//
//    func configure(with task: Task, onTaskTitleUpdated: ((Task) -> Void)?) {
//        self.task = task
//        self.onTaskTitleUpdated = onTaskTitleUpdated
//        update(with: task)
//    }
//
//    private func update(with task: Task) {
//        titleLabel.text = task.title
//        titleLabel.textColor = task.isComplete ? .secondaryLabel : .label
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) { }
//    override func setHighlighted(_ highlighted: Bool, animated: Bool) { }
//}


//import UIKit
//
//class TaskCell: UITableViewCell, UITextViewDelegate {
//
//    @IBOutlet weak var titleLabel: UILabel!
//
//    var task: Task!
//    var onTaskTitleUpdated: ((Task) -> Void)?
//
//    private var titleTextView: UITextView!
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
//        // Enable double-tap on titleLabel
//        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(enableTitleEditing))
//        doubleTap.numberOfTapsRequired = 2
//        titleLabel.isUserInteractionEnabled = true
//        titleLabel.addGestureRecognizer(doubleTap)
//
//        // Setup titleTextView for multi-line editing
//        titleTextView = UITextView()
//        titleTextView.font = titleLabel.font
//        titleTextView.isHidden = true
//        titleTextView.delegate = self
//        titleTextView.backgroundColor = .clear
//        titleTextView.isScrollEnabled = false
//        titleTextView.translatesAutoresizingMaskIntoConstraints = false
//        contentView.addSubview(titleTextView)
//
//        // Constraints for dynamic resizing
//        NSLayoutConstraint.activate([
//            titleTextView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
//            titleTextView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
//            titleTextView.topAnchor.constraint(equalTo: titleLabel.topAnchor),
//            titleTextView.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor)
//        ])
//    }
//
////    // Called when double-tapping to start editing
////    @objc func enableTitleEditing() {
////        titleTextView.text = titleLabel.text
////        titleLabel.isHidden = true
////        titleTextView.isHidden = false
////        titleTextView.becomeFirstResponder()
////    }
//    @objc func enableTitleEditing() {
//        titleTextView.text = titleLabel.text
//        titleTextView.font = titleLabel.font
//        titleTextView.isHidden = false
//        titleTextView.alpha = 1.0
//        titleLabel.isHidden = true
//
//        // Force layout update
//        setNeedsLayout()
//        layoutIfNeeded()
//
//        titleTextView.becomeFirstResponder()
//    }
//
//
//    // Called while typing to dynamically resize the cell
//    func textViewDidChange(_ textView: UITextView) {
//        // Force the table view to update the cell height
//        if let tableView = self.findTableView() {
//            UIView.setAnimationsEnabled(false)
//            tableView.beginUpdates()
//            tableView.endUpdates()
//            UIView.setAnimationsEnabled(true)
//        }
//    }
//
//    // Called when editing ends
//    func textViewDidEndEditing(_ textView: UITextView) {
//        guard let newText = textView.text else { return }
//        titleLabel.text = newText
//        task.title = newText
//        onTaskTitleUpdated?(task)
//        titleLabel.isHidden = false
//        titleTextView.isHidden = true
//    }
//
//    func configure(with task: Task, onTaskTitleUpdated: ((Task) -> Void)?) {
//        self.task = task
//        self.onTaskTitleUpdated = onTaskTitleUpdated
//        update(with: task)
//    }
//
//    private func update(with task: Task) {
//        titleLabel.text = task.title
//        titleLabel.textColor = task.isComplete ? .secondaryLabel : .label
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) { }
//    override func setHighlighted(_ highlighted: Bool, animated: Bool) { }
//
//    // Helper to find the table view this cell belongs to
//    private func findTableView() -> UITableView? {
//        var view = self.superview
//        while let v = view {
//            if let tableView = v as? UITableView {
//                return tableView
//            }
//            view = v.superview
//        }
//        return nil
//    }
//}

//import UIKit
//
//class TaskCell: UITableViewCell, UITextViewDelegate {
//
//    @IBOutlet weak var titleLabel: UILabel!
//
//    var task: Task!
//    var onTaskTitleUpdated: ((Task) -> Void)?
//
//    private var titleTextView: UITextView!
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
//        // Double-tap gesture for editing
//        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(enableTitleEditing))
//        doubleTap.numberOfTapsRequired = 2
//        titleLabel.isUserInteractionEnabled = true
//        titleLabel.addGestureRecognizer(doubleTap)
//
//        // Setup titleTextView for editing
//        titleTextView = UITextView()
//        titleTextView.font = titleLabel.font
//        titleTextView.isHidden = true
//        titleTextView.delegate = self
//        titleTextView.backgroundColor = .clear // You can change to .white for debugging
//        titleTextView.textColor = .label
//        titleTextView.isScrollEnabled = false
//        titleTextView.translatesAutoresizingMaskIntoConstraints = false
//        contentView.addSubview(titleTextView)
//
//        // Match constraints to titleLabel
//        NSLayoutConstraint.activate([
//            titleTextView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
//            titleTextView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
//            titleTextView.topAnchor.constraint(equalTo: titleLabel.topAnchor),
//            titleTextView.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor)
//        ])
//    }
//
//    @objc func enableTitleEditing() {
//        titleTextView.text = titleLabel.text
//        titleTextView.font = titleLabel.font
//        titleTextView.isHidden = false
//        titleLabel.isHidden = true
//
//        // Force the textView to exactly match label frame
//        titleTextView.frame = titleLabel.frame
//
//        setNeedsLayout()
//        layoutIfNeeded()
//
//        titleTextView.becomeFirstResponder()
//    }
//
//
//    func textViewDidChange(_ textView: UITextView) {
//        if let tableView = findTableView() {
//            UIView.setAnimationsEnabled(false)
//            tableView.beginUpdates()
//            tableView.endUpdates()
//            UIView.setAnimationsEnabled(true)
//        }
//    }
//
//    func textViewDidEndEditing(_ textView: UITextView) {
//        guard let newText = textView.text else { return }
//        titleLabel.text = newText
//        task.title = newText
//        onTaskTitleUpdated?(task)
//        titleLabel.isHidden = false
//        titleTextView.isHidden = true
//    }
//
//    func configure(with task: Task, onTaskTitleUpdated: ((Task) -> Void)?) {
//        self.task = task
//        self.onTaskTitleUpdated = onTaskTitleUpdated
//        update(with: task)
//    }
//
//    private func update(with task: Task) {
//        titleLabel.text = task.title
//        titleLabel.textColor = task.isComplete ? .secondaryLabel : .label
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) { }
//    override func setHighlighted(_ highlighted: Bool, animated: Bool) { }
//
//    // Helper to find parent table view
//    private func findTableView() -> UITableView? {
//        var view = self.superview
//        while let v = view {
//            if let tableView = v as? UITableView {
//                return tableView
//            }
//            view = v.superview
//        }
//        return nil
//    }
//}

import UIKit

class TaskCell: UITableViewCell, UITextViewDelegate {

    @IBOutlet weak var titleLabel: UILabel!

    var task: Task!
    var onTaskTitleUpdated: ((Task) -> Void)?

    var titleTextView: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()

        // Disable autoresizing mask for titleLabel to allow constraints
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        // Add constraints to titleLabel programmatically
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])

        titleLabel.numberOfLines = 0 // Allow it to grow

        // Double-tap to edit
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(enableTitleEditing))
        doubleTap.numberOfTapsRequired = 2
        titleLabel.isUserInteractionEnabled = true
        titleLabel.addGestureRecognizer(doubleTap)

        // Setup UITextView
        titleTextView = UITextView()
        titleTextView.font = titleLabel.font
        titleTextView.isHidden = true
        titleTextView.delegate = self
        titleTextView.backgroundColor = .clear
        titleTextView.textColor = .label
        titleTextView.isScrollEnabled = false
        titleTextView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleTextView)

        NSLayoutConstraint.activate([
            titleTextView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            titleTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }

    @objc func enableTitleEditing() {
        titleTextView.text = titleLabel.text
        titleTextView.font = titleLabel.font
        titleTextView.isHidden = false
        titleLabel.isHidden = true

        titleTextView.becomeFirstResponder()

        // Update layout on edit start
        if let tableView = findTableView() {
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }

    func textViewDidChange(_ textView: UITextView) {
        if let tableView = findTableView() {
            UIView.setAnimationsEnabled(false)
            tableView.beginUpdates()
            tableView.endUpdates()
            UIView.setAnimationsEnabled(true)
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        guard let newText = textView.text else { return }
        titleLabel.text = newText
        task.title = newText
        onTaskTitleUpdated?(task)
        titleLabel.isHidden = false
        titleTextView.isHidden = true
    }

    func configure(with task: Task, onTaskTitleUpdated: ((Task) -> Void)?) {
        self.task = task
        self.onTaskTitleUpdated = onTaskTitleUpdated
        update(with: task)
    }

    private func update(with task: Task) {
        titleLabel.text = task.title
        titleLabel.textColor = task.isComplete ? .secondaryLabel : .label
    }

    override func setSelected(_ selected: Bool, animated: Bool) { }
    override func setHighlighted(_ highlighted: Bool, animated: Bool) { }

    private func findTableView() -> UITableView? {
        var view = self.superview
        while let v = view {
            if let tableView = v as? UITableView {
                return tableView
            }
            view = v.superview
        }
        return nil
    }
}

