//
//  ViewController.swift
//  Solution4_TienDien
//
//  Created by Nguyễn Văn Hiếu on 3/9/24.
//
/**
 Viết ứng dụng tính tiền điện (dựa theo số điện và đơn giá theo quy định của Nhà nước). Giao diện tự nghĩ.

 Yêu cầu có input từ người dùng (UITextField)
 Một UIButton để thực hiện tính tiền.
 Một UILabel để hiển thị kết quả.
 Kết quả được làm tròn đến 2 chữ số sau dấu phẩy
 */
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtSoDien: UITextField!
    @IBOutlet weak var txtKetQua: UITextField!
    
    @IBAction func btnTinhTien(_ sender: Any)  {
        let consumption = Int(txtSoDien.text!) ?? 0
        let totalPrice = tinhTien(with: consumption)
        txtKetQua.text = "\(totalPrice) đ"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtKetQua.isEnabled = false
    }

    private func tinhTien(with n: Int) -> Double {
        var price: Double = 0.0
        switch n {
        case 0...50:
            price = Double(n) * Price.level1.rawValue
        case 51...100:
            price = 50 * Price.level1.rawValue + Double(n - 50) * Price.level2.rawValue
        case 101...200:
            price = 50 * Price.level1.rawValue + 50 * Price.level2.rawValue + Double(n - 100) * Price.level3.rawValue
        case 201...300:
            price = 50 * Price.level1.rawValue + 50 * Price.level2.rawValue + 100 * Price.level3.rawValue + Double(n - 200) * Price.level4.rawValue
        case 301...400:
            price = 50 * Price.level1.rawValue + 50 * Price.level2.rawValue + 100 * Price.level3.rawValue + 100 * Price.level4.rawValue + Double(n - 300) * Price.level5.rawValue
        default:
            price = 50 * Price.level1.rawValue + 50 * Price.level2.rawValue + 100 * Price.level3.rawValue + 100 * Price.level4.rawValue + 100 * Price.level5.rawValue + Double(n - 400) * Price.level6.rawValue
        }
        return round(price * 100) / 100
    }

}

