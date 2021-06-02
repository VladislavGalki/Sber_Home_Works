//
//  CommentCell.swift
//  Lesson17-URLSession
//
//  Created by Владислав Галкин on 02.06.2021.
//

import UIKit

final class CommentCell: UITableViewCell {
    
    static let identifier = "commentCell"
    
    func configureCell(model: GetCommentsResponse) {
        textLabel?.text = model.body
    }
}
