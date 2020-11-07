# Flutter Registration Form

### About App

A simple Flutter Registration Form Application to demonstrate the usage for MVVM design pattern using ChangeNotifiers, RxDart, Providers (Dependency Injection),Retrofit-Dio along with Test Cases & isolation of UI, business logic and data sources.

The application demonstrates the best practices which can be adopted in flutter application development to avoid code maintaince issues overtime.

### Components Used
-  [MVVM Architecture](https://developer.android.com/jetpack/arch/) - Robust, testable, and maintainable app with classes for managing your UI component lifecycle and handling data persistence.
-  Isolating of UI, business logic and data sources responsibilities creating a Testable system
-  [Provider](https://pub.dev/packages/provider) - A pragmatic lightweight dependency injection framework [MultiProvider] for flutter which also is helpful in State Management.
-  [ChangeNotifier](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple#changenotifier) -  a simple class included in the Flutter SDK which provides change notification to its listeners
-  [RxDart](https://pub.dev/packages/rxdart) - Build data objects that notify views when the underlying data changes.
-  [Mockito](https://flutter.dev/docs/cookbook/testing/unit/mocking) - An Flutter testing framework for unit and runtime UI tests.
-  [Internationalizing](https://flutter.dev/docs/development/accessibility-and-localization/internationalization) - Flutter provides widgets and classes that help with internationalization and the Flutter libraries themselves are internationalized.
-  [Retrofit-Dio](https://pub.dev/packages/retrofit) - Retrofit.dart is an dio client generator using source_gen and inspired by Chopper and Retrofit.

## Screenshots

<img src="https://github.com/faiyyazs/flutter_registration_form/blob/main/captures/personal-data-part1.png" alt="drawing" width="200"/><img src="https://github.com/faiyyazs/flutter_registration_form/blob/main/captures/personal-data-part2.png" alt="drawing" width="200"/><img src="https://github.com/faiyyazs/flutter_registration_form/blob/main/captures/ktpaddress.png" alt="drawing" width="200"/><img src="https://github.com/faiyyazs/flutter_registration_form/blob/main/captures/review-data.png" alt="drawing" width="200"/>

## Data Flow
Let’s start explaining Data Flow in Clean Architecture as follows,
> 1. UI calls method from ViewModel.
> 2. ViewModel executes Use case.
> 3. Use case combines data from Multiple Repositories.
> 4. Each Repository returns data from a Data Source (Cached or Remote). [ In current scope only Remote ]
> 5. Information flows back to the UI where we display the list of requested information.

## Architecture 

In the Architecture adopted, relationship that exists between the different layers is very crucial.

Different layers & their boundaries are explained below,

**Presentation/App Layer** contains UI (Views)_ that are coordinated by ViewModels which execute one or more Use cases._ Presentation layer depends on Domain Layer.

**Domain Layer** It contains _Entities, Use cases & Repository Interfaces._ Use cases combine data from one or more Repository Interfaces.

**Data Layer** contains _Repository Implementations and one or more Data Sources._ Repositories are responsible to coordinate data from the different Data Sources. Data Layer depends on Domain Layer.
 
The Architecture helps Isolates UI, business logic and data sources' responsibilities creating a Testable system.

Other components include,

**Providers** which are used for state management adopting Producer & Consumer design patterns. 

**ProxyProviders** are useful to create dependent providers helping to achieve constructor dependency injection. 
 
**Mockito** used to mock dependencies which are useful to during test cases. 


## Support

## Support

If you've found an error in this sample, please file an issue: [https://github.com/faiyyazs/flutter_registration_form/issues](https://github.com/faiyyazs/flutter_registration_form/issues)

Patches are encouraged, and may be submitted by forking this project and submitting a pull request through GitHub.


