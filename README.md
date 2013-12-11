Layout Dexter
=============

Super awesome layouts for iOS apps written in JSON! 

Key Features
  * Layouts specified in JSON
  * Can work with local and remote layout files
  * Hot UI/UX Push : Inject layouts post builds
    * Hot pushes from remote services/API
    * eg. List view being returned as JSON from a feeds API?!
  * Subset of UIElements supported
  * TODO: Add more comprehensive support
  * TODO: Add support for interactions/events
  * TODO: Add thorough parse checking
  * TODO: Add extensions for user defined parsers for JSON properties/classnames
  * TODO: Add support for advanced text layouting into multiple columns using CoreText

Usage
==========
Add SBDynamicLayoutView.h/SBDynamicLayoutView.m to your project and #include them in the ViewController you want to add the layouts too.

```
    SBDynamicLayoutView* dynamicLayout = [[SBDynamicLayoutView alloc] initWithFrame:self.view.bounds];
    NSString* path = [[NSBundle mainBundle] pathForResource:@"layout" ofType:@"json"];
    NSData* response =[[NSMutableData alloc] initWithContentsOfFile:path];
    [dynamicLayout initWithJson:[NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:Nil]];
    [self.view addSubview: dynamicLayout];
```

Take a look at `layout.json` for a simple layout

Note the use of `children_remote`  to refer to a JSON file on a remote URL. 


About Layout Dexter
===================

Layout Dexter is based on a dinner table discussion and some hacking around, here is a simple JSON based layouting system for iOS.The code is more of a proof of concept. I would be spending roughly the period of the holidays to make this a bit more polished/usable. Contributions welcome. 
Disclaimers: This was whipped up in roughly an hour. So its fairly primitive. Objective-C is not my first langugage and I would love to hear from the "gurus" about what are better ways of achieving this. 
More importantly I want to know if doing such a thing(json for layouts/ remote layouts changing vies) even makes remote sense. 
Then there are Questions about whether this kind of code is acceptable from an Appstore Certification point of view.

For any feedback/query/suggestions/rants: kr.shaishav@gmail.com. Subject Prefix: "layout_dexter:<Your Subject>"
