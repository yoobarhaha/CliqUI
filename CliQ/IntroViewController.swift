

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {
    
    

    @IBOutlet var slideScrollView: UIScrollView!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        
        slideScrollView.delegate=self
        let slides:[Slide]=createSlides()
        setupSlideScrollView(slides: slides)
        pageControl.numberOfPages=slides.count
        pageControl.currentPage=0
    }
    func createSlides() -> [Slide] {
        
        let slide1: Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.cardIntroImage.image=UIImage(named: "card_Intro@1x.png")
        slide1.cardIntroLabel.text="첫번째 장"
        
        let slide2: Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
               slide2.cardIntroImage.image=UIImage(named: "card_Intro@1x.png")
               slide2.cardIntroLabel.text="두번째 장"
               
        let slide3: Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
               slide3.cardIntroImage.image=UIImage(named: "card_Intro@1x.png")
               slide3.cardIntroLabel.text="세번째 장"
               
        let slide4: Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
               slide4.cardIntroImage.image=UIImage(named: "card_Intro@1x.png")
               slide3.cardIntroLabel.text="네 번째 장"
               
        let slide5: Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
               slide5.cardIntroImage.image=UIImage(named: "card_Intro@1x.png")
               slide5.cardIntroLabel.text="다섯번째 장"
               
        
       return [slide1,slide2,slide3,slide4,slide5]
       
    }
    
    
    func setupSlideScrollView(slides : [Slide]) {
        slideScrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        slideScrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count
            ), height: view.frame.height)
        slideScrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            slideScrollView.addSubview(slides[i])
        }
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex=round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage=Int(pageIndex)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

