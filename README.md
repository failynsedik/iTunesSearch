# iTunes Search

## iPhone Screenshots

To be added once I added a theme/style to the app.

## Project Description

This project is a partial clone of Apple's iTunes app. Please see the next section for the features currently developed.

## Features
- Search functionality for media type `movie` and country `au` (Endpoint: itunes.apple.com/search)
- Allows adding favorite movies on both the search list, the favorites list and the detail view
- Favorites are available while offline via the **Favorites** tab (Note: that images are not cached for offline use)
- Handles different states (loading, pagination loading, error, loaded search results, empty, reached the end of search results)
- Only supports iOS 15.4 and above (Reason: I wanted to use new APIs. 😂)

## Developer Notes
- SwiftUI (Only using Apple's base UI components without much customization)
- MVVM architecture
 - Other model objects are accessed directly on the view due to SwiftUI's runtime errors (e.g. accessing `FetchedResults` inside `ObservedObject`)
 - Data model, domain model and `CoreData` model are all separate models since each has their own use in this particular project (at least, at the current scale of the app)
- Persistence used is `CoreData` alone
- The third party library used in this project is a small library that I created for simple GET/POST API calls

### TODO:
- [ ] App icon
- [ ] Launch screen
- [ ] Theme/Style/Skin
- [ ] Support other media types
- [ ] Pull out reusable code and then create a new small library for future use
