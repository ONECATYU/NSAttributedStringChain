```objc
    UILabel *contentLabel = ...;
    contentLabel.attributedText = NSAttributedString.chain
    .text(@"hello")
    .sysfontSize(17)
    .textColor([UIColor redColor])
    .backgroundColor([UIColor orangeColor])
    .strikethrough(YES)
    .strikethroughColor([UIColor yellowColor])
    .text(@",")
    .text(@"world")
    .textColor([UIColor orangeColor])
    ....
    .attributedString;
```
