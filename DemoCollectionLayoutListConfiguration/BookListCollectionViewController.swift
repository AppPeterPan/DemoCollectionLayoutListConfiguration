//
//  BookListCollectionViewController.swift
//  DemoCollectionLayoutListConfiguration
//
//  Created by Peter Pan on 2023/1/9.
//

import UIKit

class BookListCollectionViewController: UICollectionViewController {
    
    let books = [
        Book(name: "佩珀爾的幻象", summary: "當你擁有一個微弱的，發動方式還有點丟臉的超能力時，你會怎麼使用它？貓貓X超能力X尼采＝難以預測發展、令人心跳加速的伊坂小說！我將自己有興趣的、喜歡的東西，擔心的、想做的事情，全都放進這本書，成了一部包含至今為止我的所有小說特點的故事。\n「看見未來，奪回原本的人生！」檀千鄉，一個普通至極的中學國文老師。只是他有著在特定條件下，能夠稍微看到他人的明日的特殊能力。然而一直以來，檀都覺得這個超能力根本不可能幫助任何人，到最後甚至令他產生了心理創傷。"),
        Book(name: "Fish Story－龐克救地球", summary: "動物園和引擎，小偷和活人獻祭；魚和空白間奏，洋芋片和全壘打——四篇由毫不相關的關鍵字組合起來的絕妙故"),
        Book(name: "家鴨與野鴨的投幣式置物櫃", summary: "喜劇發生在現在。大學新鮮人「我」，哼著Bob Dylan的歌搬到新公寓，鄰居的神祕美男子河崎竟主動搭訕：「要不要一起去搶書店？」目的是送給不丹籍友人一本字典《廣辭苑》，好讓他查清楚「家鴨」與「野鴨」的差別。「我」莫名成為共犯，豈料襲擊書店成功，卻錯偷了《廣辭林》！？")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = generateLayout()
    }
    
    private func generateLayout() -> UICollectionViewLayout {
        let listConfiguration = UICollectionLayoutListConfiguration(appearance: .plain)
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(BookCollectionViewCell.self)", for: indexPath) as! BookCollectionViewCell
    
        let book = books[indexPath.item]
        cell.nameLabel.text = book.name
        cell.coverImageView.image = UIImage(named: book.name)
        cell.summaryLabel.text = book.summary
        return cell
    }

}
