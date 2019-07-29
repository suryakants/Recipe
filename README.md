RECIPE

SUMMARY

This simple iOS application let user fetch recipes data from contentful and display them in a table view. When user click any of the tableview cell user will be present with the simple detail view
Framework Used

Contentful

Contentful framework used to fetch data stored with contentful database.

SDWebImage

This library is used to download images from the Firebase Storage



Installation

•	Go to Recipe target info.plist and set spaceid and access token 

•	After this setup update pods by traversing to root directory from terminal and run 
pod install command. Open project by clicking Recipe.xcworkspace.

Architecture

MVVM-C used to develop this app by keeping simplicity and provided testing coverage by MVVM-C.
Using MVVM, we separated our business logic from our presentation layer by moving it into the view model. However when we are aiming for reusable, flexible code, there is still the navigation problem left. As soon as you put navigation throughout your entire view or view models, you create a lot of coupling and therefore make it harder to reuse your code.
The responsibility of the coordinator is to handle the navigation and the flow of the app.


TODO:

1.	Test case need to be written
2.	Error handling case needs to be more solid

Note: Please not that this app is design by testability of the code keeping in mind and most of the part can be unit tested easily.



  
