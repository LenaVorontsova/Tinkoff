//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 1 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.color` struct is generated, and contains static references to 4 colors.
  struct color {
    /// Color `AccentColor`.
    static let accentColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "AccentColor")
    /// Color `tinkoffGray`.
    static let tinkoffGray = Rswift.ColorResource(bundle: R.hostingBundle, name: "tinkoffGray")
    /// Color `tinkoffLightGray`.
    static let tinkoffLightGray = Rswift.ColorResource(bundle: R.hostingBundle, name: "tinkoffLightGray")
    /// Color `tinkoffYellow`.
    static let tinkoffYellow = Rswift.ColorResource(bundle: R.hostingBundle, name: "tinkoffYellow")

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func accentColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.accentColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "tinkoffGray", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func tinkoffGray(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.tinkoffGray, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "tinkoffLightGray", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func tinkoffLightGray(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.tinkoffLightGray, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "tinkoffYellow", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func tinkoffYellow(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.tinkoffYellow, compatibleWith: traitCollection)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func accentColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.accentColor.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "tinkoffGray", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func tinkoffGray(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.tinkoffGray.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "tinkoffLightGray", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func tinkoffLightGray(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.tinkoffLightGray.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "tinkoffYellow", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func tinkoffYellow(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.tinkoffYellow.name)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.file` struct is generated, and contains static references to 1 files.
  struct file {
    /// Resource file `.swiftlint.yml`.
    static let swiftlintYml = Rswift.FileResource(bundle: R.hostingBundle, name: ".swiftlint", pathExtension: "yml")

    /// `bundle.url(forResource: ".swiftlint", withExtension: "yml")`
    static func swiftlintYml(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.swiftlintYml
      return fileResource.bundle.url(forResource: fileResource)
    }

    fileprivate init() {}
  }

  /// This `R.image` struct is generated, and contains static references to 1 images.
  struct image {
    /// Image `tinkoffIcon`.
    static let tinkoffIcon = Rswift.ImageResource(bundle: R.hostingBundle, name: "tinkoffIcon")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "tinkoffIcon", bundle: ..., traitCollection: ...)`
    static func tinkoffIcon(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.tinkoffIcon, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.string` struct is generated, and contains static references to 4 localization tables.
  struct string {
    /// This `R.string.alertMessages` struct is generated, and contains static references to 6 localization keys.
    struct alertMessages {
      /// Value: Error
      static let errorTitle = Rswift.StringResource(key: "errorTitle", tableName: "AlertMessages", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: OK
      static let okTitle = Rswift.StringResource(key: "okTitle", tableName: "AlertMessages", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Вы запретили использовать ваше местоположение
      static let denied = Rswift.StringResource(key: "denied", tableName: "AlertMessages", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Определение местоположения ограничено
      static let restricted = Rswift.StringResource(key: "restricted", tableName: "AlertMessages", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Проверьте разрешение на использование вашего метсоположения
      static let checkResolution = Rswift.StringResource(key: "checkResolution", tableName: "AlertMessages", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Что-то пошло не так
      static let somethingWrong = Rswift.StringResource(key: "somethingWrong", tableName: "AlertMessages", bundle: R.hostingBundle, locales: [], comment: nil)

      /// Value: Error
      static func errorTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("errorTitle", tableName: "AlertMessages", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "AlertMessages", preferredLanguages: preferredLanguages) else {
          return "errorTitle"
        }

        return NSLocalizedString("errorTitle", tableName: "AlertMessages", bundle: bundle, comment: "")
      }

      /// Value: OK
      static func okTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("okTitle", tableName: "AlertMessages", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "AlertMessages", preferredLanguages: preferredLanguages) else {
          return "okTitle"
        }

        return NSLocalizedString("okTitle", tableName: "AlertMessages", bundle: bundle, comment: "")
      }

      /// Value: Вы запретили использовать ваше местоположение
      static func denied(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("denied", tableName: "AlertMessages", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "AlertMessages", preferredLanguages: preferredLanguages) else {
          return "denied"
        }

        return NSLocalizedString("denied", tableName: "AlertMessages", bundle: bundle, comment: "")
      }

      /// Value: Определение местоположения ограничено
      static func restricted(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("restricted", tableName: "AlertMessages", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "AlertMessages", preferredLanguages: preferredLanguages) else {
          return "restricted"
        }

        return NSLocalizedString("restricted", tableName: "AlertMessages", bundle: bundle, comment: "")
      }

      /// Value: Проверьте разрешение на использование вашего метсоположения
      static func checkResolution(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("checkResolution", tableName: "AlertMessages", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "AlertMessages", preferredLanguages: preferredLanguages) else {
          return "checkResolution"
        }

        return NSLocalizedString("checkResolution", tableName: "AlertMessages", bundle: bundle, comment: "")
      }

      /// Value: Что-то пошло не так
      static func somethingWrong(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("somethingWrong", tableName: "AlertMessages", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "AlertMessages", preferredLanguages: preferredLanguages) else {
          return "somethingWrong"
        }

        return NSLocalizedString("somethingWrong", tableName: "AlertMessages", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    /// This `R.string.cells` struct is generated, and contains static references to 3 localization keys.
    struct cells {
      /// Value: attractionsCell
      static let attractionsCell = Rswift.StringResource(key: "attractionsCell", tableName: "Cells", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: init(coder:) has not been implemented
      static let fatalError = Rswift.StringResource(key: "fatalError", tableName: "Cells", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: newsCell
      static let newsCell = Rswift.StringResource(key: "newsCell", tableName: "Cells", bundle: R.hostingBundle, locales: [], comment: nil)

      /// Value: attractionsCell
      static func attractionsCell(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("attractionsCell", tableName: "Cells", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Cells", preferredLanguages: preferredLanguages) else {
          return "attractionsCell"
        }

        return NSLocalizedString("attractionsCell", tableName: "Cells", bundle: bundle, comment: "")
      }

      /// Value: init(coder:) has not been implemented
      static func fatalError(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("fatalError", tableName: "Cells", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Cells", preferredLanguages: preferredLanguages) else {
          return "fatalError"
        }

        return NSLocalizedString("fatalError", tableName: "Cells", bundle: bundle, comment: "")
      }

      /// Value: newsCell
      static func newsCell(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("newsCell", tableName: "Cells", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Cells", preferredLanguages: preferredLanguages) else {
          return "newsCell"
        }

        return NSLocalizedString("newsCell", tableName: "Cells", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    /// This `R.string.modules` struct is generated, and contains static references to 3 localization keys.
    struct modules {
      /// Value: Места
      static let attractionTitleRus = Rswift.StringResource(key: "attractionTitleRus", tableName: "Modules", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Новости
      static let newsTitleRus = Rswift.StringResource(key: "newsTitleRus", tableName: "Modules", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Питание
      static let cateringTitleRus = Rswift.StringResource(key: "cateringTitleRus", tableName: "Modules", bundle: R.hostingBundle, locales: [], comment: nil)

      /// Value: Места
      static func attractionTitleRus(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("attractionTitleRus", tableName: "Modules", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Modules", preferredLanguages: preferredLanguages) else {
          return "attractionTitleRus"
        }

        return NSLocalizedString("attractionTitleRus", tableName: "Modules", bundle: bundle, comment: "")
      }

      /// Value: Новости
      static func newsTitleRus(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("newsTitleRus", tableName: "Modules", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Modules", preferredLanguages: preferredLanguages) else {
          return "newsTitleRus"
        }

        return NSLocalizedString("newsTitleRus", tableName: "Modules", bundle: bundle, comment: "")
      }

      /// Value: Питание
      static func cateringTitleRus(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("cateringTitleRus", tableName: "Modules", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Modules", preferredLanguages: preferredLanguages) else {
          return "cateringTitleRus"
        }

        return NSLocalizedString("cateringTitleRus", tableName: "Modules", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    /// This `R.string.services` struct is generated, and contains static references to 7 localization keys.
    struct services {
      /// Value: MapData
      static let mapData = Rswift.StringResource(key: "mapData", tableName: "Services", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: NewsData
      static let newsData = Rswift.StringResource(key: "newsData", tableName: "Services", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: lat
      static let lat = Rswift.StringResource(key: "lat", tableName: "Services", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: lng
      static let lng = Rswift.StringResource(key: "lng", tableName: "Services", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: photoPath
      static let photoPath = Rswift.StringResource(key: "photoPath", tableName: "Services", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: text
      static let text = Rswift.StringResource(key: "text", tableName: "Services", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: title
      static let title = Rswift.StringResource(key: "title", tableName: "Services", bundle: R.hostingBundle, locales: [], comment: nil)

      /// Value: MapData
      static func mapData(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("mapData", tableName: "Services", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Services", preferredLanguages: preferredLanguages) else {
          return "mapData"
        }

        return NSLocalizedString("mapData", tableName: "Services", bundle: bundle, comment: "")
      }

      /// Value: NewsData
      static func newsData(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("newsData", tableName: "Services", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Services", preferredLanguages: preferredLanguages) else {
          return "newsData"
        }

        return NSLocalizedString("newsData", tableName: "Services", bundle: bundle, comment: "")
      }

      /// Value: lat
      static func lat(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("lat", tableName: "Services", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Services", preferredLanguages: preferredLanguages) else {
          return "lat"
        }

        return NSLocalizedString("lat", tableName: "Services", bundle: bundle, comment: "")
      }

      /// Value: lng
      static func lng(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("lng", tableName: "Services", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Services", preferredLanguages: preferredLanguages) else {
          return "lng"
        }

        return NSLocalizedString("lng", tableName: "Services", bundle: bundle, comment: "")
      }

      /// Value: photoPath
      static func photoPath(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("photoPath", tableName: "Services", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Services", preferredLanguages: preferredLanguages) else {
          return "photoPath"
        }

        return NSLocalizedString("photoPath", tableName: "Services", bundle: bundle, comment: "")
      }

      /// Value: text
      static func text(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("text", tableName: "Services", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Services", preferredLanguages: preferredLanguages) else {
          return "text"
        }

        return NSLocalizedString("text", tableName: "Services", bundle: bundle, comment: "")
      }

      /// Value: title
      static func title(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("title", tableName: "Services", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Services", preferredLanguages: preferredLanguages) else {
          return "title"
        }

        return NSLocalizedString("title", tableName: "Services", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
