import Foundation
import DVR

func folderLocationForFixtures() -> FolderReference {
    var file = #file
    file = NSString(string: file).deletingLastPathComponent
    let path = [file, "Fixtures"].joined(separator: "/")

    let location = FolderReference(rootDirectory: path)
    return location
}

let fileLocation: FileLocation = {
    let isSPMTest = ProcessInfo.processInfo.environment["SPM"] != nil
    return isSPMTest ? folderLocationForFixtures() : Bundle(for: SessionTests.self)
}()

func makeTestSession(outputDirectory: String = "~/Desktop/DVR/", cassetteName: String, backingSession: URLSession = URLSession.shared) -> Session {
    return Session(outputDirectory: outputDirectory, cassetteName: cassetteName, testBundle: fileLocation, backingSession: backingSession)
}
