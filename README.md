## Requirements

- XCode 11.0
- iOS 13.0

## Architectural Decisions

Most of my architectural decisions were based on the premiss of keeping things simple. When confronted with a decision I usually tried to narrow the scope to get something in instead of blowing something all out. 

* iPad, iPhone, or Universal: I decided to support both the iPhone and iPad via a universal app. Additionally, all default orientations should also be supported.
* Search: The biggest decision I made while developing the app was deciding how many options I should allow the user to have when searching. I originally intended to allow everything the API allowed (age, sex, pregnant, who, category), but after playing around with things I realized that would be overkill. Furthermore, when trying to develope the search interface it just felt like too options, so I whittled things down to just the age and sex. This allowed me to put in a persistant view just under the resource table that works well in both the iPad and iPhone versions. Unfortunately, the drawback is that I had to drop the "pregnant" option when searching.
* Model-View-Controller: I went with the MVC design pattern because it was a simple app.
* Reduced Model: After playing around with the API I decided to drastically reduce the fields that were being returned and captured since I wasn't going to use the extra fields. I guess it's and API like this were GraphQL shows why it has it's benefits since you have more control over what's being returned.
* Display Content: I chose to have an intermediary step between when you select a topic and actually display the content. This intermediary displayed the sections. In theory I thought that there could be any number of sections. In practice it kind of appears that there are only 2 (or zero which is noted below) sections. Still, things are coded in such a way that should the API ever add additional sections you shouldn't have to change a thing.
* No Section, Sections: As mentioned above, there were some sections that didn't have a title or description. Just the content. In those cases I put some default text that additional content is just a click away.
* Webview vs. TextView: Since the actual content is in HTML markup I debated between using a textview and attributed text vs WebKit. In the end I liked that when clicking the links in a textview would open up safari instead of keeping you inside the app, so I went with the textview.
* Cocoapods: The app does use everyones favorite dependency manager, but I went ahead and checked in all the pods. There is always a discussion about whether to check them in or not, but I tend to believe it's better to have everything you need to compile bundled together.
    * Alamofire: Went with the latest non-beta version of Alamofire. I mainly used Alamofire because I wanted access to AlamofireImage.


## Final Note

Since there was a bit of a tight turnaround I didn't get to implement a number of features that I would have liked to including:

* Filter by categories
* Pregnant search parameter.
* Grabbing the users language preference and passing it along as a search parameter.
* Expanding the search parameters to all of the ones available in the API.

With that said, the app is a pretty good representation of what I bring to the table, so I hope you enjoy it!



