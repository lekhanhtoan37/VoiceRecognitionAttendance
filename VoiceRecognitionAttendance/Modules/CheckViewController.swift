//
//  CheckViewController.swift
//  VoiceRecognitionAttendance
//
//  Created by Le Toan on 7/2/20.
//  Copyright © 2020 toanlk. All rights reserved.
//

import UIKit

class CheckViewController: BaseViewController {
    
    var arrayValue: [String] = []
    
    
    @IBOutlet weak var roomLabel: UILabel!
    @IBOutlet weak var nameRoom: UILabel!
    @IBOutlet weak var confirmButton: UIButton!
    
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        arrayValue = paperText1.split(separator: ".").map {
            $0.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        print(arrayValue)
        
        textView.text = getRandomString(input: arrayValue)
    }
    
    func getRandomString(input: [String]) -> String {
        guard input.count > 0 else {
            return ""
        }
        return input.randomElement()!
    }
    
    func checkWithServer() {
        
    }
}

let paperText1: String =
"""
Lưỡng viện Mỹ thông qua dự luật trừng phạt ngân hàng Trung Quốc liên quan quan chức thực thi luật an ninh Hong Kong và hối thúc Trump ký luật.

Thượng viện Mỹ hôm nay nhất trí gửi cho Tổng thống Donald Trump dự luật đề xuất các biện pháp trừng phạt cứng rắn về vấn đề Hong Kong, bao gồm hình phạt đối với các ngân hàng có vai trò trong việc "xâm phạm" quyền tự trị của đặc khu hành chính này.

"Đây là lúc quan trọng hơn bao giờ hết. Tôi hy vọng Tổng thống Trump sẽ lập tức ký luật", thượng nghị sĩ đảng Dân chủ Chris Van Hollen cho hay. Hollen trước đó ra tuyên bố chung với thượng nghị sĩ đảng Cộng hòa Pat Toomey, người cùng ông nỗ lực xúc tiến dự luật, nói rằng "nước Mỹ phải sát cánh với người dân Hong Kong".

Hiện chưa rõ Trump có ký thông qua dự luật hay không.

Dự luật trước đó đã được Hạ viện Mỹ thông qua bằng hình thức đồng thuận, phương pháp được áp dụng cho những dự luật không gây tranh cãi và không có thượng nghị sĩ nào phản đối. Thượng viện Mỹ đã thông qua dự luật tương tự vào tuần trước, nhưng theo quy định của quốc hội, dự luật vẫn phải được Thượng viện thông qua trước khi được gửi tới Nhà Trắng để Tổng thống ký ban hành hoặc phủ quyết.

Cảnh sát Hong Kong đối phó người biểu tình hôm 1/7. Ảnh: CNN.
Cảnh sát Hong Kong đối phó người biểu tình hôm 1/7. Ảnh: CNN.

Trước đó, Chủ tịch Hạ viện Nancy Pelosi xuất hiện tại một phiên điều trần về tình hình Hong Kong và nói rằng luật an ninh đánh dấu cái chết của mô hình "một quốc gia, hai chế độ". Pelosi cho rằng luật này "phá hủy các quyền tự do" mà cư dân Hong Kong đã được hứa hẹn.

Mỹ đã bắt đầu quy trình tước quy chế đặc biệt cho Hong Kong, dừng xuất khẩu quốc phòng và hạn chế thành phố tiếp cận với các sản phẩm công nghệ cao của Mỹ.

Luật an ninh Hong Kong được thông qua ngày 30/6, hình sự hóa 4 loại tội phạm an ninh quốc gia gồm ly khai, lật đổ, khủng bố và thông đồng với nước ngoài hoặc các phần tử bên ngoài để gây nguy hiểm cho an ninh. Người Hong Kong vi phạm luật có thể bị kết án chung thân, quyền tố tụng và xét xử các "trường hợp nghiêm trọng" thuộc về chính quyền trung ương.

Ngoại trưởng Mỹ Mike Pompeo và nhiều nghị sĩ Mỹ thể hiện sự bất bình khi Trung Quốc thông qua luật an ninh mới. Trong khi đó, chính phủ Anh cho rằng luật an ninh vi phạm quyền tự trị của Hong Kong và thông báo mở rộng lộ trình định cư, nhập tịch cho ba triệu cư dân thành phố.

Trung Quốc tuyên bố 52 nước ủng hộ luật an ninh Hong Kong, khẳng định đạo luật chỉ nhắm vào một bộ phận nhỏ xâm phạm an ninh quốc gia ở đặc khu, không ảnh hưởng đến đa số người dân còn lại. Bắc Kinh cũng yêu cầu các nước không can thiệp công việc nội bộ liên quan đến vấn đề Hong Kong.

Hàng nghìn người Hong Kong hôm 1/7 xuống đường biểu tình phản đối luật an ninh. Cảnh sát sử dụng hơi cay, vòi rồng để giải tán đám đông và bắt hàng trăm người, trong đó có một số người bị bắt theo đạo luật vừa ban hành.

Mẫu bệnh phẩm người Indonesia, 31 tuổi, nghi nhiễm nCoV được bệnh viện FV và Bệnh Nhiệt đới xét nghiệm dương tính, xét nghiệm tại Viện Pasteur âm tính.

Chiều 2/7, Bệnh viện FV phát đi thông cáo cho biết ngày 30/6 đã xét nghiệm mẫu bệnh phẩm nghi nhiễm của người Indonesia do một phòng khám ở quận 2 chuyển đến, bằng phương pháp PCR "chiến thuật Mỹ".

Theo đó, chiến thuật này sử dụng gene đích là gen N, một gene đặc hiệu của nCoV, được Trung tâm Kiểm soát Dịch bệnh (CDC) Mỹ phê chuẩn.

"Mẫu bệnh phẩm của người Indonesia này được phòng xét nghiệm FV áp dụng chiến thuật của CDC Mỹ, dương tính nhẹ với gene N và gene RdRP, cho phép kết luận dương tính với nCoV".

FV cho biết mẫu bệnh phẩm sau đó được chuyển đến Bệnh viện Bệnh Nhiệt đới TP HCM kiểm tra chéo theo quy định của Bộ Y tế. Kết quả cũng dương tính.

Tuy nhiên, tối cùng ngày, Viện Pasteur TP HCM tiến hành xét nghiệm mẫu bệnh phẩm của người nghi nhiễm, theo hai phương pháp xét nghiệm kháng nguyên (Realtime - PCR) và xét nghiệm kháng thể (Elisa). Kết quả đồng thời cho thấy người nghi nhiễm và 145 người liên quan đều âm tính với nCoV.

Lý giải vì sao các kết quả xét nghiệm trái ngược nhau, đại diện Bệnh viện FV cho rằng "do chiến thuật xét nghiệm khác nhau". Cụ thể, Việt Nam đang áp dụng hai chiến thuật xét nghiệm Covid-19 được Bộ Y tế phê duyệt.

Thứ nhất là chiến thuật sử dụng gene đích - như cách của FV đang dùng. Thứ hai là chiến thuật được Tổ chức Y tế Thế giới (WHO) đề xuất, với gene mục tiêu là gene E - cách hiện được Viện Pasteur TP HCM dùng.

"Cũng trên bệnh nhân này, Viện Pasteur TP HCM đã lấy một mẫu bệnh phẩm khác để xét nghiệm PCR theo chiến lược của WHO. Do không phát hiện thấy gene E mục tiêu nên mẫu được kết luận là âm tính", thông cáo của Bệnh viện FV nêu rõ.

Theo FV, những xét nghiệm về huyết thanh học cho thấy mẫu bệnh phẩm này dương tính kháng thể lớp IgG (được hiểu là đã từng bị bệnh) và âm tính với kháng thể lớp IgM (dùng xác định đợt nhiễm trùng cấp).

"Kết hợp với các mẫu xét nghiệm phát hiện gene N, gene RdRp và không thấy gene E, có thể kết luận đây là một ca đã bị bệnh từ trước đó và nay không còn hoạt tính của virus. Hay nói cách khác là đã khỏi bệnh", thông tin từ FV.

Chia sẻ với VnExpress chiều 2/7, Phó giáo sư, tiến sĩ Nguyễn Vũ Trung, Trưởng Bộ môn Vi sinh, Bộ môn Vi sinh - Ký sinh trùng lâm sàng, Trường Đại học Y Hà Nội, giải thích, xét nghiệm Realtime RT-PCR bản chất là phát hiện vật liệu di truyền (ARN) của virus, khả năng và tỷ lệ phát hiện nCoV ở từng loại bệnh phẩm, từng lần lấy bệnh phẩm khác nhau ở cùng một người và khác nhau giữa người này với người khác, thay đổi qua từng giai đoạn của bệnh.

"Một số bệnh nhân bị viêm phổi có thể kết quả phát hiện dịch họng mũi, họng miệng âm tính nhưng dương tính với dịch ở đường hô hấp dưới hoặc bệnh phẩm khác như phân chẳng hạn", bác sĩ Trung cho biết.

Độ chính xác của kỹ thuật còn bị ảnh hưởng bởi nhiều yếu tố khác nhau như khi lấy bệnh phẩm có đúng vị trí không, đủ lượng dịch, lượng virus trong dịch không, bệnh phẩm có được vận chuyển, bảo quản đảm bảo các điều kiện tối ưu không, việc xử lý bệnh phẩm có đúng quy định, ARN của virus có bị phá hủy không, các khâu của quá trình xét nghiệm có được đảm bảo theo yêu cầu của hệ thống quản lý chất lượng xét nghiệm tại cơ sở y tế hay không. Nếu không đảm bảo, việc phát hiện nCoV sẽ bị ảnh hưởng, cho kết quả sai lệch, theo bác sĩ Trung.

Bên cạnh đó, sự xuất hiện ARN của nCoV trong cơ thể không đồng nghĩa với việc virus còn sống và còn tồn tại trong cơ thể người, cũng không đồng nghĩa với việc virus có thể lây truyền từ người này sang người khác.

Một chuyên gia không muốn nêu tên, cho biết việc xét nghiệm PCR hiện nay đều theo hướng dẫn của WHO. Để xác định nCoV, đầu tiên kỹ thuật viên xác định gene E để khẳng định mẫu bệnh phẩm đó nhiễm virus họ corona, sau đó khẳng định bằng cách tiếp tục tìm gene RdRP và gene N.

Về người Indonesia nghi nhiễm, bác sĩ Huỳnh Thanh Hà, Phó Giám đốc Sở Y tế Bình Dương, cho biết sau khi Bộ Y tế khẳng định bệnh nhân âm tính với nCoV, người này và 145 người tiếp xúc gần, đã không còn bị cách ly, trở lại cuộc sống bình thường.

"Tuy nhiên, chúng tôi vẫn căn dặn anh ấy phải có biện pháp phòng bệnh khi ra ngoài như đeo khẩu trang, thường xuyên rửa tay... Nơi làm việc của bệnh nhân cũng đã được phun thuốc khử khuẩn. Công việc tại công ty này diễn ra bình thường, tuân thủ các biện pháp phòng bệnh theo quy định", ông Hà nói.

Người Indonesia này, sinh năm 1989, làm việc ở Bình Dương, đến một phòng khám ở quận 2, TP HCM, khám bệnh hôm 30/6 nhằm hoàn tất thủ tục xác nhận không nhiễm nCoV để về nước.

Người này nhập cảnh ngày 11/3 qua Cảng hàng không quốc tế Tân Sơn Nhất, lưu trú tại tầng 2, khách sạn Âu Lạc, phường Mỹ Phước, thị xã Bến Cát, Bình Dương. Anh là kỹ sư máy cho Nhà máy số 4, Công ty Kyungbang tại Khu công nghiệp Bàu Bàng, thị trấn Lai Uyên, cách khách sạn lưu trú 20 km, sáng đi tối về bằng xe đưa rước riêng hàng ngày của công ty.

Trong quá trình ở Việt Nam từ ngày 11/3 đến nay, người này sức khỏe bình thường, chủ yếu sinh sống và đi lại từ khách sạn đến nơi làm việc. Hiện tất cả người nghi nhiễm lẫn người tiếp xúc âm tính với nCoV.

TP HCMHư hỏng từ lớp 7, hai lần vào tù nhưng khi ngồi bên quan tài mẹ, Nguyễn Thanh Đàm nhận ra, bà là người duy nhất tin anh có thể bỏ cuộc sống giang hồ, cướp bóc.

"Tôi đã từng rất buồn. Tôi tiếc vì mẹ không thể thấy được thành quả của tôi ngày hôm nay", Đàm nói khi vừa kết thúc buổi live stream chia sẻ kiến thức, định hướng nghề nghiệp cho sinh viên.

Ở tuổi 37, anh đã là một chuyên gia cao cấp, chủ tịch một tập đoàn công nghệ và kỹ thuật ôtô với bốn công ty con. Nhưng ít ai ngờ chàng trai quê Đăk Lăk này từng có một quá khứ "khét tiếng giang hồ" với hai lần vào tù vì cầm đầu những vụ cướp táo tợn.
"""
