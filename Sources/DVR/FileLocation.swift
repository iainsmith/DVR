import Foundation

/// A file location 
public protocol FileLocation {
    func path(forResource: String?, ofType: String?) -> String?
}

extension Bundle: FileLocation {}

public class FolderReference: FileLocation {
    let rootDirectory: NSString

    public init(rootDirectory: String) {
        self.rootDirectory = NSString(string: rootDirectory)
    }

    public func path(forResource: String?, ofType: String?) -> String? {
        guard let resource = forResource, let type = ofType else { return nil }
        let path = NSString(string: rootDirectory.appendingPathComponent(resource))
        return path.appendingPathExtension(type)
    }
}

public func defaultFileLocationForCurrentPlatform() -> FileLocation {
    #if os(macOS) || os(iOS) || os(watchOS) || os(tvOS)
    return Bundle.allBundles.filter() { $0.bundlePath.hasSuffix(".xctest") }.first!
    #else
    return FolderReference(rootDirectory: "./Fixtures")
    #endif
}
